.intel_syntax noprefix
.global _start
_start:

xor rax, rax
mov rbx, -1
cmp rdi, 0
je done

loop:
    inc rbx
    mov rcx, [rdi+rbx]
    cmp rcx, 0
    jne loop
    mov rax, rbx

done: 
