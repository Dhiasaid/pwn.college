.intel_syntax noprefix
.global _start
_start:

cmp rdi,3
ja case
jmp [rsi+rdi*8]
case:
jmp [rsi+4*8]


