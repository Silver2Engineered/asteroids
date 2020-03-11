; #########################################################################
;
;   stars.asm - Assembly file for CompEng205 Assignment 1
;   
;   Student Name: Ariella Silver
;
;   NetID: ams6059
;
; #########################################################################

      .586
      .MODEL FLAT,STDCALL
      .STACK 4096
      option casemap :none  ; case sensitive


include stars.inc

.DATA

	;; If you need to, you can place global variables here

.CODE

DrawStarField proc

;DrawStar proto x:DWORD, y:DWORD
; Input Parameters: x = x-coordinate, y = y-coordinate 
;Description: Draws a star on the screen at the specified location (x,y).

	;; Place your code here

        ; invoke DrawStar, 0, 200 ;; draws a single star at location (0, 200)
        ; invoke DrawStar, 15, 20 ;; draws a single star at location (15, 20)
        ; invoke DrawStar, 100, 200 ;; draws a single star at location (100, 200)
        ; invoke DrawStar, 150, 200 ;; draws a single star at location (150, 200)
        
        ; invoke DrawStar, 350, 200 ;; draws a single star at location (350, 200)
        ; invoke DrawStar, 150, 300 ;; draws a single star at location (150, 300)
        ; invoke DrawStar, 150, 400 ;; draws a single star at location (150, 400)
        ; invoke DrawStar, 250, 200 ;; draws a single star at location (250, 200)
        
        ; invoke DrawStar, 150, 0 ;; draws a single star at location (150, 0)
        ; invoke DrawStar, 80, 300 ;; draws a single star at location (80, 300)
        ; invoke DrawStar, 150, 600 ;; draws a single star at location (150, 600)
        ; invoke DrawStar, 350, 300 ;; draws a single star at location (350, 300)
        
        ; invoke DrawStar, 60, 200 ;; draws a single star at location (60, 200)
        ; invoke DrawStar, 150, 90 ;; draws a single star at location (150, 90)
        ; invoke DrawStar, 100, 600 ;; draws a single star at location (100, 600)
        ; invoke DrawStar, 120, 60 ;; draws a single star at location (120, 60)

        ; invoke DrawStar, 40, 80 ;; draws a single star at location (40, 80)
        ; invoke DrawStar, 60, 90 ;; draws a single star at location (60, 90)
        ; invoke DrawStar, 110, 110 ;; draws a single star at location (110, 110)
        ; invoke DrawStar, 85, 60 ;; draws a single star at location (85, 60)


	ret  			; Careful! Don't remove this line
DrawStarField endp



END
