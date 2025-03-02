.intel_syntax noprefix
.global _start
_start:

mov r8, 0x403000

str_lower:
    xor rcx, rcx
    cmp rdi, 0x0
    je done

    loop:
        mov rbx, rdi
        xor rdi, rdi
        mov dil, byte ptr [rbx]
        cmp dil, 0x0
        je done
        cmp dil, 0x5a
        jg greater
        inc rcx
        call r8
        mov byte ptr [rbx], al

    greater:
        mov rdi, rbx
        inc rdi
        jmp loop

    done:
        mov rax, rcx
        ret
