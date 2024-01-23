.model small
.stack 100h
.data
    msg db 'Enter Three lowercase letters: $'
    a db 10,13,'Second highest letter: $'
    b db 10,13,'All letters are Equal $'
    error db 10,13, 'Invalid input.$'
    corrector db 10,13,'Enter lowercase letters: $'
.code
main proc 
    mov ax, @data 
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    call getLowerCaseInput
    mov bl, al  
    
   
    mov ah,2
    mov dl,32
    int 21h
    
    call getLowerCaseInput
    mov bh, al
    
    mov ah,2
    mov dl,32
    int 21h
    
    call getLowerCaseInput
    mov ch, al 
    
 
    
    cmp bl, bh
    jg l1
    jl l2
    je l3
    
    l1:
    cmp bh, ch
    jge num2 
    jl l31
    
    l2:
    cmp bl, ch 
    jge num1
    jl l32 
    
    l3:
    cmp bl, ch
    jne num2
    je equal 
             
    l31:
    cmp bl, ch
    jg num3
    jl num1
    je num2
    
    l32:
    cmp bh, ch
    jg num3
    jl num2
    je num1
    
    num1:
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl, bl
    int 21h
    jmp exit 
    
    
    num2:
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit
    
    num3:
    mov ah, 9
    lea dx, a
    int 21h 
    
    mov ah, 2
    mov dl, ch
    int 21h        
    jmp exit 
    
    equal:
    mov ah, 9
    lea dx, b
    int 21h
    
    exit:
    mov ah, 4ch 
    int 21h

getLowerCaseInput:
    mov ah, 1
    int 21h
    cmp al,97
    jl Wrong
    cmp al, 122
    jg Wrong
    ret

Wrong:

    mov ah, 9
    lea dx, error
    int 21h  
    mov ah, 9
    lea dx, corrector
    int 21h
    jmp getLowerCaseInput

main endp
end main
