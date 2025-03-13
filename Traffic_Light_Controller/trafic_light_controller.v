// Program to implement a traffic light controller using Verilog
// it can be used to control the traffic light at a junction of two roads
// it can detect the special vehicle (i.e ambulance, police, fire truck) and give priority to it4

module traffic_light (Clk, Rst, Main_Special, Side_Special, Main_light, Side_light);
  
  input Clk, Rst, Main_Special, Side_Special;
  output reg [2:0] Main_light, Side_light;    // use 3-bit for flexibility to increse more states, but here only requred 2 bits

  parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4, s5 = 3'd5;
  reg [2:0] State;      // 3-bit state for 6 states

  reg [3:0] Counter;      // 4-bit counter like timer

  always @(posedge Clk or posedge Rst) begin
    
    // start state machine
    if (Rst) begin
      State <= s0;     // start at main green
      Counter <= 4'd0;
    end

    else begin
      Counter <= Counter + 1;
      case (State)
        s0: if(Counter == 4'd10) begin 
              State <= s1; 
              Counter <= 4'd0; 
            end

        s1: if(Counter == 4'd5) begin 
              State <= s2; 
              Counter <= 4'd0; 
            end

        s2: if(Counter == 4'd10) begin 
              State <= s3; 
              Counter <= 4'd0; 
            end

        s3: if(Counter == 4'd5) begin 
              State <= s0; 
              Counter <= 4'd0; 
            end
        
      // special vehicle 
        s4: if(!Side_Special) begin 
              State <= s3; 
              Counter <= 4'd0; 
            end
        
        s5: if(!Main_Special) begin 
              State <= s1; 
              Counter <= 4'd0; 
            end
      endcase
    end

    // detection of special vechile
    if (Side_Special) State <= s4;
    else if (Main_Special) State <= s5;
  end

  // output logic
  // Main_light = 001 -> Green, 010 -> Yellow, 100 -> Red
  // Side_light = 001 -> Green, 010 -> Yellow, 100 -> Red
  
  always @(*) begin
    case(State)
      s0: begin
          Main_light <= 3'b001;
          Side_light <= 3'b100;
        end

      s1: begin
            Main_light <= 3'b010;
            Side_light <= 3'b100;
          end
      s2: begin
            Main_light <= 3'b100;
            Side_light <= 3'b001;
          end
      
      s3: begin
            Main_light <= 3'b100;
            Side_light <= 3'b010;
          end

      // special vehicle
      s4: begin
            Main_light <= 3'b100;
            Side_light <= 3'b001;
          end
      
      s5: begin
            Main_light <= 3'b001;
            Side_light <= 3'b100;
          end
    endcase
  end

endmodule