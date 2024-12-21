module RotateByNBits (
  input [31:0] input,
  input [4:0] n,
  output reg [31:0] output
);

  always @(*)
    output = {input[n-1:0], input[31:n]};

endmodule
