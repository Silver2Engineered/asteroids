; #########################################################################
;
;   lines.asm - Assembly file for CompEng205 Assignment 2
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include stars.inc
include lines.inc

.DATA

	;; If you need to, you can place global variables here
	
.CODE

DrawLine PROC USES eax ebx ecx edx x0:DWORD, y0:DWORD, x1:DWORD, y1:DWORD, color:DWORD

LOCAL delta_x: DWORD, delta_y: DWORD, inc_x: DWORD, inc_y: DWORD, error: DWORD, curr_x: DWORD, curr_y: DWORD, prev_error: DWORD


	mov eax, x1
	sub eax, x0
	mov delta_x, eax
	cmp delta_x, 0
	jge positive_x
	neg delta_x
	mov inc_x, -1
	jmp cont_x
positive_x:
	mov inc_x, 1



cont_x:
	mov eax, y1
	sub eax, y0
	mov delta_y, eax
	cmp delta_y, 0
	jge positive_y
	neg delta_y
	mov inc_y, -1
	jmp cont_y
positive_y:
	mov inc_y, 1



cont_y:
	mov eax, delta_y
	cmp delta_x, eax
	jle other_cond
	mov edx, 0
	mov eax, delta_x
	mov ecx, 2
	div ecx
	mov error, eax
	jmp draw_pix
other_cond: 
	mov edx, 0
	mov eax, delta_y
	mov ecx, 2
	div ecx
	neg eax
	mov error, eax



draw_pix:
	mov ebx, x0
	mov curr_x, ebx
	mov ebx, y0
	mov curr_y, ebx
	invoke DrawPixel, curr_x, curr_y, color
	jmp eval

do:
	invoke DrawPixel, curr_x, curr_y, color
	mov ebx, error
	mov prev_error, ebx ;prev_error = error
	
	mov eax, delta_x
	neg eax
	cmp prev_error, eax
	jle condition_2

	mov eax, delta_y ;if prev_error > -delta_x
	sub error, eax
	mov ebx, inc_x
	add curr_x, ebx

condition_2:
	mov eax, delta_y
	cmp prev_error, eax
	jge eval
	mov eax, delta_x ;if prev_error < delta_y
	add error, eax ;error += delta_x
	mov eax, inc_y
	add curr_y, eax

eval:
	mov ebx, x1
	cmp curr_x, ebx
	jne do
	mov ebx, y1
	cmp curr_y, ebx
	jne do

	ret        	;;  Don't delete this line...you need it
DrawLine ENDP




END
