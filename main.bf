[
   This project was inspired by https://brainfuck.org/fib_explained.b
   Most of the logic used here comes from Daniel B Cristofani's implementation, but I tried to create the code itself
   
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
]

setup
>+ 1: 1
>++++++++++ 2: 10 (\n)
>+>+ 3&4: 1
<<< goto 1

[ main loop
   output each digit of the new number from the end to the start
   >> goto 3

   goto the end of the list
   [
      >>>
   ]

   <<< goto final V1
   [ output loop
      V1 currently 1
      ++++ V1: 5
      [>>++++++++++<<-]>>--. V3 add 48 (convert int to ASCII)
      ++ V3 add 2 to avoid underflow
      <<+++++ V1: 5
      [>>----------<<-] V3 sub 50 (convert ASCII to int)
      + V1: 1
      <<< goto previous V1
   ] end output loop
   exit at cell 0
   >>.. print 2 (\n)
   
   > goto first V1 (cell 3)
   [ calculation loop
      currently at V1
      check algorithm in entry comment
      1AB
      0AB
      [-] reset V1
      A0B
      >[<+>-] copy V2 to V1 exit at V2
      CB0
      >[<+<+>>-] add V3 to V1 & V2 exit at V3
      0BC & Carry
      << goto V1
         if V1 != 0
         [>>+<<-
         if V1 != 1
         [>>+<<-
         if V1 != 2
         [>>+<<-
         if V1 != 3
         [>>+<<-
         if V1 != 4
         [>>+<<-
         if V1 != 5
         [>>+<<-
         if V1 != 6
         [>>+<<-
         if V1 != 7
         [>>+<<-
         if V1 != 8
         [>>+<<-
         if V1 != 9
         [ carry
         must be greater than 9 so carry a digit
         decrement by 1 (10 total)
         -
         empty V3
         >>[-]
         increment next V1
         >+
         increment next V2 (carry digit)
         >+
         <<<< return to current V1
         [>>+<<-] move remainder of V1 to V3 exit at V1
         ] end carry
         ]]]]]]]]] exit at V1
      1BC
      + set V1 to 1
      >>> goto next V1
   ] end calculation loop
   exit 3 past final V1

   <<< return to first V1
   return to cell 0
   [
      <<<
   ]
   > goto 1
] end main loop
