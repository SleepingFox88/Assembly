; Writes Smash Mouth - All Star lyrics to the output

	JMP main
serr:
	DB "Error: String too large" ; Variable
	DB 0	; String terminator
s1:
	DB "Somebody once told me" ; Variable
	DB 0	; String terminator
s2:
	DB "the world is gonna roll" ; string
	DB 0
s3:
	DB "me. I ain't the sharpest" ; string
	DB 0
s4:
	DB "tool in the shed" ; string
	DB 0

err:
	MOV C, serr	; Point to var 
	CALL print
	HLT

clear:
	MOV D, 232	; Point to output
.clearloop:
	MOV [D], 32	; Write to output
	INC D
	CMP D, 0	; Check if end
	JNZ .clearloop	; jump if not
	RET

print:
	CALL clear
	MOV B, 0
	MOV D, 232	; Point to output
.printloop:
	CMP D, 0	; Check if string too long
	JZ err
	MOV A, [C]	; Get char from var
	MOV [D], A	; Write to output
	INC C
	INC D
	CMP B, [C]	; Check if end
	JNZ .printloop	; jump if not
	RET
	
main:
	MOV C, s1	; Point to var 
	CALL print
	MOV C, s2
	CALL print
	MOV C, s3
	CALL print
	MOV C, s4
	CALL print
        HLT             ; Stop
