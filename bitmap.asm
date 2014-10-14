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
	ret
	
TABLE:
	DB 11111111
	DB 10100011
	DB 10101011
	DB 10001011
	DB 11111111
	DB 10000011
	DB 10101011
	DB 10001011
	
end
