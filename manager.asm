; manager.asm
section .data
    MAX_INTEGERS equ 100
    msg_welcome db "The manager is here to assist you.", 10, 0
    msg_array_received db "The following integers were received:", 10, 0
    msg_largest db "The largest value %ld has been found at index %ld", 10, 0
    msg_return db "The manager will now return the count to the driver.", 10, 0

section .text
    global manager
    extern input_array
    extern output_array
    extern find_largest
    extern printf

manager:
    ; Function prologue
    push rbp
    mov rbp, rsp
    
    ; Allocate space for array (8 bytes * 100 integers)
    sub rsp, MAX_INTEGERS * 8
    
    ; Print welcome message
    lea rdi, [msg_welcome]
    call printf
    
    ; Call input_array(array_ptr, MAX_INTEGERS)
    mov rdi, rsp        ; array pointer
    mov rsi, MAX_INTEGERS
    call input_array
    mov r12, rax        ; save count
    
    ; Print array message
    lea rdi, [msg_array_received]
    call printf
    
    ; Call output_array(array_ptr, count)
    mov rdi, rsp
    mov rsi, r12
    call output_array
    
    ; Only find largest if count > 0
    test r12, r12
    jz .done
    
    ; Call find_largest(array_ptr, count)
    mov rdi, rsp
    mov rsi, r12
    call find_largest
    
    ; Print largest value message
    mov rdx, rax        ; index
    mov rcx, [rsp + rax*8]  ; value at index
    lea rdi, [msg_largest]
    mov rsi, rcx
    call printf
    
.done:
    ; Print return message
    lea rdi, [msg_return]
    call printf
    
    mov rax, r12        ; return count
    
    ; Function epilogue
    mov rsp, rbp
    pop rbp
    ret
