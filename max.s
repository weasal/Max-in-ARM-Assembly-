											AREA Max, CODE, READWRITE
Ele0											EQU 0	;offsets for values in array
Ele1											EQU 4
Ele2											EQU 8
Ele3											EQU 12
Ele4											EQU 16
Ele5											EQU 20
Ele6   											EQU 24
											    ADR r0, num	;r0 points to array num
												LDR r1,[r0,#Ele0]	;read the data for Ele0 into r1
												LDR r2,[r0,#Ele1] ;And so on
												LDR r3,[r0,#Ele2]
												LDR r4,[r0,#Ele3]
												LDR r5,[r0,#Ele4]
												LDR r6,[r0,#Ele5]
												LDR r7,[r0,#Ele6]
arrayOneComp
												CMP r1,r2 ; checks value against every other value in the array and sends it to appropriate code snippet
												BLT arrayTwoComp
												CMP r1,r3
												BLT arrayThreeComp
												CMP r1,r4
												BLT arrayFourComp
												CMP r1,r5
												BLT arrayFiveComp
												CMP r1,r6
												BLT arraySixComp
												CMP r1,r7
												BLT arraySevenComp
												MOV r8,r1; if none are greater, send value into "max" register
												B stop

arrayTwoComp
												CMP r2,r3
												BLT arrayThreeComp
												CMP r2,r4
												BLT arrayFourComp
												CMP r2,r5
												BLT arrayFiveComp
												CMP r2,r6
												BLT arraySixComp
												CMP r1,r7
												BLT arraySevenComp
												MOV r8,r2
												B stop

arrayThreeComp
												CMP r3,r4
												BLT arrayFourComp
												CMP r3,r5
												BLT arrayFiveComp
												CMP r3,r6
												BLT arraySixComp
												CMP r1,r7
												BLT arraySevenComp
												MOV r8,r3
												B stop

arrayFourComp
												CMP r4,r5
												BLT arrayFiveComp
												CMP r4,r6
												BLT arraySixComp
												CMP r4,r7
												BLT arraySevenComp
												MOV r8, r4
												B stop

arrayFiveComp
												CMP r5,r6
												BLT arraySixComp
												CMP r1,r7
												BLT arraySevenComp
												MOV r8,r5
												B stop

arraySixComp
												CMP r1,r7
												BLT arraySevenComp
												MOV r8,r6
												B stop
arraySevenComp
												MOV r8,r7
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
