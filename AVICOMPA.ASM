mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
str1 db 10,?,10 dup('$')
str2 db 10,?,10 dup('$')
msg1 db 10,13,'Enter 1st string: $'
msg2 db 10,13,'Enter 2nd string: $'
msg3 db 10,13,'String Equal $'
msg4 db 10,13,'String Not Equal $'

.code
mov ax,@data
mov ds,ax
mov es,ax

mess msg1
lea dx,str1
mov ah,0Ah
int 21h

mess msg2
lea dx,str2
mov ah,0Ah
int 21h

lea si,str1
mov al,[si+1]
lea di,str2
mov bl,[di+1]
cmp al,bl
jne l1


lea si,str1
lea di,str2
inc si
inc si
inc di
inc di

l2:
mov al,[si]
mov ah,[di]
cmp al,ah
jne l1
inc si
inc di
je l2

mess msg3
jmp exit

l1:
mess msg4
exit:
mov ah,4ch
int 21h

end
