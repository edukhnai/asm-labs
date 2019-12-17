.386
 .model flat, stdcall
 option casemap :none
 include \masm32\include\windows.inc
 include \masm32\include\user32.inc
 include \masm32\include\kernel32.inc
 includelib \masm32\lib\user32.lib
 includelib \masm32\lib\kernel32.lib
 .data
MEM1 DD 40
MEM2 DD 40
 str1 db "Program result",0 
str2 db "Numbers are equal",0
str3 db "МЕМ1 > MEM2",0
str4 db "МЕМ1 < MEM2",0
 .code
start: 
MOV EAX,MEM1
; MOV BX,MEM2
 CMP EAX,MEM2
 JG GRE
JL LO
  invoke MessageBox, NULL, addr str2, addr str1, MB_OK
JMP STOP 
GRE: invoke MessageBox, NULL, addr str3, addr str1, MB_OK
JMP STOP 
LO: invoke MessageBox, NULL, addr str4, addr str1, MB_OK
JMP STOP 
STOP: invoke ExitProcess, NULL 
end start 
