; #########################################################################
;
;   game.asm - Assembly file for CompEng205 Assignment 4/5
;
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include stars.inc
include lines.inc
include trig.inc
include blit.inc
include game.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\masm32.lib
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib
;include \masm32\include\windows.inc
include \masm32\include\winmm.inc
includelib \masm32\lib\winmm.lib

;; Has keycodes
include keys.inc

	
.DATA
;; If you need to, you can place global variables here
angle FXPT 0
a_posn_x DWORD 100
a_posn_y DWORD 100
big_a_posn_x DWORD 400
big_a_posn_y DWORD 340
spaceship_posn_x DWORD 320
spaceship_posn_y DWORD 240
score DWORD 0
ps BYTE 0 ;pause is 0 when game is running and 1 when paused
gameover BYTE 0
pausestr BYTE "PAUSE", 0
winstr BYTE "Congratulations! You won the game!", 0
resumestr BYTE "PRESS SPACEBAR TO RESUME GAME", 0
gameoverstr BYTE "GAME OVER! Press the spacebar to restart.", 0
fstr BYTE "SCORE: %d", 0
outstr BYTE 256 DUP(0)
;ufo's fields
vx DWORD 0
vy DWORD 0
px DWORD 100
py DWORD 150
vx_sign DWORD 1
vy_sign DWORD 1
over_500 DWORD 0

.CODE
	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	INVOKE DrawPixel, ulx, uly, 0 ;;
;;	INVOKE DrawPixel, blx, bly, 0 ;;
;;	INVOKE DrawPixel, urx, ury, 0 ;;
;;	INVOKE DrawPixel, brx, bry, 0 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Note: You will need to implement CheckIntersect!!!
CheckIntersect PROC USES ebx ecx oneX:DWORD, oneY:DWORD, oneBitmap:PTR EECS205BITMAP, twoX:DWORD, twoY:DWORD, twoBitmap:PTR EECS205BITMAP
LOCAL oneWidth: DWORD, oneHeight: DWORD, twoWidth: DWORD, twoHeight: DWORD, one_ul: DWORD, one_ur: DWORD, one_bl: DWORD, one_br: DWORD, two_ul: DWORD, two_ur: DWORD, two_bl: DWORD, two_br: DWORD, one_uly: DWORD, one_ury: DWORD, one_bly: DWORD, one_bry: DWORD, two_uly: DWORD, two_ury: DWORD, two_bly: DWORD, two_bry: DWORD
;initialize local vars
mov eax, oneBitmap
	mov eax, oneBitmap
	mov ebx, (EECS205BITMAP PTR [eax]).dwWidth
	mov oneWidth, ebx
	sar oneWidth, 1
	mov ebx, (EECS205BITMAP PTR [eax]).dwHeight
	mov oneHeight, ebx
	sar oneHeight, 1

	mov eax, twoBitmap
	mov ebx, (EECS205BITMAP PTR [eax]).dwWidth
	mov twoWidth, ebx
	sar twoWidth, 1
	mov ebx, (EECS205BITMAP PTR [eax]).dwHeight
	mov twoHeight, ebx
	sar twoHeight, 1
	;divide all elements by 2 to make calculations easier (closer to radius)

;fill in corners: one x 
	mov eax, oneX
	sub eax, oneWidth
	mov one_bl, eax
	mov one_ul, eax
	mov eax, oneX
	add eax, oneWidth
	mov one_br, eax
	mov one_ur, eax

;fill in corners: one y
	mov eax, oneY
	sub eax, oneHeight
	mov one_uly, eax
	mov one_ury, eax
	mov eax, oneY
	add eax, oneHeight
	mov one_bly, eax
	mov one_bry, eax

;fill in corners: two x
	mov eax, twoX
	sub eax, twoWidth
	mov two_bl, eax
	mov two_ul, eax
	mov eax, twoX
	add eax, twoWidth
	mov two_br, eax
	mov two_ur, eax

;fill in corners: two y
	mov eax, twoY
	sub eax, twoHeight
	mov two_uly, eax
	mov two_ury, eax
	mov eax, twoY
	add eax, twoHeight
	mov two_bry, eax
	mov two_bly, eax

	 	;INVOKE DrawLine,oneX, oneY, one_ul, one_uly, 255
		;INVOKE DrawLine,twoX, twoY, two_ul, two_uly, 255
;check if one's lower right to two's upper right
	mov ebx, one_bry
	mov ecx, two_ury
	cmp ebx, ecx
	jl ret_zero ;if 1 lies entirely above 2, then there can't be any intersection

	mov ebx, one_ury
	mov ecx, two_bry
	cmp ebx, ecx
	jg ret_zero 

	mov ebx, one_br
	mov ecx, two_bl
	cmp ebx, ecx
	jl ret_zero ;if 1 lies below above 2, then there can't be any intersection

	mov ebx, one_bl
	mov ecx, two_br
	cmp ebx, ecx
	jg ret_zero

;now, we know that they intersect
	mov eax, 1
	jmp done

ret_zero:
	xor eax, eax

done:
	ret
CheckIntersect ENDP

GameInit PROC USES eax ebx ecx edx
;draw galaxy background and spaceship and one asteroid
invoke BasicBlit, offset galaxy, 320, 240
invoke BasicBlit, offset spaceship, spaceship_posn_x, spaceship_posn_y
invoke DrawStr, offset pausestr, 10, 40, 255

	
	ret         ;; Do not delete this line!!!
GameInit ENDP


GamePlay PROC USES eax ebx ecx edx edi esi
;reinvoke background (clear screen)
	invoke BasicBlit, offset galaxy, 320, 240
	cmp gameover, 0
	jne gameover_instr
	cmp ps, 0
	jne pause_instr
	cmp score, 1000
	jge win
	cmp over_500, 1
	je cont
	cmp score, 500
	jge inc_vel
cont:
	add angle, 2500h ;spin ufo for visual effect
	invoke DrawStr, offset pausestr, 10, 40, 255
	invoke BasicBlit, offset spaceship, spaceship_posn_x, spaceship_posn_y 
	invoke BasicBlit, offset asteroid, a_posn_x, a_posn_y
	invoke BasicBlit, offset big_asteroid, big_a_posn_x, big_a_posn_y
	invoke RotateBlit, offset ufo, px, py, angle
;update score
	mov eax, score
	push eax
	push offset fstr
	push offset outstr
	call wsprintf
	add esp, 12
	invoke DrawStr, offset outstr, 520, 40, 255


;check to see if the spaceship's position has changed
	mov eax, KeyPress
	cmp eax, VK_LEFT
	je left_click
	cmp eax, VK_RIGHT
	je right_click
	cmp eax, VK_UP
	je up
	cmp eax, VK_DOWN
	je down
	jmp ufo_update

left_click:
	cmp over_500, 1
	je lc2
	sub spaceship_posn_x, 15
	jmp ufo_update

lc2:
	sub spaceship_posn_x, 30
	jmp ufo_update
	
right_click:
	cmp over_500, 1
	je rc2
	add spaceship_posn_x, 15
	jmp ufo_update

rc2:
	add spaceship_posn_x, 30
	jmp ufo_update

up:
	cmp over_500, 1
	je u2
	sub spaceship_posn_y, 15
	jmp ufo_update

u2:
	sub spaceship_posn_y, 30
	jmp ufo_update

down:
	cmp over_500, 1
	je d2
	add spaceship_posn_y, 15
	jmp ufo_update

d2:
	add spaceship_posn_y, 30

ufo_update:
;ufo stuff: adjust ufo's posn
	mov eax, vx
	add px, eax
	mov eax, vy
	add py, eax
	mov ebx, vx_sign
	add vx, ebx
	mov ebx, vy_sign
	add vy, ebx

ufo_check:
;make sure that the object is within screen bounds before drawing
 	cmp px, 639
	jl posn_2
	sub px, 5
	mov vx, 0
	neg vx_sign
posn_2:
 	cmp px, 1
	jg posn_3
	add px, 5
	mov vx, 0
	neg vx_sign
posn_3:
	cmp py, 479
	jl posn_4
	sub py, 5
	mov vy, 0
	neg vy_sign
posn_4:
	cmp py, 1
	jg ufo_intersect
	add py, 5
	mov vy, 0
	neg vy_sign


ufo_intersect:
	invoke CheckIntersect, spaceship_posn_x, spaceship_posn_y, offset spaceship, px, py, offset ufo
	cmp eax, 1
	jne first_check
	inc gameover
	jmp gameover_instr

first_check:
;make sure that the object is within screen bounds before drawing
 	cmp spaceship_posn_x, 639
	jg reset_posn_1
 	cmp spaceship_posn_x, 1
	jl reset_posn_2
	cmp spaceship_posn_y, 479
	jg reset_posn_3
	cmp spaceship_posn_y, 1
	jl reset_posn_4
	jmp draw_spaceship
reset_posn_1:
	mov spaceship_posn_x, 1
	jmp first_check
reset_posn_2:
	mov spaceship_posn_x, 639
	jmp first_check
reset_posn_3:
	mov spaceship_posn_y, 1
	jmp first_check
reset_posn_4:
	mov spaceship_posn_y, 479
	jmp first_check
	
draw_spaceship:
;detect collision
	invoke CheckIntersect, spaceship_posn_x, spaceship_posn_y, offset spaceship, a_posn_x, a_posn_y, offset asteroid
	cmp eax, 1
	jne check_intersect_big
	add score, 25

intersect:
	rdtsc ;eax now holds a random DWORD
	mov edi, 639
	xor edx, edx
	div edi
	mov a_posn_x, edx
	rdtsc ;eax now holds a random DWORD
	mov edi, 479
	xor edx, edx
	div edi
	mov a_posn_y, edx

;make sure that the object is within screen bounds before drawing
 	cmp a_posn_x, 589
	jg intersect
 	cmp a_posn_x, 50
	jl intersect
	cmp a_posn_y, 429
	jg intersect
	cmp a_posn_y, 50
	jl intersect

check_intersect_big:
	invoke CheckIntersect, spaceship_posn_x, spaceship_posn_y, offset spaceship, big_a_posn_x, big_a_posn_y, offset big_asteroid
	cmp eax, 1
	jne next
	add score, 10

big_intersect:
	rdtsc ;eax now holds a random DWORD
	mov edi, 639
	xor edx, edx
	div edi
	mov big_a_posn_x, edx
	rdtsc ;eax now holds a random DWORD
	mov edi, 479
	xor edx, edx
	div edi
	mov big_a_posn_y, edx

;make sure that the object is within screen bounds before drawing
	cmp big_a_posn_x, 539
	jg big_intersect
 	cmp big_a_posn_x, 100
	jl big_intersect
	cmp big_a_posn_y, 379
	jg big_intersect
	cmp big_a_posn_y, 100
	jl big_intersect
	jmp next

pause_instr:
;we only reach this branch if ps is 1 (the game is paused)
	invoke DrawStr, offset resumestr, 200, 50, 255
	mov ebx, KeyPress
	cmp ebx, VK_SPACE
	jne done ;if nothing is pressed, continue onto next iteration
;otherwise, resume game
	dec ps
	jmp done

next: 
; we reach this if ps is 0 (the game is not paused)
	mov ebx, MouseStatus.buttons
	cmp ebx, MK_LBUTTON
	jne p_key ;if nothing is pressed, check P key
	mov eax, MouseStatus.horiz
	mov ebx, eax
	mov eax, MouseStatus.vert
	mov ecx, eax ;mouse posn at (ebx, ecx)
	cmp ebx, 75
	jg p_key
	cmp ecx, 75
	jg p_key
	inc ps
	jmp done
p_key:
	mov eax, KeyPress ;or, if P is pressed
	cmp eax, VK_P
	jne done
	inc ps; user clicked on puase button; change mode to paused
	jmp done

inc_vel:
	inc over_500 ;turn the over_500 var to be 1
	jmp done

gameover_instr:
;we only reach this branch if gameover is 1 (the player has lost)
	invoke DrawStr, offset gameoverstr, 125, 50, 255
	mov ebx, KeyPress
	cmp ebx, VK_SPACE
	jne done ;if nothing is pressed, continue onto next iteration
;otherwise, resume game
	mov score, 0
	dec gameover
	mov spaceship_posn_x, 320
	mov spaceship_posn_y, 240 ;reset spaceship posn
	mov px, 100
	mov py, 200 ;reset ufo posn (so they don't start intersecting)
;reset asteroid posns
	mov a_posn_x, 100
	mov a_posn_y, 100
	mov big_a_posn_x, 400
	mov big_a_posn_y, 340
	jmp done

win:
	invoke DrawStr, offset winstr, 150, 50, 255
done:
	
	ret         ;; Do not delete this line!!!
GamePlay ENDP

END
