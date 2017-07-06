; Michael Pohoreski
; Optimized from printm
; Thanks to qkumba for optimizations
; F8 ROM Entry Points
COUT    = $FDED
SCRN2   = $F879

        ORG $800

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Print unsigned 16-bit integer
; A=High byte
; X=Low  byte
; Also see: Applesoft LINPRT @ ED24
; ======================================================================
PrintUint16
        STX _temp+0
        STA _temp+1

        LDA #0
        STA _bcd+0
        STA _bcd+1
        STA _bcd+2

Dec2BCD
        LDX   #16       ; 16 bits
        SED             ; "Double Dabble"
_Dec2BCD                ; https://en.wikipedia.org/wiki/Double_dabble
        ASL _temp+0
        ROL _temp+1

        LDY #$FD        ; $00-$FD=-3 bcd[0] bcd[1] bcd[2] bcd[3]
_DoubleDabble           ;              Y=FD   Y=FE   Y=FF   Y=00
        LDA _bcd-$FD,Y
        ADC _bcd-$FD,Y
        STA _bcd-$FD,Y
        INY
        BNE _DoubleDabble

        DEX
        BNE _Dec2BCD
        CLD             ; X=0 = output length

DecWidth
        LDY #4          ; 6 digit output for special case of $0000

        LDA #'0' + $80  ; handle special case input = $0000
        STA _output     ; since we always print at least 1 digit

BCD2Chars
        LDA _bcd-1,Y
        JSR HexA        ; _output[0..7] = '?'
        DEY
        BNE BCD2Chars

        STX _len        ; output buffer len = num digits to print

OutDigits
        LDA _output,Y   ; always print digit in "ones" place
        JSR COUT
        INY
        CPY _len
        BCC OutDigits
_PrintDone
        RTS


; Converts A to high ASCII digits, stores chars in _output
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
        BEQ _HexAsciiDone

_HaveLeadingDigit
        CMP #$A         ; n < 10 ?

        BCC _Hex2Asc
        ADC #6          ; n += 6    $A -> +6 + (C=1) = $11
_Hex2Asc
        ADC #'0' + $80  ; inverse=remove #$80
PutChar
        STA _output,X
        INX             ; X = output string length
_HexAsciiDone
        RTS


_bcd    ds  4   ; 6 chars for printing dec
_len    = _bcd  ; alias
_output ds  6   ; BCD -> 6 chars
_temp   db  0,0

