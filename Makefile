TARGETS=print_uint16_sans_zp print_uint16_with_zp print_uint16_with_sp \
        demo_sans_zp         demo_with_zp         demo_with_sp
all: $(TARGETS)

.PHONY: clean dump
clean:
	rm $(TARGETS)

demo_sans_zp: demo_sans_zp.s
	merlin32  demo_sans_zp.s

demo_with_zp: demo_with_zp.s
	merlin32  demo_with_zp.s

demo_with_sp: demo_with_sp.s
	merlin32  demo_with_sp.s

print_uint16_sans_zp: print_uint16_sans_zp.s
	merlin32          print_uint16_sans_zp.s

print_uint16_with_zp: print_uint16_with_zp.s
	merlin32          print_uint16_with_zp.s

print_uint16_with_sp: print_uint16_with_sp.s
	merlin32          print_uint16_with_sp.s

dump: $(TARGETS)
	hexdump8 demo_sans_zp 800
	hexdump8 demo_with_zp 900
	hexdump8 demo_with_sp a00

