[
   This project was inspired by https://brainfuck.org/fib_explained.b
   Most of the logic used here comes from Daniel B. Cristofani's implementation, but I tried to create the code itself
   
   Cell Structure:
   Fixed Cell Pattern
   0: 0
   1: \n character
   2+: Variable
   Variable Cell Pattern
   V1: "T" cell (length marker, sum, temp)
   V2: "A" (number A)
   V3: "B" (number B)
   
   Changing from 1AB -> 1BC:
   Start
   A1B
   A0B
   0AB
   BC0
   B0C & Carry if C>9
   B1C
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
++[>+++++<-]>
>++++++++++ 1: 10 (\n)
>+>+ 2&3: 1

[ main loop
   entry point: V2 (cell 3)
   [ output loop
      V2 currently 1
      +++++ V2: 6
      [>++++++++<-]>. V3 add 48 (convert int to ASCII)
      <++++++ V2: 5
      [>--------<-] V3 sub 48 (convert ASCII to int)
      + V2: 1
      <<< goto previous V2
   ] end output loop
   exit at cell 0
   >.. print 1 (\n)
   
   >> goto first V2 (cell 3)
   [ calculation loop
      currently at V2
      check algorithm in entry comment
      
      A1B
      A0B
      [-] reset V2
      0AB
      <[>+<-] copy V1 to V2 exit at V1
      BC0
      >>[<+<+>>-] add V3 to V1 & V2 exit at V3
      B0C & Carry
      transfer V2 to V3
      < goto V2
         if V2 != 0
         [>+<-
         if V2 != 1
         [>+<-
         if V2 != 2
         [>+<-
         if V2 != 3
         [>+<-
         if V2 != 4
         [>+<-
         if V2 != 5
         [>+<-
         if V2 != 6
         [>+<-
         if V2 != 7
         [>+<-
         if V2 != 8
         [>+<-
         if V2 != 9
         [ carry
         must be greater than 9 so carry a digit
         decrement by 1 (10 total)
         -
         empty V3
         >[-]
         increment next V1 (carry digit)
         >+
         increment next V2
         >+
         <<< return to current V2
         [>+<-] move remainder of V2 to V3 exit at V2
         ] end carry
         ]]]]]]]]] exit at V2
      B1C
      + set V2 to 1
      >>> goto next V2
   ] end calculation loop
   exit 3 past final V2

   <<< goto last V2
] end main loop
