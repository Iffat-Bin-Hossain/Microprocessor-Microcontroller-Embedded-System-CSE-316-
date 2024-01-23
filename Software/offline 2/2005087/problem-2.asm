.model small
.stack 100h 
.data
prompt db 'Enter a number: $'
result db 10,13,'Sum of digits: $'
n dw ?
total dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    lea  dx,prompt
    mov ah,9
    int 21h 
    
    mov n,0
    mov bx,10
    
    
    n_block:
    mov ah,1
    int 21h
    cmp al,13
    je next
    
    sub al,48
    mov ah,0
    mov cx,ax
    mov ax,n
    mul bx
    add ax,cx
    mov n,ax
    jmp n_block  
    
    
    
    next:
    mov cx,0 
    mov dx,0
    mov bx,10
    mov ax,n
    
    call digitSum
    
    
    
    
    
    display:
    mov total,cx
    lea  dx,result
    mov ah,9
    int 21h 
    
    mov ax,total
    mov dx,0
    mov bx,10
    mov cx,0
     
    stckpush:
    DIV bx
    push dx
    mov dx,0
    mov ah,0
    inc cx
    cmp ax,0
    jne stckpush
    
    
    mov ah,2 
    stckpop:
    pop dx
    add dx,48
    int 21h 
    dec cx
    jnz stckpop

    Exit:
    mov ah, 4ch 
    int 21h
    main endp

digitSum proc
   
    ;mov ah,0 
    div bx
    add cx,dx
    cmp ax,0
    je display
    mov dx,0
    call digitSum

digitSum endp

end main