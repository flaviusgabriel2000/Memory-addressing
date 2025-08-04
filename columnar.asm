section .data
    extern len_cheie, len_haystack

section .text
    global columnar_transposition

;; void columnar_transposition(int key[], char *haystack, char *ciphertext);
columnar_transposition:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha 

    mov edi, [ebp + 8]   ;key
    mov esi, [ebp + 12]  ;haystack
    mov ebx, [ebp + 16]  ;ciphertext
    ;; DO NOT MODIFY

    xor ecx, ecx
    xor eax, eax

current_column_idx:
    mov edx, [edi + 4 * ecx]			; punem in edx pe key[i] (coloana curenta de traversat)
    inc ecx								; i - contorul lui key
    cmp ecx, [len_cheie]
    jg exit

    push ecx
    mov cl, [esi + edx]					; obtinem byte-ul din haystack[key[i]]
    mov [ebx + eax], cl					; il punem in cyphertext[j]
    pop ecx

    inc eax								; j - contorul lui ciphertext

traverse_column:
    add edx, [len_cheie]				; trecem pe linia urmatoare
    cmp edx, [len_haystack]			    ; nu depasim lungimea haystack-ului
    jge current_column_idx			    ; daca am depasit, trecem la urmatoarea coloana din key

    push ecx
    mov cl, [esi + edx]
    mov [ebx + eax],  cl
    pop ecx

    inc eax
    jmp traverse_column
   
exit:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY