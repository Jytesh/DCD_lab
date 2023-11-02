module UniversalShiftRegister_tb;

  reg clk;
  reg reset;
  reg shift_right;
  reg shift_in;
  reg [15:0] data_in;
  wire [15:0] data_out;

  integer i;

  // Instantiate the UniversalShiftRegister module
  UniversalShiftRegister uut (
    .clk(clk),
    .reset(reset),
    .shift_right(shift_right),
    .shift_in(shift_in),
    .data_in(data_in),
    .data_out(data_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Test case generation
  initial begin
    clk = 0;
    reset = 0;
    shift_right = 1;
    shift_in = 0;
    data_in = 16'hFFFF; // Test input data

    // Perform right shifts
    $display("Testing right shifts with serial input:");
    for (i = 0; i < 16; i = i + 1) begin
      shift_in = 1;
      #10;
      shift_in = 0;
      #10;
      $display("Shift #%d: data_out = %h", i, data_out);
    end

    // Reset and change shift direction
    reset = 1;
    shift_right = 0;
    shift_in = 0;
    #10;
    reset = 0;

    // Perform left shifts
    $display("Testing left shifts without serial input:");
    for (i = 0; i < 16; i = i + 1) begin
      #10;
      $display("Shift #%d: data_out = %h", i, data_out);
    end

    $stop;
  end

endmodule