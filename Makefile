TARGETS=print_uint16 print_uint16_zp print_uint16_sp
all: $(TARGETS)

.PHONY: clean dump
clean:
	rm $(TARGETS)

print_uint16: print_uint16.s
	merlin32  print_uint16.s

print_uint16_zp: print_uint16_zp.s
	merlin32     print_uint16_zp.s

print_uint16_sp: print_uint16_sp.s
	merlin32     print_uint16_sp.s

dump: $(TARGETS)
	hexdump8 print_uint16    800
	hexdump8 print_uint16_zp 900
	hexdump8 print_uint16_sp a00

