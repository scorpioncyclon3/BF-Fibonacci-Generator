# BrainF Fibbonacci Generator
### Summary<br>
This project was initially created in two days, following the logic outlined in Daniel B. Cristofani's version. It may be updated in the future with optimisations but may be left in its current state.<br>
Currently, the program is 228 bytes long if all additional comments are removed.<br>
<br>
### The initial comment loop:<br>
This project was inspired by https://brainfuck.org/fib_explained.b<br>
Most of the logic used here comes from Daniel B. Cristofani's implementation, but I tried to create the code itself<br>
<br>
Cell Structure:<br>
Fixed Cell Pattern<br>
0: 0<br>
1: 1<br>
2: \n character<br>
3+: Variable<br>
Variable Cell Pattern<br>
V1: "T" cell (length marker, sum, temp)<br>
V2: "A" (number A)<br>
V3: "B" (number B)<br>
<br>
Changing from 1AB -> 1BC:<br>
Start<br>
1AB<br>
0AB<br>
A0B<br>
CB0<br>
0BC & Carry if C>9<br>
1BC<br>
End<br>
<br>
Carrying digits:<br>
Use repeated switch cases for results 0-9 in C, moving one from V1 to V3 at a time<br>
If there is anything left, C must be greater than 10<br>
Add one digit to the next digit's B (V3)<br>
Reset V3, subtracting 10<br>
Transfer the rest from V1 to V3<br>
Since the maximum addition is 9+9+1 (with a carry), this only needs to be performed once<br>
