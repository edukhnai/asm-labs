.386
 .model flat, stdcall
 option casemap :none
 include \masm32\include\windows.inc
 include \masm32\include\user32.inc
 include \masm32\include\kernel32.inc
 includelib \masm32\lib\user32.lib
 includelib \masm32\lib\kernel32.lib
 .data
MASS dw 2, 8, 3, 6, 1, 4, 7, 3, 5, 9
;MASS dw 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
MIN dW 0
MAX dW 0
str1 db "Program result",0 
str2 db "All elements are equal",0
sResult db 50 dup (0) 
format db "%d",0
 .code
start: 
XOR ESI,ESI
XOR AX,AX
XOR BX,AX
MOV ECX,10
MOV AX,MASS[ESI]
MOV BX,MASS[ESI]


FOR1: 
CMP MASS[ESI],BX
 JG GREATER
JMP NEXT1

GREATER:
MOV BX,MASS[ESI]
JMP NEXTEL

NEXT1: 
CMP MASS[ESI],AX
 JL LOWER
JMP NEXTEL

LOWER: 
MOV AX,MASS[ESI]
JMP NEXTEL

NEXTEL:
ADD ESI,2
LOOP FOR1

CMP AX,BX
JZ NOTEQUA
JMP EQUA

EQUA:
sub BX,AX
invoke wsprintf, ADDR sResult, ADDR format, BX
invoke MessageBox, NULL, addr sResult, addr str1, MB_OK
invoke ExitProcess, NULL 
JMP END1
NOTEQUA:
invoke MessageBox, NULL, addr str2, addr str1, MB_OK
invoke ExitProcess, NULL 
JMP END1

END1: end start  
