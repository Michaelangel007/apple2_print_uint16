; Demo

        ORG $A00 ; Intentionally different from sans-zero-page & with-zero-page

        LDA #$12
        LDX #$34
        JMP PrintUint16

; Merlin32 include
        PUT print_uint16_with_sp.s

