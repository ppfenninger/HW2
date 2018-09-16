// Adder circuit

`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    wire andab, andbIn, andaIn;
    wire orab, orbIn;
    wire orOut;

    `AND andAB(andab, a, b);
    `AND andBIN(andbIn, b, carryin);
    `AND andAIN(andaIn, a, carryin);

    `OR or1(orOut, andab, andbIn);
    `OR or2(carryout, orOut, andaIn);


    `XOR xor1(orab, a, b);
    `XOR xor2(sum, orab, carryin); 
endmodule
