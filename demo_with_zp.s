; Demo

        ORG $900 ; Intentionally different from sans-zero-page version for testing both

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Merlin32 include
        PUT print_uint16_with_zp.s

