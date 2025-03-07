.intel_syntax noprefix
.global _start

.section .text

_start:
    mov rdi, 0x2
    mov rsi, 0x1 
    xor rdx, rdx 
    mov rax, 0x29 
    syscall 
    mov r15, rax 
    mov rdi, r15 
    xor rax, rax
    push rax
    mov rbx, 0x0 
    push rbx
    mov word ptr [rsp-2],0x5000 
    mov word ptr [rsp-4],0x2
    sub rsp, 4
    lea rsi, [rsp]
    mov rdx, 0x10 
    mov rax, 0x31 
    syscall 

    mov rdi, r15
    xor rsi, rsi 
    mov rax, 0x32 
    syscall 

    mov rdi, r15 
    xor rsi, rsi
    xor rdx, rdx 
    mov rax, 0x2b 
    syscall 

    mov r14, rax 
    mov rdi, r14 
    sub rsp, 0x400 
    mov rsi, rsp
    mov rdx, 0x400 
    xor rax, rax 
    syscall 

    mov rdi, r14 
    mov rax, 0x000a0d0a0d4b4f20
    push rax
    mov rax, 0x30303220302e312f
    push rax
    mov eax, 0x50545448
    mov [rsp-4], eax
    sub rsp, 4
    lea rsi, [rsp]
    mov rdx, 0x13 
    mov rax, 0x1 
    syscall 

    mov rdi, r14 
    mov rax, 0x3 
    syscall 

    xor rdi, rdi 
    mov rax, 0x3c 
    syscall 

.section .data

