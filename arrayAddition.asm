mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.model small
.data
n1 db 0h
arr1 db 10,?,10 dup('$')		;Declaring an array
msg1 db 10,13,'Enter the number in array:$'
msg2 db 10,13,'Addition of numbers:$'
.code
mov ax,@data    ;Initialize ds into cs
mov ds,ax

mess msg1
mov bl,05h
lea si,arr1			;Pointing address of first location of array to si
inc si
l1:	inc si			
	call accept		;Accepting number in array
	mov al,n1
	mov [si],al		;Storing number into array
	dec bl	
	jnz l1			;Jump not equal to zero

mov dh,0h
mov bh,05h
lea si,arr1
inc si
l2:	inc si
	adc dh,[si]			;Add with carry
	dec bh
	jnz l2

mov n1,dh				;Moving added value to n1 variable
mess msg2
call disp
mov ah,4Ch
int 21h

accept Proc near

mov ah,01h
int 21h
cmp al,3Ah
jc down
sub al,07H
down:and al,0Fh
mov cl,04h
ror al,cl
mov n1,al

mov ah,01h
int 21h
cmp al,3Ah
jc down1
sub al,07h
down1:and al,0Fh
add al,n1
mov n1,al
ret
endp

disp Proc near

mov bl,n1      ;For ten's place
and bl,0F0h
mov cl,04h
ror bl,cl
cmp bl,0Ah
jc down3
add bl,07h
down3:add bl,30h
mov dl,bl

mov ah,02h
int 21h

mov al,n1	   ;For unit's place
and al,0Fh
cmp al,0Ah
jc down2
add al,07h
down2:add al,30h
mov dl,al

mov ah,02h
int 21h
ret
endp

end