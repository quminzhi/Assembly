global _start

_start:
    call func
    mov eax, 0x01
    mov ebx, 0x00
    int 0x80

func:
    push ebp
    mov ebp, esp
    sub esp, 0x02
    mov [esp], byte 'H'
    mov [esp+1], byte 'i'
    mov eax, 0x04   ; sys_write system call
    mov ebx, 1      ; stdout fd
    mov ecx, esp    ; bytes to write
    mov edx, 0x02   ; number of bytes to write
    int 0x80
    mov esp, ebp
    pop ebp
    ret


