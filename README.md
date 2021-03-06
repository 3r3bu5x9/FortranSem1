### **Fortran character set**

No. of symbols| Type | Values |
-----------------|------|--------|
26| Uppercase letters | A-Z |
26| Lowercase letters | a-z |
10| Digits | 0-9 |
1 | Underscore character | _ |
5 | Arithmetic symbols | + - * / ** |
28| Miscellaneous symbols | ( ) . = , ' $ : ! " % & ; < > ? <br> ~ \ [ ] ` ^ { } \| # @ and blank

### **Structure of a Fortran statement**

- There are two kinds of statements:
  - _Executable statements_ - statements which result in machine/processor instruction, ex- READ, WRITE, STOP, GOTO, IF, ELSE, DO, etc
  - _Nonexecutable statements_ - donot result in machine instruction, ex- FORMAT, TYPE, END, COMMON, DIMENSION, FUNCTION, etc.
  - `STOP` is an _executable_ statement as it stops the computer from executing the next machine-language instruction/ stops running the program
  - `END` is a _non executable_ statement as it tells the compiler that this is the end of the program and there are no more FORTRAN statements to be transferred to machine-language instruction(compiled)
- 132 character limit per line
- Lines may be joined using the ampersand(&) character
- 256 lines limit of a statement
- _Statement lables_: optional numbers(1-99,999) at the beginning of a statement that has to be unique to each line 
- Variable name 63 characters long
- Comment using `!` at the beginning of any statement

### **Structure of a Fortran program**

```
PROGRAM program_name
    ! Description of the program
    ! Declaration
    IMPLICIT NONE ! assume nothing about variables otherwise uncleared names starting with I-N 
                  ! are INTEGER and ones with A-H and O-Z are REAL
    REAL :: var ! variable
    REAL, PARAMETER :: const = 9.3E-2 ! constant
    ! Execution
    WRITE (*,*) 'Enter var'
    READ (*,*) var
    var = var + 2
    WRITE (*,*) 'New var = ', var
    WRITE (*,100,advance='no') 'New var = ', var
    100 FORMAT(i1)
    ! Termination
    STOP "message" ! optional/auto generated
END PROGRAM program_name
```
- `advance='no'` means that the write statement will not advance to the next record (next line) after finishing the writing

### Data types(intrinsic)
- `INTEGER`
  - declaration: `INTEGER :: var` 
  - no decimal points or commas
- `REAL`
  - declaration: `REAL :: var` 
  - value stored in two parts: the _mantissa_ and the _exponent_
  - [mantissa]E[exponent]
  - embedded commas are illegal
  - decimal point required in mantissa
  - decimal point not allowed in exponent
  - _precision_ no of bits allocated to the mantissa
  - _range_ no of bits allocated to the exponent
- `CHARACTER`
  - declaration: `CHARACTER(15) :: var` here 15 is the length of the string `var`
  - consists of strings of alphanumeric characters
  - is a string of characters enclosed in single (') or double (") quotes
  - The minimum number of characters in a string is 0
  - characters between the two single or double quotes are said to be in a character context
- `LOGICAL`
  - declaration: `LOGICAL :: var`
  - can hold `TRUE` or `FALSE`

### Variable names
- names starting with i,j,k,l,m,n are assumed to be `INTEGER`
-  A variable name must start with an letter. After that, the rest of the name can contain only letters (a--z), digits (0--9) or underscore character _ (no blanks!) 
-  A variable name can be no longer than 31 characters.
- declarations take place before the first executable statement

### Constants
`type, PARAMETER :: var = val` makes var immutable

### Hierarchy of arithmetic operations
_Parenthesis_(L2R) -> _Exponentials_(R2L) -> _Multiplications_ and _divisions_(L2R) -> _Additions_ and _subtractions_(L2R)

### Relational operators
- `<` ,`>` ,`==` ,`/=` ,`<=` , `=>`
- operands are variables(numerical or character)

### Combinational logic operators
- `.AND.`, `.OR.`, `.EQV.`, `.NEQV.` , `.NOT.`
- operands are logical expressions

### Hierarchy of operations
arithmetic operations -> relational operations(L2R) -> `.NOT.` -> `.AND.` -> `.OR.` -> `.EQV.` and `.NEQV.` (all L2R)

### else-if
```
if (...) then
  ...
else if (...) then
  ...
else
  ...
end if
```

### do loop
- variant 1:
  ```
  do
    ...
    if (...) exit
    ...
  end do
  ```
- variant 2
  ```
  do I = N1, N2, N3
    ...
    ...
  end do
  ```
  - `N1` is the starting value
  - `N2` is the ending value
  - `N3` is the increment, if not specified then default increment is +1

### do while
  ```
  do while(logical_expr)
    ...
    ...
    ...
  end do
  ```

### CYCLE and EXIT
- `CYCLE` when put in a loop transfers control to the beginning of the loop
- `EXIT` stops execution of the loop and transfers control to the first aexecutable statement after the loop

### string manipulation
  ```
  character(len=6) :: str1, str2, str
  str = str1(1:4) // str2(5:6)
  ```
- `str(initIndex, endIndex)` forms the string with all the characters from init to end index
- `//` concatenates strings
- character strings can be compared to character strings
- character strings cannot be compared to numbers

## Array
- variant 1
  ```
  integer :: SIZE = 100
  type, dimension(SIZE) :: A
  A = [1.,2.,3.,4.,5.,6.,7.,8.,9.,10.]
  ```
  - `SIZE` is the size of the array
- variant 2
  ```
  integer :: UPPER = 0, LOWER = 10
  type, dimension(UPPER:LOWER) :: B
  ```
  - `UPPER` and `LOWER` defines the range of values the index can take and also defines length of array
- variant 3
  ```
  type :: A(100)
  ```
  
## I/O
- **Formats** are used to specify the exact manner in which variables are to be printed out by a program. In general, a format can specify both the horizontal and the vertical position of the variables on the paper, and also the number of significant digits to be printed out.
- when no format is used like `read (*,*)` this is called a _free-format_ statement.
```
WRITE (*,100) i, result 
100 FORMAT (' The result for iteration ', I3,' is ', F7.3)
```
  - `I3` specifies that a space of 3 characters is to be used to print the value of `i`
  - `F7.3` specifies that a space of 7 characters is to be used to print the value of `result` with 3 spaces reserved for decimals.
- **Control characters**
  - specify the vertical spacing of a line
  ```
  WRITE (*,100)    
  100 FORMAT ('1','This heading is at the top of a new page.')    WRITE (*,110)
  ```
  - here `'1'` is a control character
  
  Control character | Action
  ---------|----------
   1 | Skip to new page
   Blank | Single spacing (single return)
   0 | Double spacing (double return)
   \+ | Print over previous line

- **Format descriptors**
  There are many different format descriptors. They fall into four basic categories:   
  1. Format descriptors that describe the vertical position of a line of text.   
  2. Format descriptors that describe the horizontal position of data in a line.   
  3. Format descriptors that describe the output format of a particular value.   
  4. Format descriptors that control the repetition of portions of a format.
  
  | Symbol | Meaning
  |--------|---------
  | c | column number
  | d | number of digits to the right of the decimal place for real input or output
  | m | minimum number of digits to be displayed
  | n | number of spaces to skip
  | r | _repeat count_- the number of times to use a descriptor or group of descriptors
  | w | _field width_- the number of characters to use for the input or output

  - **Integer Output???The I Descriptor**
    - `rIw` or `rIw.m`
    - If an integer is too large to fit into the field in which it is to be printed, then the field is filled with asterisks
    - special case of the _zero length descriptor_ `I0` causes the integer to be written
out with a variable field width sufficient to hold the information contained in the integer.
  - **Real Output???The F Descriptor**
    - `rFw.d`
  - **Real Output???The E Descriptor**
    - `rEw.d`
    - mantissa in the range 0.1 to 1.0
    - the width of an E format descriptor field must satisfy the expression  _w ??? d + 7_
or the field may be filled with asterisks. 
The seven extra characters required are used as follows: 1 for the sign of the mantissa, 2 for the zero and decimal point, 1 for the E, 1 for the sign of the exponent, and 2 for the exponent itself
  - **True Scientific Notation???The ES Descriptor**
    - `rESw.d`
    - mantissa in the range 1 to 10
  - **Horizontal Positioning???The X and T Descriptor**
    - X descriptor
      - `nX`
      - inserts spaces into the buffer
      - n is the number of blanks to insert. It is used to add one or more blanks between two values on the output line
    - T descriptor
      - `Tc`
      - c is the column number to go to. It is used to jump directly to a specific column in the output buffer
  - **String output-A descriptor**
      - `A` or `Aw`
      - for strings
  - **Repeating Groups of Format Descriptors**
    - `FORMAT(n(...))`
    - n can be integer or asterisk, use asterisks to repeat format indefinitely till data runs out
  - **Vertical positionong - / descriptor**
    -  slash (/) descriptor causes the current output buffer to be sent to the printer, and a
new output buffer to be started

## **Reading from a file**
- `open (unit, file, status, action, iostat, iomsg)`
 1. A UNIT= clause indicating the i/o unit number to associate with this file. This clause has the form,
  UNIT= int_expr
  where int_expr can be a nonnegative integer value.
  2. A FILE= clause specifying the name of the file   to be opened. This clause has the form,
  FILE= char_expr
  where char_expr is a character value containing   name of the file to be opened.
  3. A STATUS= clause specifying the status of the  file to be opened. This clause has the
  form,
  STATUS= char_expr
  where char_expr is one of the following: 'OLD',   'NEW', 'REPLACE', 'SCRATCH',
  or 'UNKNOWN'.
  4. An ACTION= clause specifying whether a file is   to be opened for reading only, for
  writing only, or for both reading and writing.  This clause has the form,
  ACTION= char_expr
  where char_expr is one of the following: 'READ',  'WRITE', or 'READWRITE'. If
  no action is specified, the file is opened for  both reading and writing.
  5. An IOSTAT= clause specifying the name of an  integer variable in which the status
  of the open operation can be returned. This   clause has the form,
  IOSTAT= int_var
  where int_var is an integer variable. If the OPEN   statement is successful, a 0 will
  be returned in the integer variable. If it is not   successful, a positive number
  corresponding to a system error message will be   returned in the variable. The
  system error messages vary from processor to  processor, but a zero always means
  success.
  6. An IOMSG= clause specifying the name of a  character variable that will contain a
  message if an error occurs. This clause has the  form,
  IOMSG= chart_var
  where char_var is a character variable. If the  OPEN statement is successful, the
  contents of the character variable will be  unchanged. If it is not successful, a
  descriptive error message will be returned in   this string.
- `close 1`, closes a file prviously opened, optional
- `read (1,*)`, 1 is the file identifier
- creates file object for use in the program (creates file in dir or opens it)
- unit has to an integer
- avoid filenames starting with numerals
- avoid `unit=4` and `unit=5`

## Procedures
- Subroutines invoked by `call` statement, functions invoked by `function`
- 8 character long name
- **Subroutines**
  - `subroutine SUB1(<list of variables>)`
  ```
  subroutine SUB1(SIDE1, SIDE2, HYPOTENUSE) !dummy args
  implicit none
  !dont use read statements
  real,intent(in) :: SIDE1, SIDE2 !input parameters
  real,intent(out) ::  HYPOTENUSE !output parameters
  !intent(in out) can be used for input and output
  real :: TEMP !local variable
  TEMP = SIDE1**2+SIDE2**2
  HYPOTENUSE = sqrt(TEMP)
  return !stops execution of subroutine block; optional
  end subroutine SUB1
  program SUBEX
      implicit none
      real :: SIDE1, SIDE2, HYPOTENUSE
      write(*,*) "Enter side1 and side2:"
      read(*,*) SIDE1, SIDE2
      call SUB1(SIDE1, SIDE2, HYPOTENUSE) !actual args, call by reference
      write(*,*) HYPOTENUSE
  end program SUBEX
  ```
  - **Functions**
     ```function FUNC1(<argument list>)```
     - **Arithmetic stament function**
     - 


### Some common character intrinsic functions
Function name | Argument type | Result type | Comments
|-----|-----|-----|-----    
| `ACHAR(ival)`    | `INT`  | `CHAR` | Returns the character corresponding to ival in the ASCII collating sequence. 
| `IACHAR(char)`   | `CHAR` | `INT`  | Returns the integer corresponding to char in the ASCII collating sequence.   |   |
| `LEN(strl)`      | `CHAR` | `INT`  | Returns length of strl in characters.                                        |   |
| `LEN_TRIM(str1)` | `CHAR` | `INT`  | Returns length of strl, excluding any trailing blanks.                       |   |
| `TRIM(str1)`     | `CHAR` | `CHAR` | Returns strl with trailing blanks removed.                                   |   |
    
### Type conversion functions

Function name | Argument type | Result type | Comments
---------|----------|----------|---------
 `INT(X)` | `REAL` | `INTEGER` | Integer part of x (x is truncated)
 `NINT(X)` | `REAL` | `INTEGER` | Nearest integer to x (x is rounded)
 `CEILING(X)` | `REAL` | `INTEGER` | Nearest integer above or equal to the value of x
 `FLOOR(X)` | `REAL` | `INTEGER` | Nearest integer below or equal to the value of x
 `REAL(I)` | `INTEGER` | `REAL` | Converts integer value to real

### **Some common intrinsic functions**

 | Function name and arguments | Function value | Argument type | Result type | Comments                                                                |
| --------------------------- | -------------- | ------------- | ----------- | ----------------------------------------------------------------------- |
| `SQRT(X)`     | sqrt(x)    | `REAL`          | `REAL`    | Square root of x for X > 0                                                |
| `ABS(X)`      |            | `REAL`/`INTEGER`  | \*      | Absolute value of x                                                     |
| `ACHAR(I)`    |            | `INTEGER`       | `CHAR(1)` | Returns the character at position I in the ASCII collating sequence     |
| `SIN(X)`      | sin(x)     | `REAL`          | `REAL`    | Sine of X (x must be in radians)                                        |
| `SIND(X)`     | sin(x)     | `REAL`          | `REAL`    | Sine of X (x must be in degrees)                                        |
| `COS(X)`      | cos(x)     | `REAL`          | `REAL`    | Cosine of X (x must be in radians)                                      |
| `COSD(X)`     | cos(x)     | `REAL`          | `REAL`    | Cosine of x (x must be in degrees)                                      |
| `TAN(X)`      | tan(x)     | `REAL`          | `REAL`    | Tangent of x (x must be in radians)                                     |
| `TAND(X)`     | tan(x)     | `REAL`          | `REAL`    | Tangent of x (x must be in degrees)                                     |
| `EXP(X)`      | exp(x)     | `REAL`          | `REAL`    | e raised to the xth Power                                               |
| `LOG(X)`      | ln(x)      | `REAL`          | `REAL`    | Natural logarithm of x for r > 0                                        |
| `LOG10(X)`    | log(x)     | `REAL`          | `REAL`    | Base-10 logarithm of X for x > 0                                        |
| `IACHAR(C)`   |            | `CHAR(1)`       | `INTEGER` | Returns the position of the character C in the ASCII collating sequence |
| `MOD(A,B)`    |            | `REAL`/`INTEGER`  |         | Remainder or Modulo Function                                            |
| `MAX(A.B)`    |            | `REAL`/`INTEGER`  |         | Picks the larger of a and b                                             |
| `MIN(A.B)`    |            | `REAL`/`INTEGER`  | \*      | Picks the smaller of a and b                                            |
| `ASIN(X)`     | sin-1(x)   | `REAL`          | `REAL`    | Inverse sine of x for ???1 ??? x ??? 1 (results in radians)                     |
| `ASIND(X)`    | sin-1(x)   | `REAL`          | `REAL`    | Inverse sine of x for ???1 ??? x ??? 1 (results in degrees)                         |
| `ACOS(X)`     | cos-1(x)   | `REAL`          | `REAL`    | Inverse cosine of x for ???1 ??? x ??? 1 (results in radians)                                              |
| `ACOSD(X)`    | cos-1(x)   | `REAL`          | `REAL`    | Inverse cosine of x for ???1 ??? x ??? 1 (results in degrees)                                               |
| `ATAN(X)`     | tan-1(x)   | `REAL`          | `REAL`    | Inverse tangent of x (results in radians in the range ??? ??/2 ??? x ??? ??/2)                   |
| `ATAND(X)`    | tan-1(x)   | `REAL`          | `REAL`    | Inverse tangent of x (results in radians in the range ??? 90 ??? x ??? 90)                   |
| `ATAN2(Y/X)`  | tan-1(y/x) | `REAL`          | `REAL`    | Four quadrant inverse tangent of x (results in radians in the range ????? ??? x ??? ??)   |
| `ATAN2D(Y.X)` | tan-1(y/x) | `REAL`          | `REAL`    | Four quadrant inverse tangent of x (results in radians in the range ???180 ??? x ??? 180)   |

\* = Result is of the same type as the input argument(s)
