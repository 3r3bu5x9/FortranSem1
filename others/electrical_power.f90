program electrical_power
    !To calculate the current, real, reactive, and apparent power, and the power factor supplied to a load.
    implicit none
    !Data dictionary: constants
    real, parameter :: PI = 3.141592654
    real, parameter :: DEG_2_RAD = PI/180
    !Data dictionary: variables
    real :: V
    real :: Z
    real :: THETA
    real :: I
    real :: P
    real :: Q
    real :: S
    real :: PF
    !Prompt for input
    write (*,*) "Enter rms voltage of power source in volts"
    read (*,*) V
    write (*,*) "Enter magnitude of impedance in ohms and angle of impedance in degrees"
    read (*,*) Z, THETA
    !Calculations
    I = V/Z
    P = V*I*cos(THETA*DEG_2_RAD)
    Q = V*I*sin(THETA*DEG_2_RAD)
    S = V*I
    PF = cos(THETA*DEG_2_RAD)
    !Output
    write (*,*) "Voltage        =", V,"volts"
    write (*,*) "Impedance      =", Z, "ohms at ", THETA , " degrees"
    write (*,*) "Current        =", I, "amperes"
    write (*,*) "Real power     =", P, "watts"
    write (*,*) "Reactive power =", Q, "volt-amperes-reactive"
    write (*,*) "Apparent power =", S, "volt-amperes"
    write (*,*) "Power factor   =", PF
    !Finish
end program electrical_power