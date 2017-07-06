TARGETS=print_uint16 print_uint16_zp
all: $(TARGETS)
.phony: dump

clean:
	rm $(TARGETS)

print_uint16: print_uint16.s
	merlin32  print_uint16.s

print_uint16_zp: print_uint16_zp.s
	merlin32     print_uint16_zp.s

dump: print_uint16 print_uint16_zp
	hexdump8 print_uint16    800
	hexdump8 print_uint16_zp 900

