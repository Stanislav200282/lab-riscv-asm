.data
N:
.word 4 
M:
.word 3
matrix:
.word 0, 5, 5, 5
.word 48, 2, 118, 0
.word 0, 50, 15, 70
result: #max element index
.word 0
.word 0

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process

la a2, result
call print
call exit

print:

addi a0, x0, 1 # print_int ecall
lw a1, 4(a2)   # M to a1
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32 
ecall

addi a0, x0, 1 # print_int ecall
lw a1, 0(a2)   # N to a1
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

ret




exit:
addi a0, x0, 10
ecall



process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer
addi t5, x0, 0 # N index of max element
addi t6, x0, 0 # M index of max element
addi a6, x0, 0 # max val

init:
addi t3, x0, 0 # row element number

cycle:
lw t0, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer

blt t0, a6, next # if matrix element <= max go next 
mv a6, t0 # else set new max
mv t5, t3 # set N index of new max element
mv t6, t4 # set M index of new max element

next:
addi t3, t3, 1 #increment row element number pointer
blt t3, t1, cycle #if row is not over go to next row element
addi t4, t4, 1 #increment row number pointer
blt t4, t2, init #if matrix is not over go to next row
sw t5, 0(a5) #save N index 
sw t6, 4(a5) #save M index 
ret