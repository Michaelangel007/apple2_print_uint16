# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit in decimal -- 3 versions to pick from.

Features:

* Highly optimized for space
* [Sans zero-page usage](print_uint16_sans_zp.s) 79 ($4F) bytes
* [With zero-page usage](print_uint16_with_zp.s) 67 ($43) bytes
* [With stack var usage](print_uint16_with_sp.s) 83 ($53) bytes
* Only 2 ROM entry points used: PRHEXZ, SCRN2
* Includes 7 byte demo

# Machine Code

Copy/Paste into your favorite emulator.

Sans-Zero-Page version:

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:55 08 A2 00 8E 52 08 8E
0810:53 08 8E 54 08 A2 10 F8
0818:0E 55 08 2A 48 A0 FD B9
0820:55 07 79 55 07 99 55 07
0828:C8 D0 F4 68 CA D0 E9 D8
0830:A0 03 B9 51 08 20 3F 08
0838:88 D0 F7 8A F0 0E 60 48
0840:20 7B F8 20 49 08 68 29
0848:0F D0 01 CA E8 F0 EF 4C
0850:E5 FD 00 00 00 00
```

With-Zero-Page version:

```asm
0900:A9 12 A2 34 4C 07 09 86
0908:FC A0 00 84 FD 84 FE 84
0910:FF A0 10 F8 06 FC 2A 48
0918:A2 FD B5 00 75 00 95 00
0920:E8 D0 F7 68 88 D0 ED D8
0928:A0 03 B9 FC 00 20 37 09
0930:88 D0 F7 8A F0 0E 60 48
0938:20 7B F8 20 41 09 68 29
0940:0F D0 01 CA E8 F0 EF 4C
0948:E5 FD 
```

With-Stack-Page version:

```asm
0A00:A9 12 A2 34 4C 07 0A A0
0A08:00 48 DA 5A 5A 5A A0 10
0A10:F8 BA 8E 30 0A 1E 04 01
0A18:3E 05 01 20 3C 0A 20 3C
0A20:0A 20 3C 0A 88 D0 EA D8
0A28:BD 00 01 20 47 0A CA E0
0A30:00 D0 F5 8A 69 04 AA 9A
0A38:98 F0 19 60 BD 01 01 7D
0A40:01 01 9D 01 01 E8 60 48
0A48:20 7B F8 20 51 0A 68 29
0A50:0F D0 01 88 C8 F0 E4 4C
0A58:E5 FD
```

# License

[WTFPL](http://www.wtfpl.net/)


# Thanks

* qkumba for great optimization ideas as always
* Gids for a gentle nudge to have a zero-page version
* Everyone on comp.sys.apple2


# References

* [printm](https://github.com/Michaelangel007/apple2_printm)

Apple Monitor: Print Integer?
* https://groups.google.com/forum/m/#!topic/comp.sys.apple2/EQmJAuNz8Vg 

