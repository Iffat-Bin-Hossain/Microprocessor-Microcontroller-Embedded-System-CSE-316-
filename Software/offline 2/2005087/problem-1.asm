.model small
.stack 100h 
.data
prompt db 'Enter n and k: $'
result db 10,13,'Total chocolate: $'
n dw ?
k dw ?
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
    cmp al,32
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
    
    mov k,0
    mov bx,10
    
    
    k_block:
    mov ah,1
    int 21h
    cmp al,13
    je calculation
    
    sub al,48
    mov ah,0
    mov cx,ax
    mov ax,k
    mul bx
    add ax,cx
    mov k,ax
    jmp k_block 
    
    calculation:
    mov bx,k 
    mov ax, n
    mov total,ax
    
    
    solution: 
    cmp ax, k
    jl display 
    mov dx, 0
    div bx
    add total, ax
    add ax,dx 
    jmp solution
    
    
    
    
    display:
    lea  dx,result
    mov ah,9
    int 21h
    mov ax,total
    mov dx,0
    mov bx,10
    mov cx,0
     
    stckpush:
    div bx
    push dx
    mov dx,0
    inc cx
    cmp ax,0
    jne stckpush
    
    
     
    stckpop:
    pop dx
    add dx,48
    mov ah,2
    int 21h 
    dec cx
    jnz stckpop

    Exit:
    mov ah, 4ch 
    int 21h
    main endp
end main