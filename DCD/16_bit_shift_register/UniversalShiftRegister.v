module UniversalShiftRegister (
  input wire clk,
  input wire reset,
  input wire shift_right,
  input wire shift_in,
  input wire [15:0] data_in,
  output wire [15:0] data_out
);

  reg [15:0] shift_reg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      shift_reg <= 16'b0;
    end else begin
      if (shift_right) begin
        if (shift_in) begin
          shift_reg <= {data_in[0], shift_reg[15:1]};
        end else begin
          shift_reg <= shift_reg >> 1;
        end
      end else begin
        if (shift_in) begin
          shift_reg <= {shift_reg[14:0], data_in};
        end else begin
          shift_reg <= shift_reg << 1;
        end
      end
    end
  end

  assign data_out = shift_reg;

endmodule