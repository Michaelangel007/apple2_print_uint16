; Michael Pohoreski
; https://github.com/Michaelangel007/apple2_print_uint16
; Optimized from printm
; Thanks to qkumba for optimizations
; Thanks to Gids for nudging a zero-page version

; F8 ROM Entry Points
COUT    = $FDED
SCRN2   = $F879

        ORG $A00 ; Intentionally different from sans-zero-page & with-zero-page

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Print unsigned 16-bit integer
; A=High byte
; X=Low  byte
; Also see: Applesoft LINPRT @ ED24
; ======================================================================
PrintUint16
        LDY #0          ;                         S=F3
        PHA             ; S+5 = _temp+1 = $105,X  S=F1
        PHX             ; S+4 = _temp+0 = $104,X  S=F2
        PHY             ; S+3 = _bcd[2] = $103,X  S=F0
        PHY             ; S+2 = _bcd[1] = $102,X  S=EF
        PHY             ; S+1 = _bcd[0] = $101,X  S=EE

Dec2BCD
        LDY   #16       ; 16 bits
        SED             ; "Double Dabble"
_Dec2BCD                ; https://en.wikipedia.org/wiki/Double_dabble
        TSX             ;                         X=EE
        STX _BCDbegin+1 ; *** SELF-MODIFYING

;       ASL _temp+0     ;     abcd efgh | ijkl mnop |
;       ROL _temp+1     ; C=a bcde fghi | jklm nop0 |
;                       ; Bit 7654_3210 | 7654_3210 |
        ASL $104,X      ; _temp+0
        ROL $105,X      ; _temp+1

;       LDX #$FD        ; $00-$FD=-3 bcd[0] bcd[1] bcd[2] bcd[3]
_DoubleDabble           ;              Y=FD   Y=FE   Y=FF   Y=00
        JSR Dabble      ;                         X=EF
        JSR Dabble      ;                         X=F0
        JSR Dabble      ;                         X=F1
        DEY
        BNE _Dec2BCD

        CLD             ; Y=0 = output length

BCD2Chars
        LDA $100,X      ; X=F1, 1F1 -> bcd[2]
        JSR HexA        ; print 0, 1, or 2 hex digits
        DEX
_BCDbegin
        CPX #00         ; *** SELF-MODIFIED  X == EE ?
        BNE BCD2Chars

; Safe to restore stack now since we are done with vars
        TXA
        ADC #$04        ; C=1 from CPX #EE
        TAX
        TXS

        TYA             ; Handle special case input = $0000 of no output
        BEQ _HaveLeadingDigit
_PrintDone
        RTS
Dabble
        LDA $101,X      ; bcd,X
        ADC $101,X
        STA $101,X
        INX
        RTS

; Converts A to high ASCII digits, prints as they become available
; @return: A will be bottom nibble in high ASCII
HexA
        PHA
        JSR SCRN2+2     ; LSR x4 == 0>> 4
        JSR _HexNib
        PLA
        AND #$F
_HexNib
        BNE _HaveLeadingDigit   ; If have leading zero and no output yet ...
        DEY                     ; ... then skip storing it

_HaveLeadingDigit
        INY             ; Y = output string length
        BEQ _PrintDone

        CMP #$A         ; n < 10 ?
        BCC _Hex2Asc
        ADC #6          ; n += 6    $A -> +6 + (C=1) = $11
_Hex2Asc
        ADC #'0' + $80  ; inverse=remove #$80
PutChar
        JMP COUT

