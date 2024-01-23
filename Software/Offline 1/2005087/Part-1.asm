.model small
.stack 100h
.data
msg db 'Enter an ASCII character: $'
u db  10,13,'Uppercase letter $' 
l db  10,13,'Lowercase letter $'
n db  10,13,'Number $'
o db  10,13,'Not an alphanumeric value $' 

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    
    cmp bl,48
    jge ULNO
    jl Others
    
    ULNO: ;Uppercase,Lowercase,Number,others
    cmp bl,57
    jle Number
    jg ULO 
    
    
    ULO: ;Uppercase,Lowercase,others
    cmp bl,65
    jge UL
    jl Others
    
    UL: ;Uppercase,Lowercase
    cmp bl,90
    jle Uppercase
    jg OLO
    
    
    OLO: ;others,Lowercase,others
    cmp bl,97
    jge LO
    jl Others
    
    LO:  ;Lowercase,others
    cmp bl,122
    jle Lowercase
    jg Others
       
       
    Uppercase:
    mov ah,9
    lea dx,u
    int 21h
    jmp exit
    
    Lowercase:
    mov ah,9
    lea dx,l
    int 21h
    jmp exit
    
    Number:
    mov ah,9
    lea dx,n
    int 21h
    jmp exit
    
    Others:
    mov ah,9
    lea dx,o
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main



