      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include trig.inc
include blit.inc
include game.inc

.DATA

ufo EECS205BITMAP <60, 60, 000h,, offset ufo + sizeof ufo>
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,09bh,09bh,09bh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,09bh,0bbh,0bbh,0bfh,0bfh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,0bbh,0bbh,0bbh,0bbh,09bh,0bbh,0bfh
	BYTE 0dfh,0ffh,0ffh,0ffh,0bfh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,0bbh,0bbh,0bbh,0bbh,09bh,0bbh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0bfh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0bbh
	BYTE 0bbh,0bbh,0bbh,09bh,0bfh,0ffh,0ffh,0ffh,0ffh,0dfh,0bfh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0bbh,0bbh,0bbh,09bh,0bfh
	BYTE 0ffh,0ffh,0ffh,0dfh,0bbh,09bh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,0bbh,0bbh,0bbh,09bh,0bbh,0ffh,0ffh,0ffh,0bfh,09bh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,056h
	BYTE 056h,056h,056h,07bh,0bbh,0bbh,0dfh,0ffh,0ffh,0bfh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 07bh,056h,056h,056h,056h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,056h,056h,056h,056h,056h,056h,056h,036h,07ah
	BYTE 09bh,0bfh,0ffh,0ffh,0bfh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,09bh,056h,056h,056h,056h
	BYTE 056h,056h,056h,056h,056h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h,07ah,09bh,0dfh,0ffh,0dfh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,09bh,07ah,056h,056h,056h,056h,056h,056h,056h
	BYTE 056h,056h,056h,000h,000h,000h,000h,000h,000h,000h,000h,056h,056h,056h,056h,056h
	BYTE 056h,056h,056h,056h,056h,076h,09ah,09bh,0bfh,0ffh,0ffh,0bfh,09bh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,09bh,09ah,076h,056h,056h,056h,056h,056h,056h,056h,056h,056h
	BYTE 056h,000h,000h,000h,000h,056h,056h,056h,056h,056h,056h,056h,056h,056h,07ah,0bah
	BYTE 0dah,0fah,0dah,0bbh,0dfh,0ffh,0ffh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh
	BYTE 0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,09bh
	BYTE 0bbh,0fah,0fah,0dah,0bah,07ah,056h,056h,056h,056h,056h,056h,056h,056h,056h,000h
	BYTE 056h,056h,056h,056h,056h,056h,056h,056h,09ah,0dah,0fah,0fah,0fah,0fah,0dah,0bbh
	BYTE 0dfh,0ffh,0dfh,09bh,0bbh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,0bbh,0bbh,0bbh,0bbh,0bbh,0bbh,0dah,0fah,0fah
	BYTE 0fah,0fah,0dah,09ah,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h
	BYTE 056h,056h,09ah,0dah,0fah,0fah,0fah,0fah,0dah,09ah,09bh,0bbh,0dfh,0ffh,0bbh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,0bbh,0bbh,0bbh,09bh,09ah,0dah,0fah,0fah,0fah,0fah
	BYTE 0dah,09ah,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h,056h,0bah,0fah,0fah
	BYTE 0fah,0fah,0dah,09ah,056h,056h,09bh,0bbh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,0bbh,09bh,056h,056h,09ah,0dah,0fah,0fah,0fah,0fah,0bah,056h
	BYTE 056h,056h,056h,056h,056h,056h,056h,056h,0bah,0fah,0fah,0fah,0fah,0dah,076h,056h
	BYTE 056h,09ah,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09ah,056h,056h,076h,0dah,0fah,0fah,0fah,0fah,0bah,056h,056h,056h,056h
	BYTE 056h,056h,056h,076h,0fah,0fah,0fah,0fah,0fah,07ah,056h,056h,09ah,0dah,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,0dah,09ah
	BYTE 056h,056h,07ah,0fah,0fah,0fah,0fah,0fah,076h,056h,056h,056h,056h,056h,056h,0bah
	BYTE 0fah,0fah,0fah,0fah,0dah,056h,056h,076h,0dah,0dah,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,0dah,0dah,076h,056h,056h,0dah
	BYTE 0fah,0fah,0fah,0fah,09ah,056h,056h,056h,056h,056h,056h,0bah,0fah,0fah,0fah,0fah
	BYTE 0dah,056h,056h,076h,0fah,0dah,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,0dah,0fah,076h,056h,056h,0dah,0fah,0fah,0fah,0fah
	BYTE 09ah,056h,056h,056h,056h,056h,056h,076h,0fah,0fah,0fah,0fah,0fah,07ah,056h,056h
	BYTE 0dah,0fah,0bah,07bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 07bh,0bah,0fah,0dah,056h,056h,07ah,0fah,0fah,0fah,0fah,0fah,076h,056h,056h,056h
	BYTE 032h,056h,056h,056h,0bah,0fah,0fah,0fah,0fah,0dah,076h,056h,076h,0dah,0dah,0bah
	BYTE 09bh,07bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,07bh,09bh,0bah,0dah,0dah,076h
	BYTE 056h,076h,0dah,0fah,0fah,0fah,0fah,0bah,056h,056h,056h,032h,031h,032h,056h,056h
	BYTE 056h,0bah,0fah,0fah,0fah,0fah,0dah,09ah,056h,056h,09ah,0dah,0dah,0bah,09bh,09bh
	BYTE 07bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh,09bh
	BYTE 09bh,09bh,09bh,07bh,09bh,09bh,0bah,0dah,0dah,09ah,056h,056h,09ah,0dah,0fah,0fah
	BYTE 0fah,0fah,0bah,056h,056h,056h,032h,031h,031h,031h,032h,056h,056h,056h,09ah,0dah
	BYTE 0fah,0fah,0fah,0fah,0dah,09ah,056h,076h,09ah,0bah,0dah,0bah,0bah,09bh,09bh,09bh
	BYTE 09bh,09bh,07bh,07bh,07bh,07bh,07bh,07bh,07bh,07bh,09bh,09bh,09bh,09bh,09bh,0bah
	BYTE 0bah,0dah,0bah,09ah,076h,056h,09ah,0dah,0fah,0fah,0fah,0fah,0dah,09ah,056h,056h
	BYTE 056h,032h,031h,031h,031h,00dh,031h,031h,032h,056h,056h,056h,09ah,0dah,0fah,0fah
	BYTE 0fah,0fah,0dah,0bah,09ah,076h,076h,09ah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah
	BYTE 0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,09ah,076h,076h,09ah
	BYTE 0bah,0dah,0fah,0fah,0fah,0fah,0dah,09ah,056h,056h,056h,032h,031h,031h,000h,031h
	BYTE 031h,031h,000h,031h,031h,031h,032h,056h,056h,056h,07ah,0bah,0dah,0fah,0fah,0fah
	BYTE 0fah,0dah,0dah,0bah,09ah,09ah,07ah,07ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah,09ah
	BYTE 09ah,09ah,09ah,09ah,07ah,07ah,09ah,09ah,0bah,0dah,0dah,0fah,0fah,0fah,0fah,0dah
	BYTE 0bah,07ah,056h,056h,056h,032h,031h,031h,031h,031h,031h,031h,000h,031h,031h,031h
	BYTE 031h,031h,031h,031h,032h,036h,036h,056h,056h,076h,09ah,0bah,0dah,0fah,0fah,0fah
	BYTE 0fah,0fah,0fah,0dah,0dah,0dah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0bah,0dah,0dah
	BYTE 0dah,0fah,0fah,0fah,0fah,0fah,0fah,0dah,0bah,09ah,076h,056h,056h,036h,036h,032h
	BYTE 031h,031h,031h,031h,031h,031h,031h,000h,000h,000h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,032h,032h,036h,036h,056h,056h,076h,07ah,09ah,0bah,0bah,0dah,0dah
	BYTE 0dah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0dah,0dah,0dah,0dah,0bah,0bah
	BYTE 09ah,07ah,076h,056h,056h,036h,036h,032h,032h,031h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,000h,000h,000h,000h,000h,031h,031h,031h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,032h,032h,036h,036h,056h,056h,056h,056h,056h,076h,076h,076h
	BYTE 076h,076h,076h,076h,076h,076h,076h,056h,056h,056h,056h,056h,036h,036h,032h,032h
	BYTE 031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,031h,031h,031h,031h,032h,032h,032h,032h,032h,032h,032h,032h
	BYTE 032h,032h,032h,032h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,031h,031h,031h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,031h,031h,031h,031h,02dh,02dh,02dh,02dh,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,031h,031h,031h,031h,031h,02dh,02dh,02dh,02dh,031h,031h,031h
	BYTE 031h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,031h,031h,031h,031h
	BYTE 031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02dh,02dh
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,02dh,02dh,02dh,02dh,000h,031h,096h,076h
	BYTE 052h,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh,02dh
	BYTE 02dh,02dh,02dh,052h,076h,096h,02dh,004h,02dh,02dh,02dh,02dh,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,02dh,02dh,0bfh,0dfh,0dfh,0dfh,0dfh,0bbh,0bbh,0bbh
	BYTE 096h,096h,076h,076h,072h,072h,072h,072h,076h,076h,096h,096h,0bbh,0bbh,0bbh,0dfh
	BYTE 0dfh,0dfh,0dfh,0bbh,02dh,02dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
	BYTE 000h,000h,000h,0dfh,0dfh,0dfh,0dfh,0dfh,09bh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	BYTE 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09bh,0dfh,0dfh,0dfh,0dfh
	BYTE 0dfh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h

END