`timescale 1 ns / 1 ps

module mouse_to40 (
    input  logic [11:0] xpos_in,
    input  logic [11:0] ypos_in,
    input  logic clk,
    input  logic rst,
    input  logic left,
    input  logic right,
    output  logic mouse_left,
    output  logic mouse_right,
    output logic [11:0] xpos_out,
    output logic [11:0] ypos_out
);

always_ff @(posedge clk) begin 
    if (rst) begin
        xpos_out <= '0;
        ypos_out <= '0;
        mouse_left <= '0;
        mouse_right <= '0;
    end else begin 
        xpos_out <= xpos_in;
        ypos_out <= ypos_in;
        mouse_left <= left;
        mouse_right <= right;
    end
end
endmodule