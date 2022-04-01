; x86_64 - greeting

section .data
    prompt db "what is your name?", 10
    len_prompt equ $ - prompt
    greet db "hello, "
    len_greet equ $ - greet

section .bss
    name resb 16

section .text
    global _start

_start:
    call _printPrompt
    call _getName
    call _printGreet
    call _printName

    mov rax, 0x3C
    mov rdi, 0
    syscall

_getName:
    mov rax, 0   ; sys_read
    mov rdi, 0   ; fd for stdin
    mov rsi, name
    mov rdx, 16
    syscall
    ret

_printPrompt:
    mov rax, 1   ; sys_write
    mov rdi, 1   ; fd for stdout
    mov rsi, prompt
    mov rdx, len_prompt
    syscall
    ret

_printGreet:
    mov rax, 1
    mov rdi, 1
    mov rsi, greet
    mov rdx, len_greet
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16   ; len of reserved bytes
    syscall
    ret

