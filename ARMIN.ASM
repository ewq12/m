mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
n1 db 0h
arr db 10,?,10 dup('$')
msg1 db 10,13,'Enter the number in  array $'
msg2 db 10,13,'Greatest Number is : $'
.code
mov ax,@data
mov ds,ax

mess msg1
mov bl,05h
lea si,arr
inc si
l1: inc si
    call accept
    mov al,n1
    mov [si],al
    dec bl
    jnz l1


mov ch,05h
lea si,arr
inc si
mov dh,[si+1]

l2: inc si
    mov bh,[si+1]
    cmp dh,bh
    jl l3
    cmp bh,24h
    jne l4
    jmp e1
     l4: mov dh,bh
         dec ch
         jnz l2

     l3: dec ch
         jnz l2

e1:mov n1,dh
   mess msg2
   call disp

mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc down
sub al,07h
down: and al,0Fh
mov cl,04h
ror al,cl
mov n1,al

mov ah,01h
int 21h
cmp al,3Ah
jc up
sub al,07h
up:and al,0Fh
add al,n1
mov n1,al
ret
endp


disp proc near

mov bl,n1
and bl,0F0h
mov cl,04h
ror bl,cl
cmp bl,0Ah
jc up1
add bl,07h
up1: add bl,30h
mov dl,bl
mov ah,02h
int 21h

mov al,n1
and al,0Fh
cmp al,0Ah
jc down1
add al,07h
down1:add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end

