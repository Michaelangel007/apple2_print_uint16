# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit in 117 bytes ($75).


* No zero-page usage
* Only 1 ROM entry point: COUT
* Includes 7 byte demo

# Machine Code

Copy/Paste into your favorite emulator.

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:7A 08 8D 7B 08 A9 00 8D
0810:70 08 8D 71 08 8D 72 08
0818:A2 10 F8 0E 7A 08 2E 7B
0820:08 A0 FD B9 73 07 79 73
0828:07 99 73 07 C8 D0 F4 CA
0830:D0 E9 D8 A0 04 A9 B0 8D
0838:74 08 B9 6F 08 20 53 08
0840:88 D0 F7 8E 70 08 B9 74
0848:08 20 ED FD C8 CC 70 08
0850:90 F4 60 48 20 7B F8 20
0858:5D 08 68 29 0F D0 04 E0
0860:00 F0 0C C9 0A 90 02 69
0868:06 69 B0 9D 74 08 E8 60
0870:00 00 00 00 00 00 00 00
0878:00 00 00 00 
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

