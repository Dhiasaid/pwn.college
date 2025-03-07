.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, 0x2 
    mov rsi, 0x1 
    xor rdx, rdx 
    mov rax, 0x29 
    syscall 

    xor rdi, rdi 
    mov rax, 0x3c 
    syscall 

.section .data
