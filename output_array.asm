; output_array.asm
section .data
    fmt_count db "(%ld integers) ", 0
    fmt_num db "%ld", 0
    fmt_comma db ", ", 0
    fmt_newline db 10, 0

section .text
    global output_array
    extern printf

output_array:
    push rbp
    mov rbp, rsp
    
    ; Save arguments
    push rdi    ; array pointer
    push rsi    ; count
    
    ; Print count
    mov rdi, fmt_count
    mov rsi, [rbp-16]   ; count
    call printf
    
    ; Check if array is empty
    mov rcx, [rbp-16]   ; count
    test rcx, rcx
    jz .done
    
    ; Print first number without comma
    mov rdi, fmt_num
    mov rax, [rbp-8]    ; load array pointer
    mov rsi, [rax]      ; load first number
    call printf
    
    ; Print remaining numbers with comma
    mov rcx, [rbp-16]   ; count
    dec rcx             ; subtract 1 for first number
    mov r8, [rbp-8]     ; array pointer
    add r8, 8           ; point to second element
    
.loop:
    test rcx, rcx
    jz .done
    
    ; Print comma
    mov rdi, fmt_comma
    call printf
    
    ; Print number
    mov rdi, fmt_num
    mov rsi, [r8]
    call printf
    
    add r8, 8
    dec rcx
    jmp .loop
    
.done:
    ; Print newline
    mov rdi, fmt_newline
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
