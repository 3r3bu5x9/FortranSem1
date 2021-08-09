program conversion
    implicit none !assume nothing about variables otherwise uncleared names starting with I-N are INTEGER and ones with A-H and O-Z are REAL
    real :: input_m, output_cm
    print*, 'type length in m'
    read*, input_m
    output_cm = 100.0*input_m
    print*, 'length in cm=',output_cm
end program conversion