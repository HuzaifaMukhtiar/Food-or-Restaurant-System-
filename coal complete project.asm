.model small
.stack 100h

.data
welcome_msg db  "  +-----------------------------------------+", 10, 13, '$'
welcome_msg2 db "  |          Welcome to Our Restaurant      |", 10, 13, '$'
welcome_msg3 db "  +-----------------------------------------+", 10, 13, '$'
menu_option_1 db "  +-----------------------------------------+", 10, 13,
              db "  |         1. Breakfast Menu               |", '$'
menu_option_2 db "  |         2. Lunch Menu                   |", '$'
menu_option_3 db "  |         3. Dinner Menu                  |", '$'
menu_option_4 db "  |         4. Snacks                       |", '$'
menu_option_5 db "  |         5. Sweets                       |", '$'
menu_option_6 db "  |         6. Drinks                       |", '$'
menu_option_7 db "  |         7. Exit                         |", 10, 13,
              db "  +-----------------------------------------+", 10, 13, '$'
menu_prompt db   "  |  Enter your choice (1-7): ", '$'
dining_option db "  |  Select Dining (1) or Delivery (2): $", 10, 13, '$'
dining_selected_msg db 10, 13, "  |  Dining selected.$", 10, 13, '$'
delivery_selected_msg db 10, 13, "  |  Delivery selected.$", 10, 13, '$'
breakfast_header db "  +-----------------------------------------+", 10, 13,
                 db "  |            Breakfast Menu               |", 10, 13,
                 db "  +-----------------------------------------+", '$'                 
lunch_header     db "  +-----------------------------------------+", 10, 13,
                 db "  |            Lunch Menu                   |", 10, 13,
                 db "  +-----------------------------------------+", '$'                 
dinner_header    db "  +-----------------------------------------+", 10, 13,
                 db "  |            Dinner Menu                  |", 10, 13,
                 db "  +-----------------------------------------+", '$'                   
snacks_header    db "  +-----------------------------------------+", 10, 13,
                 db "  |            Snack Menu                   |", 10, 13,
                 db "  +-----------------------------------------+", '$'                   
sweets_header    db "  +-----------------------------------------+", 10, 13,
                 db "  |            Sweet Menu                   |", 10, 13,
                 db "  +-----------------------------------------+", '$'
drinks_header    db "  +-----------------------------------------+", 10, 13,
                 db "  |            Drinks Menu                  |", 10, 13,
                 db "  +-----------------------------------------+", '$'
breakfast_item_1 db "  |        1. Tanduri Roti - Rs. 15         |", '$'
breakfast_item_2 db "  |        2. Paratha      - Rs. 25         |", '$'
breakfast_item_3 db "  |        3. Fried Egg    - Rs. 35         |", '$'
breakfast_item_4 db "  |        4. Halwa        - Rs. 45         |",10, 13,
                 db "  +-----------------------------------------+", '$'
breakfast_prompt db "  |  What do you want to order? (1-4): ", '$'
lunch_item_1     db "  |        1. Chicken Biryani - Rs. 20      |", '$' 
lunch_item_2     db "  |        2. Plain Rice      - Rs. 38      |", '$' 
lunch_item_3     db "  |        3. Beef Curry      - Rs. 34      |", '$'
lunch_item_4     db "  |        4. Mixed Vegetables- Rs. 42      |", 10, 13, 
                 db "  +-----------------------------------------+", '$'
lunch_prompt     db "  |  What do you want to order? (1-4): ",'$'                 
dinner_item_1    db "  |        1. Chicken Karahi  - Rs. 56      |", '$'
dinner_item_2    db "  |        2. Mutton Karahi   - Rs. 34      |", '$'
dinner_item_3    db "  |        3. Pulao           - Rs. 30      |", '$'
dinner_item_4    db "  |        4. BBQ Platter     - Rs. 45      |", 10, 13,
                 db "  +-----------------------------------------+", '$'
dinner_prompt    db "  |  What do you want to order? (1-4): ", '$'
snacks_item_1    db "  |        1. Samosa          - Rs. 25      |", '$'
snacks_item_2    db "  |        2. Pakora          - Rs. 87      |", '$'
snacks_item_3    db "  |        3. Sandwich        - Rs. 36      |", '$'
snacks_item_4    db "  |        4. Fries           - Rs. 90      |", 10, 13,
                 db "  +-----------------------------------------+", '$'
snacks_prompt    db "  |  What do you want to order? (1-4): ", '$'
sweets_item_1    db "  |        1. Gulab Jamun     - Rs. 45      |", '$'
sweets_item_2    db "  |        2. Rasgulla        - Rs. 26      |", '$'
sweets_item_3    db "  |        3. Kheer           - Rs. 23      |", '$'
sweets_item_4    db "  |        4. Ice Cream       - Rs. 49      |", 10, 13,
                 db "  +-----------------------------------------+", '$'
sweets_prompt    db "  |  What do you want to order? (1-4): ", '$'
drinks_item_1    db "  |        1. Soft Drinks     - Rs. 10      |", '$'
drinks_item_2    db "  |        2. Tea             - Rs. 20      |", '$'
drinks_item_3    db "  |        3. Coffee          - Rs. 30      |", '$'
drinks_item_4    db "  |        4. Juice           - Rs. 40      |", 10, 13,
                 db "  +-----------------------------------------+", '$'
drinks_prompt    db "  |  What do you want to order? (1-4): ", '$'
enter_quantity db "  |  Enter Quantity: $", 10, 13, '$'
add_another_prompt db "  |  Do you want to add another item? (y/n): $"
invalid_choice db "  |  Invalid choice. Try again.$", 10, 13, '$'
order_summary db "  |  Your Order Summary:$", 10, 13, '$'
total_bill_msg db "  |  Your Total Bill is: Rs. $", 10, 13, '$'
thank_you_msg db "  +-----------------------------------------+", 10, 13,
              db "  |         Thank you for visiting!         |", 10, 13,
              db "  +-----------------------------------------+", 10, 13, '$'
newline db 10, 13, '$'
menu_choice db ?
item_choice db ?
quantity db ?
total_bill dw 0
item_price dw ?
dining_choice db ?

.code
.startup
start:
call display_welcome
call display_main_menu
call get_menu_choice
call handle_menu_choice
call select_dining_or_delivery      

display_welcome proc
    lea dx, welcome_msg
    mov ah, 9
    int 21h
    lea dx, welcome_msg2
    mov ah, 9
    int 21h
    lea dx, welcome_msg3
    mov ah, 9
    int 21h
    ret
display_welcome endp 

display_main_menu proc
    lea dx, menu_option_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, menu_option_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, menu_option_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, menu_option_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, menu_option_5
    mov ah, 9
    int 21h 
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, menu_option_6
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h  
    lea dx, menu_option_7
    mov ah, 9
    int 21h
    lea dx, menu_prompt
    mov ah, 9
    int 21h
    ret
display_main_menu endp

get_menu_choice proc
    mov ah, 1
    int 21h
    sub al, '0'
    mov menu_choice, al
    ret
get_menu_choice endp 

wait_for_key proc
    mov ah, 0 
    int 16h   
    ret
wait_for_key endp 

handle_menu_choice proc
    cmp menu_choice, 1
    je display_breakfast_menu
    cmp menu_choice, 2
    je display_lunch_menu
    cmp menu_choice, 3
    je display_dinner_menu
    cmp menu_choice, 4
    je display_snacks_menu
    cmp menu_choice, 5
    je display_sweets_menu
    cmp menu_choice, 6
    je display_drinks_menu
    cmp menu_choice, 7
    je display_exit
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    call wait_for_key
    call display_main_menu
    call get_menu_choice
    jmp handle_menu_choice
    ret
handle_menu_choice endp 

display_breakfast_menu proc
    mov total_bill, 0
menu_loop:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, breakfast_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item
    cmp item_choice, 4
    ja invalid_item
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    lea dx, newline
    mov ah, 9
    int 21h
    call process_bill1
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop
    cmp al, 'Y'
    je menu_loop
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9          
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item:
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop
display_breakfast_menu endp

display_lunch_menu proc
    mov total_bill, 0
menu_loop1:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, lunch_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item1
    cmp item_choice, 4
    ja invalid_item1
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    call process_bill2
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop1
    cmp al, 'Y'
    je menu_loop1
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item1:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop1
display_lunch_menu endp 

display_dinner_menu proc
    mov total_bill, 0
menu_loop2:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, dinner_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item2
    cmp item_choice, 4
    ja invalid_item2
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    call process_bill3
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop2
    cmp al, 'Y'
    je menu_loop2
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item2:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop2
display_dinner_menu endp
                        
display_snacks_menu proc
    mov total_bill, 0
menu_loop3:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, snacks_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item3
    cmp item_choice, 4
    ja invalid_item3
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    call process_bill4
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop3
    cmp al, 'Y'
    je menu_loop3
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item3:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop3
display_snacks_menu endp 

display_sweets_menu proc
    mov total_bill, 0
menu_loop4:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, sweets_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item4
    cmp item_choice, 4
    ja invalid_item4
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    call process_bill5
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop4
    cmp al, 'Y'
    je menu_loop4
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item4:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop4
display_sweets_menu endp 

display_drinks_menu proc
    mov total_bill, 0
menu_loop5:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_header
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_item_1
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_item_2
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_item_3
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_item_4
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, drinks_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov item_choice, al
    cmp item_choice, 1
    jb invalid_item5
    cmp item_choice, 4
    ja invalid_item5
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, enter_quantity
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov quantity, al
    call process_bill6
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, add_another_prompt
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    cmp al, 'y'
    je menu_loop5
    cmp al, 'Y'
    je menu_loop5
    lea dx, newline
    mov ah, 9
    int 21h
    call select_dining_or_delivery
    lea dx, newline
    mov ah, 9
    int 21h
    call display_final_bill
    call thank_customer
    mov ah, 4Ch
    int 21h
invalid_item5:
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp menu_loop5
display_drinks_menu endp

select_dining_or_delivery proc
    lea dx, dining_option
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h
    sub al, '0'
    mov dining_choice, al
    cmp dining_choice, 1
    je dining_selected
    cmp dining_choice, 2
    je delivery_selected
    lea dx, invalid_choice
    mov ah, 9
    int 21h
    jmp select_dining_or_delivery
dining_selected:
    lea dx, dining_selected_msg
    mov ah, 9
    int 21h
    ret
delivery_selected:
    lea dx, delivery_selected_msg
    mov ah, 9
    int 21h
    ret
select_dining_or_delivery endp

process_bill1 proc
    cmp item_choice, 1
    je item1_breakfast
    cmp item_choice, 2
    je item2_breakfast
    cmp item_choice, 3
    je item3_breakfast
    cmp item_choice, 4
    je item4_breakfast
item1_breakfast:
    mov ax, 15
    jmp calculate_total
item2_breakfast:
    mov ax, 25
    jmp calculate_total
item3_breakfast:
    mov ax, 35
    jmp calculate_total
item4_breakfast:
    mov ax, 45
calculate_total:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill1 endp

process_bill2 proc
    cmp item_choice, 1
    je item1_lunch
    cmp item_choice, 2
    je item2_lunch
    cmp item_choice, 3
    je item3_lunch
    cmp item_choice, 4
    je item4_lunch
item1_lunch:
    mov ax, 20
    jmp calculate_total1
item2_lunch:
    mov ax, 38
    jmp calculate_total1
item3_lunch:
    mov ax, 34
    jmp calculate_total1
item4_lunch:
    mov ax, 42
calculate_total1:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill2 endp

process_bill3 proc
    cmp item_choice, 1
    je item1_dinner
    cmp item_choice, 2
    je item2_dinner
    cmp item_choice, 3
    je item3_dinner
    cmp item_choice, 4
    je item4_dinner
item1_dinner:
    mov ax, 56
    jmp calculate_total2
item2_dinner:
    mov ax, 34
    jmp calculate_total2
item3_dinner:
    mov ax, 30
    jmp calculate_total2
item4_dinner:
    mov ax, 45
calculate_total2:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill3 endp

process_bill4 proc
    cmp item_choice, 1
    je item1_snacks
    cmp item_choice, 2
    je item2_snacks
    cmp item_choice, 3
    je item3_snacks
    cmp item_choice, 4
    je item4_snacks
item1_snacks:
    mov ax, 25
    jmp calculate_total3
item2_snacks:
    mov ax, 87
    jmp calculate_total3
item3_snacks:
    mov ax, 36
    jmp calculate_total3
item4_snacks:
    mov ax, 90
calculate_total3:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill4 endp
process_bill5 proc
    cmp item_choice, 1
    je item1_sweets
    cmp item_choice, 2
    je item2_sweets
    cmp item_choice, 3
    je item3_sweets
    cmp item_choice, 4
    je item4_sweets
item1_sweets:
    mov ax, 45
    jmp calculate_total4
item2_sweets:
    mov ax, 26
    jmp calculate_total4
item3_sweets:
    mov ax, 23
    jmp calculate_total4
item4_sweets:
    mov ax, 49
calculate_total4:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill5 endp
process_bill6 proc
    cmp item_choice, 1
    je item1_drinks
    cmp item_choice, 2
    je item2_drinks
    cmp item_choice, 3
    je item3_drinks
    cmp item_choice, 4
    je item4_drinks
item1_drinks:
    mov ax, 10
    jmp calculate_total5
item2_drinks:
    mov ax, 20
    jmp calculate_total5
item3_drinks:
    mov ax, 30
    jmp calculate_total5
item4_drinks:
    mov ax, 40
calculate_total5:
    mov item_price, ax
    mov ax, item_price
    mul quantity
    add total_bill, ax
    ret
process_bill6 endp 
display_final_bill proc
    lea dx, total_bill_msg
    mov ah, 9
    int 21h
    mov ax, total_bill
    call print_number
    lea dx, newline
    mov ah, 9
    int 21h
    ret
display_final_bill endp 
thank_customer proc
    lea dx, thank_you_msg
    mov ah, 9
    int 21h
    lea dx, newline
    mov ah, 9
    int 21h 
    jmp start
    ret
thank_customer endp 
print_number proc
    push ax
    xor cx, cx
    mov bx, 10
print_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz print_loop
output_loop:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop output_loop
    pop ax
    ret
print_number endp
display_exit proc
    lea dx, newline
    mov ah, 9
    int 21h
    lea dx, thank_you_msg
    mov ah, 9
    int 21h
    mov ah, 4ch
    int 21h
    ret
display_exit endp
end