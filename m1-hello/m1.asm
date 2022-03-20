; x86_64 - hello world

section .data
    msg db "hello, world", 10, 0 ; hello world \n \0
    len equ $ - msg

section .text
    global _start

_start:
    mov rax, 0x01  ; sys_write system call
    mov rdi, 0x01  ; stdin
    mov rsi, msg  ; input stream
    mov rdx, len   ; length of text 
    syscall

    mov rax, 0x3C  ; sys_exit system call
    mov rdi, 0x0   ; return status
    syscall
