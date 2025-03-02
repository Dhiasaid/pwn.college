.intel_syntax noprefix
.global _start
_start:

xor rax,rax
xor rbx,rbx

loop:
add rax,[rdi+rbx*8]
inc rbx
cmp rbx,rsi
jl loop
div rsi


