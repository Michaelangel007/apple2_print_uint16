# Print unsigned 16-bit

6502 assembly code to print an unsigned 16-bit in 124 bytes ($7C).

# Machine Code

```asm
0800:A9 12 A2 34 4C 07 08 8E
0808:81 08 8D 82 08 A9 00 8D
0810:6F 08 8D 77 08 8D 78 08
0818:8D 79 08 A2 10 F8 0E 81
0820:08 2E 82 08 A0 FD B9 7A
0828:07 79 7A 07 99 7A 07 C8
0830:D0 F4 CA D0 E9 D8 A0 03
0838:B9 77 08 20 5B 08 88 10
0840:F7 C8 CC 6F 08 F0 07 B9
0848:7B 08 C9 B0 F0 F3 B9 7B
0850:08 20 ED FD C8 CC 6F 08
0858:90 F4 60 48 4A 4A 4A 4A
0860:20 64 08 68 29 0F C9 0A
0868:90 02 69 06 69 B0 A2 00
0870:9D 7B 08 EE 6F 08 60 00
0878:00 00 00 00 00 00 00 00
0880:00 00 00 
```

# License

[WTFPL](http://www.wtfpl.net/)

# References

* [printm](https://github.com/Michaelangel007/apple2_printm)

Apple Monitor: Print Integer?
* https://groups.google.com/forum/m/#!topic/comp.sys.apple2/EQmJAuNz8Vg 

