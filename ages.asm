; This is your structure
struc  my_date
    .day: resw 1
    .month: resw 1
    .year: resd 1
endstruc

section .text
    global ages

; void ages(int len, struct my_date* present, struct my_date* dates, int* all_ages);
ages:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; present
    mov     edi, [ebp + 16] ; dates
    mov     ecx, [ebp + 20] ; all_ages
    ;; DO NOT MODIFY

    ;; TODO: Implement ages
    ;; FREESTYLE STARTS HERE

loop:
    mov eax, [esi + my_date.year]
    mov ebx, [edi + (edx - 1) * my_date_size + my_date.year]

    ; comparam anul curent cu anul de nastere
    cmp eax, ebx

    ; daca anul curent <= anul de nastere, sarim la yearle
    jle yearle

    ; altfel, anul curent > anul de nastere, deci punem diferenta
    sub eax, ebx	

    ; in vectorul all_ages							
    mov dword [ecx + 4 * (edx - 1)], eax		



    movzx eax, word [esi + my_date.month]
    movzx ebx, word [edi + (edx - 1) * my_date_size + my_date.month]

    ; comparam luna curenta cu luna de nastere
    cmp eax, ebx

    ; daca luna curenta <= luna de nastere, sarim la monthle			
    jle monthle

    ; altfel, putem trece la urmatorul coechipier
    jmp continue_check


; anul curent <= anul de nastere, deci varsta este 0
yearle:
    xor eax, eax
    mov dword [ecx + 4 * (edx - 1)], eax

    ; trecem la urmatorul coechipier
    jmp continue_check


monthle:
    cmp eax, ebx

    ; daca lunile sunt egale, sarim la monthequal si vom compara zilele
    je monthequal

    ; altfel, decrementam varsta cu 1 si trecem la urmatorul coechipier
    mov eax, dword [ecx + 4 * (edx - 1)]
    dec eax
    mov dword [ecx + 4 * (edx - 1)], eax
    jmp continue_check


monthequal:
    movzx eax, word [esi + my_date.day]
    movzx ebx, word [edi + (edx - 1) * my_date_size + my_date.day]
    cmp eax, ebx

    ; daca ziua curenta < ziua de nastere, sarim la dayless
    jl dayless

    ; altfel, trecem la urmatorul coechipier
    jmp continue_check


; si ziua curenta < ziua de nastere, deci decrementam varsta cu 1
dayless:
    mov eax, dword [ecx + 4 * (edx - 1)]
    dec eax
    mov dword [ecx + 4 * (edx - 1)], eax
    jmp continue_check



; conditie de testare a buclei
continue_check:
    dec edx
    test edx, edx
    jle exit
    jmp loop

exit:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
