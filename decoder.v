// Decoder circuit

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    wire add0inv, add1inv;
    wire is0, is1, is2, is3E;
    wire is0E, is1E, is2E, is3;
    wire out01, out23;

    `NOT not0(add0inv, address0);
    `NOT not1(add1inv, address1);

    `AND and0(is0, add0inv, add1inv);
    `AND and1(is1, address0, add1inv);
    `AND and2(is2, add0inv, address1);
    `AND and3(is3, address0, address1);

    `AND and0sig(out0, is0, enable);
    `AND and1sig(out1, is1, enable);
    `AND and2sig(out2, is2, enable);
    `AND and3sig(out3, is3, enable);
    
endmodule

