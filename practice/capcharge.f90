module MODCAP
    real, parameter :: CAPACITANCE = 0.025 !in farad
end module MODCAP

function FUNC(T) !current
    implicit none
    real :: FUNC, T
    FUNC = 4*(1-exp(-0.5))*exp(-0.5*(T-1))*(1-exp(-T))
end function FUNC

function INTEGRATE(D1,D2)
    implicit none
    real :: INTEGRATE, FUNC, D1, D2
    real :: H, S1, S2, S3
    integer :: I,N
    S1 = FUNC(D1)+FUNC(D2)
    N = 100
    H = (D2-D1)/N
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + FUNC(D1+I*H)
        else
            S3 = S3 + FUNC(D1+I*H)
        end if
    end do
    INTEGRATE = (H/3.0)*(S1+4*S2+2*S3)
end function INTEGRATE

function FINDCURRENT(T)
    use MODCAP
    implicit none
    real :: FINDCURRENT, T, FUNC
    FINDCURRENT = FUNC(T)
end function FINDCURRENT

function FINDCHARGE(T)
    use MODCAP
    implicit none
    real :: FINDCHARGE, T, INTEGRATE
    FINDCHARGE = INTEGRATE(1.0,T)
end function FINDCHARGE

function FINDVOLTAGE(T)
    use MODCAP
    implicit none
    real :: FINDVOLTAGE, T, FINDCHARGE
    FINDVOLTAGE = FINDCHARGE(T)/CAPACITANCE
end function FINDVOLTAGE

program CAPCHARGE
    use MODCAP
    implicit none
    real :: FINDCURRENT, FINDCHARGE, FINDVOLTAGE
    real :: T(3) = (/4.0, 6.0, 20.0/)
    integer :: I
    real :: TAU, DTAU
    open(unit=1, file="capcharge.txt")
    write(*,100) (T(I), FINDCURRENT(T(I)), FINDCHARGE(T(I)), FINDVOLTAGE(T(I)), I = 1,3)
    write(1,110)
    TAU = 1.0
    DTAU = 0.1
    do I = 1,200
        write(1,120) TAU, FINDCURRENT(TAU), FINDCHARGE(TAU), FINDVOLTAGE(TAU)
        TAU = TAU+DTAU
    end do

100 format ("Time: ",   T10, F8.2, " seconds" ,/, &
            "Current: ",T10, F8.4, " amperes" ,/, &
            "Charge: " ,T10, F8.4, " coulombs" ,/, &
            "Voltage: ",T10, F8.4, " volts",/)
110 format("Time", T15, "Current", T30, "Charge", T45, "Voltage")
120 format (F8.4, T15, F8.6, T30, F8.6, T45, F10.6)
end program CAPCHARGE