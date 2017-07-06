# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit in 96 bytes ($60).

Features:

* No zero-page usage
* Only 2 ROM entry points: COUT, SCRN2
* Includes 7 byte demo

# Machine Code

Copy/Paste into your favorite emulator.

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:65 08 8D 66 08 A9 00 8D
0810:61 08 8D 62 08 8D 63 08
0818:A2 10 F8 0E 65 08 2E 66
0820:08 A0 FD B9 64 07 79 64
0828:07 99 64 07 C8 D0 F4 CA
0830:D0 E9 D8 A0 03 B9 60 08
0838:20 44 08 88 D0 F7 8A E0
0840:00 F0 11 60 48 20 7B F8
0848:20 4E 08 68 29 0F D0 04
0850:E0 00 F0 0C C9 0A 90 02
0858:69 06 69 B0 20 ED FD E8
0860:60 00 00 00 00 00 00 
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

