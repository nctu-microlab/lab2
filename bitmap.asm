	org 0
	mov A, #00h
	mov DPTR, #TABLE

START:
	mov r0, #0
	mov r1, #8
LOOP:
	mov A, r0
	movc A, @A+DPTR
	mov p1, r0
	mov p2, A
	call DELAY
	inc r0
	djnz r1, LOOP
	ajmp START
	
DELAY:
	push 4
	mov r4, #250
	djnz r4, $
	pop 4
	ret
	
TABLE:
	DB 11111111b
	DB 10100011b
	DB 10101011b
	DB 10001011b
	DB 11111111b
	DB 10000011b
	DB 10101011b
	DB 10001011b
	
end
