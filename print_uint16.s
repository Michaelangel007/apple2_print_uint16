COUT = $FDED

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
        STA _len        ; output buffer len = num digits to print
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
        CLD

DecWidth
        LDY #3          ; intentional buffer overflow - 8 digit output for special case of $0000
BCD2Chars
        LDA _bcd,Y
        JSR HexA        ; _output[0..7] = '?'
        DEY
        BPL BCD2Chars

SkipLeadZero
        INY
        CPY _len
        BEQ OutDigits
        LDA _output,Y
        CMP #'0' + $80  ; skip all leading zero's
        BEQ SkipLeadZero

OutDigits
        LDA _output,Y   ; always print digit in "ones" place
        JSR COUT       
        INY
        CPY _len
        BCC OutDigits
_PrintDone
        RTS


; Converts A to Hex digits, stores two chars in _temp+0, _temp+1
; @return: A will be bottom nibble in ASCII
HexA
        PHA
        LSR
        LSR
        LSR
        LSR
        JSR _HexNib
        PLA
_HexNib
        AND #$F              ; Can NOT't Use ROM Entry Point SCRN2+2 as the Laser 128 leaves off AND #$F !!
        CMP #$A         ; n < 10 ?
        BCC _Hex2Asc
        ADC #6          ; n += 6    $A -> +6 + (C=1) = $11
_Hex2Asc
        ADC #'0' + $80  ; inverse=remove #$80
PutChar
        LDX #0          ; NOTE: length = PutChar+1
        STA _output,X
        INC _len
        RTS

_bcd    ds  4   ; 6 chars for printing dec
_len    = PutChar+1
_output ds  6   ; BCD -> 6 chars
_temp   db  0,0

