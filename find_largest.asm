; find_largest.asm
section .text
    global find_largest

find_largest:
    ; Arguments:
    ; rdi = array pointer
    ; rsi = count
    
    push rbp
    mov rbp, rsp
    
    ; Check if array is empty
    test rsi, rsi
    jz .done
    
    ; Initialize
    mov rcx, rsi        ; counter
    mov rax, 0          ; current max index
    mov r8, [rdi]       ; current max value
    mov r9, 1           ; current index
    add rdi, 8          ; point to next element
    dec rcx             ; decrement counter for first element
    
.loop:
    test rcx, rcx
    jz .done
    
    ; Compare current element with max
    mov r10, [rdi]
    cmp r10, r8
    jle .continue
    
    ; Update max
    mov r8, r10
    mov rax, r9
    
.continue:
    inc r9
    add rdi, 8
    dec rcx
    jmp .loop
    
.done:
    mov rsp, rbp
    pop rbp
    ret
