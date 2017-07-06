# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit.

Features:

* Highly optimized for space
* No zero-page usage   [version](print_uint16.s)    90 ($5A) bytes
* With zero-page usage [version](print_uint16_zp.s) 78 ($4E) bytes
* With stack var usage [version](print_uint16_sp.s) 92 ($5C) bytes
* Only 2 ROM entry points: COUT, SCRN2
* Includes 7 byte demo

# Machine Code

Copy/Paste into your favorite emulator.

Sans-Zero-Page version:

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:60 08 48 A2 00 8E 5D 08
0810:8E 5E 08 8E 5F 08 A2 10
0818:F8 0E 60 08 68 2A 48 A0
0820:FD B9 60 07 79 60 07 99
0828:60 07 C8 D0 F4 CA D0 E9
0830:68 D8 A0 03 B9 5C 08 20
0838:41 08 88 D0 F7 8A F0 11
0840:60 48 20 7B F8 20 4B 08
0848:68 29 0F D0 04 E0 00 F0
0850:EF C9 0A 90 02 69 06 69
0858:B0 E8 4C ED FD 00 00 00
0860:00 
```

With-Zero-Page version:

```asm
0900:A9 12 A2 34 4C 07 09 86
0908:FC 48 A0 00 84 FD 84 FE
0910:84 FF A0 10 F8 06 FC 68
0918:2A 48 A2 FD B5 00 75 00
0920:95 00 E8 D0 F7 88 D0 ED
0928:68 D8 A0 03 B9 FC 00 20
0930:39 09 88 D0 F7 8A F0 11
0938:60 48 20 7B F8 20 43 09
0940:68 29 0F D0 04 E0 00 F0
0948:EF C9 0A 90 02 69 06 69
0950:B0 E8 4C ED FD 
```

With-Stack-Page version:

```asm
0900:A9 12 A2 34 4C 07 09 A0
0908:00 48 DA 5A 5A 5A A0 10
0910:F8 BA 8E 30 09 1E 04 01
0918:3E 05 01 20 3C 09 20 3C
0920:09 20 3C 09 88 D0 EA D8
0928:BD 00 01 20 47 09 CA E0
0930:00 D0 F5 8A 69 04 AA 9A
0938:98 F0 1C 60 BD 01 01 7D
0940:01 01 9D 01 01 E8 60 48
0948:20 7B F8 20 51 09 68 29
0950:0F D0 04 C0 00 F0 E4 C9
0958:0A 90 02 69 06 69 B0 C8
0960:4C ED FD 
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

