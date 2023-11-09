module ksa_8(A,B,Cin,S,Cout);
input [7:0] A,B;
input Cin;
output [7:0] S;
output Cout;
genvar i;
wire [7:0] p,g,cp,cg,ccp,ccg,cccp,cccg,c;

assign p=A^B;
assign g=A&B;

generate
  for (i = 0; i < 8; i = i+1) begin
    if (i == 0) begin
      assign cp[i] = p[i];
    end else begin
      assign cp[i] = p[i] & cp[i-1];
    end
  end
endgenerate

generate
  for (genvar i = 0; i < 8; i = i + 1) begin
    if (i == 0) begin
      assign cg[i] = g[i];
    end else begin
      assign cg[i] = g[i] | (p[i] & cg[i-1]);
    end
  end
endgenerate

generate // Generate CCP block
  for (genvar i = 0; i < 8;  i = i + 1) begin
    if (i == 0) begin
      assign ccp[i] = cp[i];
    end else begin
      assign ccp[i] = cp[i] & ccp[i-1];
    end
  end
endgenerate

generate // Generate CCG block
  for (genvar i = 0; i < 8; i = i + 1) begin
    if (i == 0) begin
      assign ccg[i] = cg[i];
    end else begin
      assign ccg[i] = cg[i] | (cp[i] & ccg[i-1]);
    end
  end
endgenerate

generate // Generate CCCP block
  for (genvar i = 0; i < 8; i = i + 1) begin
    if (i == 0) begin
      assign cccp[i] = ccp[i];
    end else begin
      assign cccp[i] = cccp[i] & cccp[i-1];
    end
  end
endgenerate


generate // Generate CCCG block
  for (genvar i = 0; i < 8; i = i + 1) begin
    if (i == 0) begin
      assign cccg[i] = ccg[i];
    end else begin
      assign cccg[i] = ccg[i] | (ccp[i] & cccg[i-1]);
    end
  end
endgenerate

assign c=cccg;
assign Cout=c[7];
wire [7:0] CP = {c[6:0], Cin};
assign S = p ^ CP;
endmodule
