module alu (a,b,aluc,s,z,le);
   input [31:0] a,b;
   input [3:0] aluc;
   output [31:0] s;
   output        z,le;
   reg [31:0] s;
	wire [31:0] temp;
	wire [31:0] sum;
   reg        z,le;
	
	// hamming distance
	assign temp = a ^ b;
	assign sum = temp[31] + temp[30] + temp[29] + temp[28] + temp[27] + temp[26] +
					temp[25] + temp[24] + temp[23] + temp[22] + temp[21] + temp[20] +
					temp[19] + temp[18] + temp[17] + temp[16] + temp[15] + temp[14] +
					temp[13] + temp[12] + temp[11] + temp[10] + temp[9] + temp[8] +
					temp[7] + temp[6] + temp[5] + temp[4] + temp[3] + temp[2] +
					temp[1] + temp[0];
	
   always @ (a or b or aluc) 
      begin                                   // event
         casex (aluc)
             4'bx000: s = a + b;              //x000 ADD
             4'bx100: s = a - b;              //x100 SUB
             4'bx001: s = a & b;		          //x001 AND
             4'bx101: s = a | b;              //x101 OR
             4'bx010: s = a ^ b;              //x010 XOR
             4'bx110: s = b << 16;            //x110 LUI: imm << 16bit             
             4'b0011: s = b << a;				 //0011 SLL: rd <- (rt << sa)
             4'b0111: s = b >> a;				 //0111 SRL: rd <- (rt >> sa) (logical)
             4'b1111: s = $signed(b) >>> a;   //1111 SRA: rd <- (rt >> sa) (arithmetic)
				 4'b1011: 
					begin
						s = 0;
						if (a <= b) begin
							le = 1;
						end
						else begin
							le = 0;
						end
					end  // TODO: inst ALU logic
             default: s = 0;
         endcase
         if (s == 0 )  z = 1;
            else z = 0;         
      end      
endmodule 