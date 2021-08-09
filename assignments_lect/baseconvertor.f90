!Debasis Buxy
!PRN: 22020004154
!to convert a number in base A to a number in decimal(base 10)
!and also to a number in base B 
program CONVERTOR
    implicit none
    integer :: M, N, A, B, I, J, TEMP, S = 0
    character(100) :: C
    integer, dimension(100) :: X

    write(*,*) "Enter a number: "
    read(*,*) C !copy entire line
    write(*,*) "Enter base of the number: "
    read(*,*) A
    write(*,*) "Enter new base: "
    read(*,*) B

    N = len_trim(C) !length of string ignoring blank spaces
    !convert number in base A to decimal
    do I=1,N
        TEMP = ichar(C(I:I)) !character at the ith location
        if (TEMP >= 48 .and. TEMP <= 57) then ! if number
            S = S*A+TEMP-48
        else if (TEMP >= 65 .and. TEMP <= 90) then ! if uppercase letter
            S = S*A+TEMP-55
        else if (TEMP >= 97 .and. TEMP <= 122) then ! if lowercase letter
            S = S*A+TEMP-87
        else 
            write(*,*) "Invalid input!"
        end if 
    end do

    !convert number in decimal to base B
    I = 1
    M = S
    do
        X(I) = mod(M,B)
        M = M/B
        if (M == 0) then
            exit
        else
            I = I+1
        end if
    end do

    write(*,*) "Equivalent number in base 10 :"
    write(*,120) S
    write(*,*) "Equivalent number in the new base :"
    do J = I, 1, -1
        if (X(J) < 10) then
            write(*,100,advance='no') X(J)
        else
            write(*,110,advance='no') char(55+X(J))
        end if
    end do

100 format(i1)
110 format(a1)
120 format(i0)
end program CONVERTOR