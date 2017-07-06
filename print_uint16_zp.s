; Michael Pohoreski
; https://github.com/Michaelangel007/apple2_print_uint16
; Optimized from printm
; Thanks to qkumba for optimizations
; Thanks to Gids for nudging a zero-page version

; F8 ROM Entry Points
COUT    = $FDED
SCRN2   = $F879

; Zero-Page Version - 4 locations used
_temp   = $fc
_bcd    = $fd   ; NOTE: MUST be at $FD for ZP,X addressing in _DoubleDabble

        ORG $900 ; Intentionally different from sans-zero-page version for testing both

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Print unsigned 16-bit integer
; A=High byte
; X=Low  byte
; Also see: Applesoft LINPRT @ ED24
; ======================================================================
PrintUint16
        STX _temp  
        PHA             ; Optimized: STA _temp+1

        LDY #0
        STY _bcd+0
        STY _bcd+1
        STY _bcd+2

Dec2BCD
        LDY   #16       ; 16 bits
        SED             ; "Double Dabble"
_Dec2BCD                ; https://en.wikipedia.org/wiki/Double_dabble
        ASL _temp+0     ;     abcd efgh | ijkl mnop |
;       ROL _temp+1     ; C=a bcde fghi | jklm nop0 |
;                       ; Bit 7654_3210 | 7654_3210 |
        PLA
        ROL
        PHA

        LDX #$FD        ; $00-$FD=-3 bcd[0] bcd[1] bcd[2] bcd[3]
_DoubleDabble           ;              Y=FD   Y=FE   Y=FF   Y=00
        LDA _bcd-$FD,X  ; ZP,X
        ADC _bcd-$FD,X
        STA _bcd-$FD,X
        INX
        BNE _DoubleDabble
        DEY
        BNE _Dec2BCD

        PLA             ; keep stack
        CLD             ; X=0 = output length

DecWidth
        LDY #3          ; maximum 6 digits output
BCD2Chars
        LDA _bcd-1,Y
        JSR HexA        ; print 0, 1, or 2 hex digits
        DEY
        BNE BCD2Chars

        TXA             ; Handle special case input = $0000 of no output
        BEQ _HaveLeadingDigit

_PrintDone
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
        CPX #0                  ; ... then skip storing it
        BEQ _PrintDone

_HaveLeadingDigit
        CMP #$A         ; n < 10 ?
        BCC _Hex2Asc
        ADC #6          ; n += 6    $A -> +6 + (C=1) = $11
_Hex2Asc
        ADC #'0' + $80  ; inverse=remove #$80
PutChar
        INX             ; X = output string length
        JMP COUT

