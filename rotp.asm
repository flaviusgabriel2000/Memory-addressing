section .text
    global rotp

;; void rotp(char *ciphertext, char *plaintext, char *key, int len);
rotp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; ciphertext
    mov     esi, [ebp + 12] ; plaintext
    mov     edi, [ebp + 16] ; key
    mov     ecx, [ebp + 20] ; len
    ;; DO NOT MODIFY

    ;; TODO: Implment rotp
    ;; FREESTYLE STARTS HERE	
    xor eax, eax
    
loop:
    dec ecx
    mov bl, [edi + ecx]                 ; il punem in bl pe key[len -  i - 1]

    xor bl, byte [esi + eax]            ; XOR intre key[len - i - 1] si plaintext[i]
    mov byte [edx + eax], bl            ; punem rezultatul in cyphertext[i]

    inc eax                             ; i++
    test ecx, ecx
    jnz loop

    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY