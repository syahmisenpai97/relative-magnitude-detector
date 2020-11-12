 module part2ex2(input [1:0] A,B, output A_less_B, A_equal_B, A_greater_B);  
 wire tmp1,tmp2,tmp3,tmp4,tmp5, tmp6, tmp7, tmp8;  
 // A = B output   
 xnor u1(tmp1,A[1],B[1]);  
 xnor u2(tmp2,A[0],B[0]);  
 and u3(A_equal_B,tmp1,tmp2);  
 // A less than B output   
 assign tmp3 = (~A[0])& (~A[1])& B[0];  
 assign tmp4 = (~A[1])& B[1];  
 assign tmp5 = (~A[0])& B[1]& B[0];  
 assign A_less_B = tmp3 | tmp4 | tmp5;  
 // A greater than B output   
 assign tmp6 = (~B[0])& (~B[1])& A[0];  
 assign tmp7 = (~B[1])& A[1];  
 assign tmp8 = (~B[0])& A[1]& A[0];  
 assign A_greater_B = tmp6 | tmp7 | tmp8;  
 endmodule   
 `timescale     10 ps/ 10 ps  
 // FPGA projects using Verilog/ VHDL  
 // fpga4student.com  
 // Verilog testbench code for 2-bit comparator   
 module tb_comparator;  
 reg [1:0] A, B;  
 wire A_less_B, A_equal_B, A_greater_B;  
 integer i;  
 // device under test  
 comparator dut(A,B,A_less_B, A_equal_B, A_greater_B);  
 initial begin  
      for (i=0;i<4;i=i+1)  
      begin   
           A = i;  
           B = i + 1;  
           #20;  
      end   
      for (i=0;i<4;i=i+1)  
      begin   
           A = i;  
           B = i;  
           #20;  
      end   
      for (i=0;i<4;i=i+1)  
      begin   
           A = i+1;  
           B = i;  
           #20;  
      end   
 end   
 endmodule   