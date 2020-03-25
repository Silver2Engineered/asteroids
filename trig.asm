      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive

include trig.inc

.DATA

;;  These are some useful constants (fixed point values that correspond to important angles)
PI_HALF = 102943           	;;  PI / 2
PI =  205887	                ;;  PI 
TWO_PI	= 411774                ;;  2 * PI 
PI_INC_RECIP =  5340353        	;;  Use reciprocal to find the table entry for a given angle
	                        ;;              (It is easier to use than divison would be)


	;; If you need to, you can place global variables here
	
.CODE

FixedSin PROC USES ecx edx angle:FXPT
	local neg_ang:DWORD
	mov edx, angle 
	mov neg_ang, 0

;case 1: angle is over 2 pi
over2pi:		
	cmp edx, TWO_PI
	jl neg_angle		
	sub edx, TWO_PI ;subtract 2pi
	jmp over2pi ;repeat until angle is less than 2pi

;case 2: angle is negative
neg_angle:
	cmp edx, 0
	je calc ;if angle is 0, skip to end
	jg quad3and4
	add edx, TWO_PI ;add 2 pi
	jmp neg_angle ;repeat until positive
	
quad3and4:		
	cmp edx, PI
	jl quad2
	sub edx, PI ;if angle>=pi, subtract pi & eventually negate
	xor neg_ang, 1

quad2:		
	cmp edx, PI_HALF
	je piOver2
	jl calc
	mov ecx, PI
	sub ecx, edx ;if angle>pi/2, subtract it from pi
	mov edx, ecx
	jmp quad2 ;repeat until angle is less than or equal to pi/2

piOver2: ;if angle=pi/2, then sin =1
	mov eax, 1 
	shl eax, 16 ;convert to fixed point & return
	ret

calc:		
	mov eax, edx ;store angle in result
	mov edx, PI_INC_RECIP ;lookup sin value in table
	imul edx 
	xor eax, eax ;clear out eax
	mov ax, WORD PTR [SINTAB + edx*2]
	cmp neg_ang, 0
	je done
	neg eax ;negate angle it was negative
done:	
	ret			; Don't delete this line!!!
FixedSin ENDP 
	
FixedCos PROC USES ecx angle:FXPT
	mov ecx, angle	 
	add ecx, PI_HALF
	invoke FixedSin, ecx
	ret			; Don't delete this line!!!	
FixedCos ENDP	
END
