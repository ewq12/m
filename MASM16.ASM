mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
msg1 db 10,13,'Enter the  First no : $'
msg2 db 10,13,'Enter the second no : $'
msg3 db 10,13,'1. Addition $'
msg4 db 10,13,'2. Subtraction $'
msg5 db 10,13,'3. Multiplication $'
msg6 db 10,13,'4. Select option : $'
msg7 db 10,13,'Answer : $'
n1 db 00h
n2 db 00h
n5 db 00h
n6 db 00h
n7 db 00h
n8 db 00h

.code
mov ax,@data
mov ds,ax

mess msg3
mess msg4
mess msg5

mess msg6
mov ah,01h
int 21h

cmp al,31h
je addl
cmp al,32h
je subl
;cmp al,33h
;je multi
cmp al,34h
jmp ex


addl:call addp
     jmp ex
subl:call subp
     jmp ex
;multi:call multip
 ;jmp ex

    
addp proc near
mess msg1
call accept
mov ah,n1
mov n5,ah
call accept
mov al,n1
mov n6,al

mess msg2
call accept
mov bh,n1
call accept
mov bl,n1
mov ah,n5
mov al,n6
add ax,bx
mov n8,ah
mov n7,al
mess msg7
mov ah,n8
mov n2,ah
call disp
mov al,n7
mov n2,al
call disp
ret
endp

subp proc near
mess msg1
call accept
mov ah,n1
mov n5,ah
call accept
mov al,n1
mov n6,al
mess msg2
call accept
mov bh,n1
call accept
mov bl,n1
mov ah,n5
mov al,n6
sub ax,bx
mov n8,ah
mov n7,al
mess msg7
mov ah,n8
mov n2,ah
call disp
mov al,n7
mov n2,al
call disp
ret
endp

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc label1

sub al,07h
label1: and al,0Fh
mov cl,04h
ror al,cl
mov n1,al

mov ah,01h
int 21h
cmp al,3Ah
label2: and al,0Fh
add al,n1
mov n1,al
ret
endp


disp proc near
mov al,n2
and al,0F0h
mov cl,04h
ror al,cl
cmp al,0Ah
jc label3
add al,07h
label3: add al,30h
mov dl,al
mov ah,02h
int 21h

mov al,n2
and al,0Fh
cmp al,0Ah
jc label4
add al,07h
label4: add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

ex: mov ah,4ch
    int 21h
end    
