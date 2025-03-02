.intel_syntax noprefix
.global _start
_start:

mov rbp, rsp
sub rsp, 0x100
xor r8, r8

most_common_byte:
    loop1:
        cmp r8, rsi
        jg next
        mov dl, byte ptr [rdi + r8]
        add byte ptr [rsp + rdx], 1
        inc r8
        jmp loop1

    next:
        xor rcx, rcx
        xor rbx, rbx
        xor rax, rax
        loop2:
            cmp rcx, 0xff
            jg done
            cmp [rsp + rcx], bl
            jg updateFreq
            jmp increment

        updateFreq:
            mov bl, [rsp + rcx]
            mov rax, rcx
            jmp increment

        increment:
            inc rcx
            jmp loop2

        done:
            mov rsp, rbp
            ret
