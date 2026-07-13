module alu_control(input [2:0] alu_op,input [2:0] func3,input [6:0] func7,output reg [3:0]alu_sel);
always @(*) begin
    case(alu_op)
        3'b000: begin
            alu_sel = 4'b0000; // ADD (used in lw, sw, addi, jalr, auipc)
        end 
        //BRANCH EXECUTION
        3'b001: alu_sel = 4'b0001; // SUB(used in beq and bne)
        3'b010: begin               // R-Type
            case(func3)
                3'b000: begin
                    if(func7 == 7'b0100000)
                        alu_sel = 4'b0001;// sub
                    else
                        alu_sel = 4'b0000;// add
                end
                3'b001: alu_sel = 4'b0101;//SLL
                3'b010: alu_sel = 4'b1000;//SLT
                3'b011: alu_sel = 4'b1001;//SLTU
                3'b100: alu_sel = 4'b0100;//XOR
                3'b101: 
                begin
            if(func7 == 7'b0100000)
                alu_sel = 4'b0111;//SRA
            else
                alu_sel = 4'b0110;//SRL
                end
                3'b110: alu_sel = 4'b0011;//OR
                3'b111: alu_sel = 4'b0010;//AND
               
                default: alu_sel = 4'B0000;
            endcase
        end
        3'b011: begin //I-Type
            case(func3)
                3'b000: alu_sel = 4'b0000;// ADDI
                3'b010: alu_sel = 4'b1000;// SLTI
                3'b011: alu_sel = 4'b1001;// SLTIU
                3'b100: alu_sel = 4'b0100;// XORI
                3'b110: alu_sel = 4'b0011;// ORI
                3'b111: alu_sel = 4'b0010;// ANDI
                3'b001: alu_sel = 4'b0101;// SLLI
                3'b101:
                    if(func7 == 7'b0100000)
                        alu_sel = 4'b0111; // SRAI
                    else
                        alu_sel = 4'b0110; // SRLI
                default: alu_sel = 4'B0000;
            endcase
        end
        3'b100: begin
            alu_sel = 4'b0000; // ADD ( used for LUI because rs1=x0)
        end
        default: alu_sel = 4'b1010; //LUI operation
    endcase
end
endmodule