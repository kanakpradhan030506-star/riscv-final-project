module alu_control(input [1:0] alu_op,input [2:0] func3,input [6:0] func7,output reg [2:0] alu_sel);
always @(*) begin
    case(alu_op)
        2'b00: alu_sel = 3'b000;   // addi, lw, sw
        2'b01: alu_sel = 3'b001;   // beq 
        2'b10: begin               // R-Type
            case(func3)
                3'b000: begin
                    if(func7 == 7'b0100000)
                        alu_sel = 3'b001;// sub
                    else
                        alu_sel = 3'b000;// add
                end
                3'b111: alu_sel = 3'b010;// and
                3'b110: alu_sel = 3'b011;// or
                default: alu_sel = 3'b000;
            endcase
        end

        default: alu_sel = 3'b000;
    endcase
end

endmodule