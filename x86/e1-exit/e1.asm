global _start

section .text
_start:
    mov eax, 1   ; sys_exit system call
    mov ebx, 42  ; exit status
    int 0x80     ; interupt for system call
