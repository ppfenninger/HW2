// Multiplexer circuit

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);

    wire add0inv, add1inv;
    wire is0, is1, is2, is3;
    wire out0, out1, out2, out3;
    wire out01, out23;

    `NOT not0(add0inv, address0);
    `NOT not1(add1inv, address1);

    `AND and0(is0, add0inv, add1inv);
    `AND and1(is1, address0, add1inv);
    `AND and2(is2, add0inv, address1);
    `AND and3(is3, address0, address1);

    `AND and0sig(out0, is0, in0);
    `AND and1sig(out1, is1, in1);
    `AND and2sig(out2, is2, in2);
    `AND and3sig(out3, is3, in3);

    `OR or01(out01, out0, out1);
    `OR or23(out23, out2, out3);

    `OR orOut(out, out01, out23);
    
endmodule

