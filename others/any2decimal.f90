program TEST
    implicit none
    integer :: N, A, S = 0, I, val
    character(100) :: C
    write(*,*) "Enter a number"
    read(*,*) C
    write(*,*) "Enter base"
    read(*,*) A
    N = len_trim(C)
    do I=1,N
        val = ichar(C(I:I))
        if (val >= 48 .and. val <= 57) then ! if number
            S = S*A+val-48
        else if (val >= 65 .and. val <= 90) then ! if uppercase letter
            S = S*A+val-55
        else if (val >= 97 .and. val <= 122) then ! if lowercase letter
            S = S*A+val-87
        else 
            write(*,*) "Invalid input!"
        end if 
    end do
    write(*,*) S
end program TEST