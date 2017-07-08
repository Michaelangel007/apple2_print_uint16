.feature labels_without_colons
.export _printu 

        .org $800

        LDA #$12
        LDX #$34
        JMP _printu

_printu
.include "print_uint16_sans_zp.s"

