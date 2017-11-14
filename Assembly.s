										AREA Max, CODE, READWRITE
Ele0										EQU 0	;offsets for values in array
Ele1										EQU 4
Ele2										EQU 8
Ele3										EQU 12
Ele4										EQU 16
Ele5										EQU 20
Ele6   										EQU 24
	                                        ADR r0, num	;r0 points to array num
                                            MOV r3, #Ele1
											LDR r1,[r0,#Ele0]	;read the data for Ele0 into r1
											LDR r2,[r0,r3]
loop
											CMP r1, r2
											BLT move
											ADD r3, #4
											LDR r2,[r0,r3]
											MOV r4, r3
											CMP r4, #24
											BLT loop
											B second
move										
											MOV r1, r2
											ADD r3, #4
											LDR r2,[r0,r3]
											MOV r4, r3
											CMP r4, #24
											BLT loop
											B second

second
											MOV r3, #Ele1
											LDR r5,[r0,#Ele0]
											LDR r6,[r0,r3]
											
loop2											
											CMP r1, r5
											
											CMP r5, r6
											BLT then
											LDR r2,[r0,r3]
											MOV r4, r3
											CMP r4, #24
											B second
then										
											MOV r5, r6
											ADD r3, #4
											LDR r6,[r0,r3]
											MOV r4, r3
											CMP r4, #24
											BLT loop2
											B stop
											
											
											
num
  DCD  4	;data for Ele0
  DCD  3	;data for Ele1
  DCD  6	;data for Ele2
  DCD  9	;data for Ele3
  DCD  5	;data for Ele4
  DCD  7	;data for Ele5
  DCD  8	;data for Ele6
stop
  END
