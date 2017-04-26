mess macro msg
mov ah,09h
lea dx,msg
int 21h
endm

.model small
.data
str1 db 10,?,10 dup('$')
str2 db 10,?,10 dup('$')
msg1 db 10,13,'String Not Equal $'
msg2 db 10,13,'String Equal $'
msg3 db 10,13,'Please enter the string: $'

.code
mov ax,@data
mov ds,ax
mov es,ax

mess msg3
lea dx,str1
mov ah,0Ah
int 21h

lea si,str1
mov cl,[si+1]
mov ch,00h

mess msg3
lea dx,str2
mov ah,0Ah
int 21h

lea si,str1+2
lea di,str2+2

cld                     ;clear  direction flag
repe cmpsb		;repeat till equal compare string bitwise
	                
je l1
mess msg1

jmp exit

l1:
mess msg2
exit:
mov ah,4ch
int 21h

end
