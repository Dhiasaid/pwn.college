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
    mov word ptr [rsp-2], 0x5000
    mov word ptr [rsp-4], 0x2
    sub rsp, 4
    lea rsi, [rsp]
    mov rdx, 0x10
    mov rax, 0x31
    syscall

    mov rdi, r15
    xor rsi, rsi
    mov rax, 0x32
    syscall

.request_loop:
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

    lea rdi, [rsi+4]
    xor rax, rax
    mov rcx, 0x400   # Set a maximum loop counter to avoid infinite loops

.file_name_loop:
    cmp byte ptr [rdi+rax], 0x20
    je .end_file_name_loop
    inc rax
    dec rcx
    jnz .file_name_loop

.end_file_name_loop:
    mov byte ptr [rdi+rax], 0x0
    xor rsi, rsi
    mov rax, 0x2
    syscall

    mov rdi, rax
    sub rsp, 0x1000
    mov rsi, rsp
    mov rdx, 0x1000
    xor rax, rax
    syscall
    mov r13, rax

    mov rax, 0x3
    syscall

    mov rdi, r14
    mov rax, 0x000a0d0a0d4b4f20
    push rax
    mov rax, 0x30303220302e312f
    push rax
    mov eax, 0x50545448
    mov dword ptr [rsp-4], eax
    sub rsp, 4
    lea rsi, [rsp]
    mov rdx, 0x13
    mov rax, 0x1
    syscall

    mov rdi, r14
    lea rsi, [rsp+0x14]
    mov rdx, r13
    mov rax, 0x1
    syscall

    mov rdi, r14
    mov rax, 0x3
    syscall

    jmp .request_loop

    xor rdi, rdi
    mov rax, 0x3c
    syscall

.section .data

