.model small

.data
temp db 4ah
array db 10,?,10,10 dup('$')

.code
mov ax,@data
mov ds,ax

mov cl, 05h
lea si, array
inc si

loop2:
inc si
call read
mov al, temp
mov [si], al
dec cl
jnz loop2

mov cl, 05h
lea si, array
inc si

lp1:
	mov ch, 05h
	lea di, array
	inc di
	inc si
	lp2:
		inc di
		mov bl, [si]
		mov bh, [di]
		cmp bl, bh
		jc swap  ;jc - decending, jnc for accending
			mov [si], bh
			mov [di], bl
		swap:
	
	dec ch
	jnz lp2
dec cl
jnz lp1

mov cl, 05h
lea si, array
inc si

loop3:
inc si
mov al, [si]
mov temp, al
call disp
dec cl
jnz loop3

mov ah,4ch
int 21h

read Proc near
	mov ah,01h
	int 21h
	cmp al,3ah
	jc down
	sub al,07h
	down: and al,0Fh
	ror al,04h
	mov temp,al
	
	mov ah,01h
	int 21h
	cmp al,3ah
	jc down1
	sub al,07h
	down1: and al,0Fh
	add al,temp
	mov temp,al
	ret
endp

disp proc near
	mov al,temp
	and al,0F0h
	ror al,04h
	cmp al,0Ah
	jc down2        
	add al,07h
	down2: add al,30h
	mov dl,al
	mov ah,02h
	int 21h

	mov al,temp
	and al,0Fh
	cmp al,0Ah
	jc down3
	add al,07h
	down3:add al,30h
	mov dl,al
	mov ah,02h
	int 21h
	ret
endp
end