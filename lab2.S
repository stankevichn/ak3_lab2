.global lab2
.syntax unified

#define DATA_1 #7
#define DATA_2 #5
#define DATA_3 #9
#define DATA_4 #5

/*function: (a&b)>>+c!*/

lab2:
	push {lr}
	mov r0, DATA_1
	mov r1, DATA_2
	mov r2, DATA_3
	mov r3, DATA_4
	bl calculation
	pop {pc}
	
calculation:
	push {r4, r5, lr}
	mov r4, r0
	rev r0, r0
	and r1, r2
	lsr r1, 1
	adds r0, r1
	/*calculation factorial*/
	mov r5, r0
	mov r0, r4
	bl Factorial
	add r0, r5
	pop {r4, r5, pc}
	
Factorial:
	push {r4}
	mov r4, 3
	.factorial_cycle:
		mul r4, r0
		subs r0, #1
		bne .factorial_cycle
	mov r0, r4
	pop {r4}
	bx lr
