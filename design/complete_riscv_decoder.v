module complete_riscv_decoder(input [31:0] instruction , output reg [6:0] opcode , output reg [4:0] destination_reg , output reg [2:0] func3 , output reg [4:0] source_reg_1 , output reg [ 4:0] source_reg_2 , output reg [6:0] func7 , output reg [31:0] immediate );
  always @(*)
    begin
      opcode = instruction [6:0];
      destination_reg = 0;
      func3 =0;
      source_reg_1 =0;
      source_reg_2 =0;
      func7 =0;
      immediate =0;
      case(opcode)
7'b0110011:
      begin // R TYPE
destination_reg = instruction[11:7];
func3 = instruction[14:12];
source_reg_1 = instruction[19:15];
source_reg_2 = instruction[24:20];
func7 = instruction[31:25];
end
 7'b0010011:
     begin //I TYPE
destination_reg = instruction[11:7];
func3 = instruction[14:12];
source_reg_1 = instruction[19:15];
immediate = {{20{instruction[31]}}, instruction[31:20]};
     end
7'b0100011:
      begin //S TYPE
func3 = instruction[14:12];
source_reg_1 = instruction[19:15];
source_reg_2 = instruction[24:20];
immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
      end
7'b1100011:
      begin//B TYPE
func3 = instruction[14:12];
source_reg_1 = instruction[19:15];
source_reg_2 = instruction[24:20];
immediate = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};  
      end
 default:
   begin
     destination_reg=0;
     func3=0;
     source_reg_1=0;
     source_reg_2=0;
     func7=0;
     immediate=0;
   end
      endcase
    end
endmodule
                           