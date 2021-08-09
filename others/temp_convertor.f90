program temp_convertor
    implicit none
    real, parameter :: C = 273.15
    real :: temp_k, temp_f
    write (*,*) "Enter temperature in fahrenheit: "
    read (*,*) temp_f
    write (*,*) "Temperature in Fahrenheit = ", temp_f
    temp_k = ((5./9.) * (temp_f - 32.)) + C
    write (*,*) "Temperature in Kelvin = ", temp_k
end program temp_convertor