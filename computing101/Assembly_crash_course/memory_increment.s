.intel_syntax noprefix
.global _start
_start:

mov rax, [0x404000]
mov rbx,0x1337
add [0x404000],rbx


