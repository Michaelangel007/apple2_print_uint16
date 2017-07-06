# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit in 91 bytes ($5B).

Features:

* No zero-page usage
* Only 2 ROM entry points: COUT, SCRN2
* Includes 7 byte demo

# Machine Code

Copy/Paste into your favorite emulator.

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:61 08 48 A2 00 8E 5D 08
0810:8E 5E 08 8E 5F 08 A2 10
0818:F8 0E 61 08 68 2A 48 A0
0820:FD B9 60 07 79 60 07 99
0828:60 07 C8 D0 F4 CA D0 E9
0830:68 D8 A0 03 B9 5C 08 20
0838:41 08 88 D0 F7 8A F0 11
0840:60 48 20 7B F8 20 4B 08
0848:68 29 0F D0 04 E0 00 F0
0850:EF C9 0A 90 02 69 06 69
0858:B0 E8 4C ED FD 00 00 00
0860:00 00
```


# License

[WTFPL](http://www.wtfpl.net/)


# Thanks

* qkumba for great optimization ideas as always
* Everyone on comp.sys.apple2


# References

* [printm](https://github.com/Michaelangel007/apple2_printm)

Apple Monitor: Print Integer?
* https://groups.google.com/forum/m/#!topic/comp.sys.apple2/EQmJAuNz8Vg 

