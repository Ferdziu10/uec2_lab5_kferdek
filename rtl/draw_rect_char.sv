`timescale 1 ns / 1 ps

module draw_rect_char (
    vga_if.in vii, 
    vga_if.out vio,
    input  logic clk,
    input  logic rst, 
    input  logic [7:0] char_pixels,
    output logic [10:0] addr

    );
    import vga_pkg::*;
 /* Local variables and signals
 */

 vga_if vga_nxt ();
 logic [10:0] addr_nxt;

always_ff @(posedge clk) begin 
    if (rst) begin
        vio.vcount <= '0;
        vio.vsync  <= '0;
        vio.vblnk  <= '0;
        vio.hcount <= '0;
        vio.hsync  <= '0;
        vio.hblnk  <= '0;
        vio.rgb    <= '0;
        addr <= '0;

    end else begin
        vio.vcount <= vii.vcount;
        vio.vsync  <= vii.vsync;
        vio.vblnk  <= vii.vblnk;
        vio.hcount <= vii.hcount;
        vio.hsync  <= vii.hsync;
        vio.hblnk  <= vii.hblnk;
        vio.rgb    <= vga_nxt.rgb;
        addr <= addr_nxt;
    end
end


always_comb begin
    addr_nxt = { vii.hcount [9:3], vii.vcount [0:3]};
    if (char_pixels)
        vga_nxt.rgb = 12'hf_0_0;

/*
    else if ( vcount_in >= X_RCTSTR && vcount_in <= X_RCTSTR + WID_RCT && hcount_in == Y_RCTSTR + HGH_RCT )
        rgb_nxt = COL_RCT;
    else if ( hcount_in >= Y_RCTSTR && hcount_in <= Y_RCTSTR + HGH_RCT && vcount_in == X_RCTSTR + WID_RCT )
        rgb_nxt = COL_RCT;
    else if ( hcount_in >= Y_RCTSTR && hcount_in <= Y_RCTSTR + HGH_RCT && vcount_in == X_RCTSTR )
        rgb_nxt = COL_RCT;
*/
    else begin 
    vga_nxt.rgb = vii.rgb;
    end
end
endmodule