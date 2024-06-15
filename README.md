This project was initially created in two days, following the logic outlined in Daniel B. Cristofani's version. It may be updated in the future with optimisations but may be left in its current state. 
Currently, the program is 228 bytes long without any additional comments. 

The initial comment loop: 
  This project was inspired by https://brainfuck.org/fib_explained.b
  Most of the logic used here comes from Daniel B. Cristofani's implementation, but I tried to create the code itself
  
  Cell Structure:
  Fixed Cell Pattern
  0: 0
  1: 1
  2: \n character
  3+: Variable
  Variable Cell Pattern
  V1: "T" cell (length marker, sum, temp)
  V2: "A" (number A)
  V3: "B" (number B)
  
  Changing from 1AB -> 1BC:
  Start
  1AB
  0AB
  A0B
  CB0
  0BC & Carry if C>9
  1BC
  End
  
  Carrying digits:
  Use repeated switch cases for results 0-9 in C, moving one from V1 to V3 at a time
  If there is anything left, C must be greater than 10
  Add one digit to the next digit's B (V3)
  Reset V3, subtracting 10
  Transfer the rest from V1 to V3
  Since the maximum addition is 9+9+1 (with a carry), this only needs to be performed once
