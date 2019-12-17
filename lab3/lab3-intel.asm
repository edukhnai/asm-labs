 
.386
 .model flat, stdcall
 option casemap :none ; case sensitive
;-------------------------------------------------
 include \masm32\include\windows.inc
 include \masm32\include\user32.inc
 include \masm32\include\kernel32.inc
 include \masm32\include\fpu.inc ;
 includelib \masm32\lib\user32.lib
 includelib \masm32\lib\kernel32.lib
 includelib \masm32\lib\fpu.lib ;
;------------------------------------------------
    .data
str1 db "Program result: ", 0
str2 db "Abs value of half sum: ", 0
A DD -9906.24
B DD 12.1
POW DD 2.0
sumAB DT 0
;------------------------------------------------
    .code
start:
    FLD A
    FADD B
    FABS
    FDIV POW
    FSTP sumAB
    
invoke FpuFLtoA, addr sumAB, 8, addr str2+16, SRC1_REAL or SRC2_DIMM or STR_REG
invoke MessageBox, 0, addr str2, addr str1, MB_OK
invoke ExitProcess, NULL
end start
