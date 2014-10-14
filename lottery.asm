	org 0
START:
	mov r0, #0
	mov r1, #8
LOOP:
	mov DPTR, #PATTERN
	mov A, r0
	movc A, @A+DPTR
	mov p0, A
	
	call DELAY
	
	JB P1.4, NO_CLICK_CHEAT
	call CHEAT
	ajmp CLICK_FINISH
	
NO_CLICK_CHEAT:
	JB P1.7, NO_CLICK ; STOP is clicked
	call STOP
	
CLICK_FINISH:
	mov P1, #FFh
	JB P1.6, $ ; Wait for RESET clicked
	ajmp START
NO_CLICK:
	
	inc r0
	djnz r1, LOOP
	ajmp START

STOP:
	push 4
	mov A, p0
	mov r4, A
	mov A, p3
	subb A, r4
	jnz NO_LUCK

	call SHOW_DIGIT
	
NO_LUCK:
	pop 4
	ret
	
CHEAT:
	mov A, p3
	mov p0, A
	call SHOW_DIGIT
	
	ret
	
SHOW_DIGIT:
	push 3
	push 4
	push 5
	push 6
	push 7
	
	mov r3, #3
SHOW_REPEAT:
	mov r7, #250
	mov DPTR, #TABLE
SHOW_START:
	mov r4, #0
	mov r5, #8
SHOW_LOOP:
	mov A, r4
	movc A, @A+DPTR
	mov p1, r4
	mov p2, A
	
	mov r6, #250
	djnz r6, $
	
	inc r4
	djnz r5, SHOW_LOOP
	djnz r7, SHOW_START
	
	call DELAY
	djnz r3, SHOW_REPEAT
	
	pop 7
	pop 6
	pop 5
	pop 4
	pop 3
	ret
	
DELAY:
	PUSH 5
	PUSH 6
	PUSH 7

	MOV R5, #8
D1:
	MOV R6, #250
D2:
	MOV R7, #250
	DJNZ R7, $
	DJNZ R6, D2
	DJNZ R5, D1

	POP 7
	POP 6
	POP 5

	RET

PATTERN:
	db 01110000b
	db 10001010b
	db 00111100b
	db 11110110b
	db 01010101b
	db 11001100b
	db 10010000b
	db 01111101b
	
TABLE:
	DB 10100011b
	DB 10101011b
	DB 10001011b
	DB 11111111b
	DB 10000011b
	DB 10101011b
	DB 10001011b
	DB 11111111b
	
	end
