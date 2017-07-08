; Demo

        ORG $800

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Merlin32 include
        PUT print_uint16_sans_zp.s

