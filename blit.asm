      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include stars.inc
include lines.inc
include trig.inc
include blit.inc


.DATA

	;; If you need to, you can place global variables here
	screen_width DWORD 640
	screen_height DWORD 480
	
.CODE

DrawPixel PROC USES eax ebx ecx edx x:DWORD, y:DWORD, color:DWORD
	mov eax, y
	mov ebx, x
	cmp eax, screen_height
	jge continue
	cmp ebx, screen_width
	jge continue
	cmp eax, 0
	jle continue
	cmp ebx,0
	jle continue

	mov ebx, color
	imul screen_width ;eax = y * 640
	add eax, x ;eax = y*640+x
	mov edx, ScreenBitsPtr
	mov BYTE PTR [edx + eax], bl


continue:
	ret 			; Don't delete this line!!!
DrawPixel ENDP

BasicBlit PROC USES eax ebx ecx edx ptrBitmap:PTR EECS205BITMAP , xcenter:DWORD, ycenter:DWORD

;nested for loops that use DrawPixel to draw the bitmap contents to the screen
LOCAL trans_col: BYTE, width0: DWORD, height0: DWORD, bytes: DWORD, loop_ctr: DWORD, x0: DWORD, y0: DWORD, x1: DWORD, y1: DWORD



;store all input args in local vars
	mov ebx, ptrBitmap ;ebx points to first element in EECS205BITMAP
	mov cl, (EECS205BITMAP PTR [ebx]).bTransparent
	mov trans_col, cl
	mov ecx, (EECS205BITMAP PTR [ebx]).dwWidth
	mov width0, ecx
	mov ecx, (EECS205BITMAP PTR [ebx]).dwHeight
	mov height0, ecx
	xor ecx, ecx
	mov ecx, (EECS205BITMAP PTR [ebx]).lpBytes
	mov bytes, ecx
	mov loop_ctr, 0

;calculate x,y starting points
	sar width0, 1 ;width = width/2
	sar height0, 1;height = height/2
	mov ecx, width0
	mov edx, xcenter
	sub edx, ecx ;x0 = xcenter- width/2
	mov x0, edx
	add edx, ecx
	add edx, ecx ;x1 = x0 + width
	mov x1, edx
	mov ecx, height0
	mov edx, ycenter
	sub edx, ecx ;y0 = ycenter - height/2
	mov y0, edx
	add edx, ecx
	add edx, ecx ;y1 = y0 + height
	mov y1, edx

outer_loop:
	mov ecx, x1
	cmp x0, ecx ;if x1 < x0
	jge inner_loop ;change y
	mov ecx, bytes
	mov edx, loop_ctr
    mov al, BYTE PTR [ecx + edx] ;al = staring point + current index, in this case lpBytes + loop_ctr
	xor ecx, ecx ;clear out ecx
	mov cl, trans_col
	cmp al, cl ;if color==trans_col, don't draw pixel
	je increment
	mov ecx, bytes
	invoke DrawPixel, x0, y0, [ecx + edx] ;invoke drawPixel on x,y, with color al(lpBytes[loop_ctr])

increment:
	inc loop_ctr 
	inc x0
	jmp outer_loop ;repeat

inner_loop:
	inc y0
	mov ecx, y0
	cmp ecx, y1 ;if y1 < y0
	jge continue ;exit loops
	mov ecx, width0
	add ecx, width0
	sub x0, ecx ;x0 = x0 - width
	jmp outer_loop ;repeat loop

continue:
	ret 			; Don't delete this line!!!	
BasicBlit ENDP


RotateBlit PROC USES eax ebx ecx esi lpBmp:PTR EECS205BITMAP, xcenter:DWORD, ycenter:DWORD, angle:FXPT

LOCAL sin: DWORD, cos: DWORD,  trans_col: BYTE, width0: DWORD, height0: DWORD, bytes: DWORD, shiftX: DWORD,
 shiftY: DWORD, dstWidth: DWORD, dstHeight: DWORD, dstX: DWORD, dstY: DWORD, srcX: DWORD, srcY: DWORD
 
;initializations & local vars
	mov esi, lpBmp
	invoke FixedSin, angle
	mov sin, eax
	invoke FixedCos, angle
	mov cos, eax
	xor ecx, ecx
	mov cl, (EECS205BITMAP PTR [esi]).bTransparent
	mov trans_col, cl
	mov ecx, (EECS205BITMAP PTR [esi]).dwWidth
	mov width0, ecx
	mov ecx, (EECS205BITMAP PTR [esi]).dwHeight
	mov height0, ecx
	xor ecx, ecx
	mov ecx, (EECS205BITMAP PTR [esi]).lpBytes
	mov bytes, ecx

;initialization calculations
	;sfiftX = width0 * cos/2 - height0 * sin/2
	;shiftY = width0 * sin/2 + height0 + cos/2
	mov ebx, cos
	sar ebx, 1 ;cos/2
	mov eax, width0
	imul ebx ; eax = width0 * cos/2
	mov shiftX, eax ;shiftX = width0 * cos /2
	mov eax, height0
	imul ebx
	mov shiftY, eax ;shiftY = cos/2 * height
	mov ebx, sin
	sar ebx, 1 ;sin/2
	mov eax, height0
	imul ebx
	sub shiftX, eax ;shiftX - height * sin/2
	mov eax, width0
	imul ebx
	add shiftY, eax ;shiftY + width * sin/2
	;float -> int
	sar shiftX, 16
	sar shiftY, 16

;dstwidth = width + height = dstheight
	mov eax, width0
	add eax, height0
	mov dstWidth, eax
	mov dstHeight, eax
	
;for loop initializations
	;dstX = -dstWidth
	mov eax, dstWidth
	neg eax
	mov dstX, eax
	mov dstY, eax

outer_loop:
	;while dstx < dstwidth
	mov eax, dstWidth
	cmp dstX, eax
	jge continue

	;dsty = - dstheight: initialize inner loop
	mov eax, dstHeight
	neg eax
	mov dstY, eax

inner_eval:
	mov eax, dstHeight
	cmp dstY, eax
	jl inner_loop
	inc dstX ;increment and continue onto next iteration of outer loop
	jmp outer_loop

inner_loop:
	mov eax, dstX
	imul cos
	mov srcX, eax
	mov eax, dstY
	imul sin
	add srcX, eax
	mov eax, dstY
	imul cos
	mov srcY, eax
	mov eax, dstX
	imul sin
	sub srcY, eax ;set srcX & srcY
	sar srcX, 16
	sar srcY, 16

;check all if conditions; increment and jump to next iter if any fail
	cmp srcX, 0
	jl inc_jump
	mov eax, width0
	cmp srcX, eax
	jge inc_jump
	cmp srcY, 0
	jl inc_jump
	mov eax, height0
	cmp srcY, eax
	jge inc_jump
	mov eax, xcenter
	add eax, dstX
	sub eax, shiftX
	cmp eax, 0
	jl inc_jump
	cmp eax, 639
	jge inc_jump
	mov eax, ycenter
	add eax, dstY
	sub eax, shiftY
	cmp eax, 0
	jl inc_jump
	cmp eax, 479
	jge inc_jump
	xor ebx, ebx
	;find color
	mov eax, srcY
	imul width0
	add eax, srcX
	add eax, bytes
	mov bl, BYTE PTR [eax]
	cmp bl, trans_col ;if bit map pixel (srcX, srcY) == trans_col continue to next iter
	je inc_jump

;all conditions passed; we invoke DrawPixel
	mov ebx, xcenter
	add ebx, dstX
	sub ebx, shiftX
	mov ecx, ycenter
	add ecx, dstY
	sub ecx, shiftY
	invoke DrawPixel, ebx, ecx, BYTE PTR [eax]


inc_jump:
	inc dstY
	jmp inner_eval
	


continue:
	ret 			; Don't delete this line!!!		
RotateBlit ENDP



END
