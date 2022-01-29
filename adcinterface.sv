// adcinterface.sv
// FSM for communicating with 
// author: Tom Kuzma
// Date: Jan 27, 2022
// testing

module adcinterface (
    input logic clk, reset_n,   // clock and reset
    input logic [2:0] chan,     // ADC Channel to sample
    output logic [11:0] result, // ADC result

    // ltc2308 signals
    output logic ADC_CONVST, ADC_SCK, ADC_SDI,
    input logic ADC_SDO
);

    enum logic [1:0] {A, B, C, D} state, next_state;
    logic start;
    logic [3:0] count, next_count;
    logic SDI [11:0];
    logic [11:0] load;


    always_ff @( posedge clk, negedge reset_n ) begin
        if (~reset_n) begin
            state <= A;
            count = 1;
        end
        else begin
            state <= next_state;
            count <= next_count;
        end
    end

    always_comb begin   
        next_count = count - 1;
        // set SDI from chan
        SDI = {1'b1, chan[0], chan[2], chan[1], 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
        next_state = state;
        // next state logic
        if (next_count == 0) begin
            case (state)
                A : begin
                    ADC_CONVST = 1'b1;
                    start = 1'b1;
                                            next_state = B;
                end
                B : begin
                    if (start)              next_state = C;
                    else begin
                                            next_state = A;
                        result = load;
                    end 
                
                    ADC_CONVST = 1'b0;
                end 
                C : begin
                    start = 1'b0;
                                            next_state = B;
                    end
                default: begin
                    start = 1'b0;
                                            next_state = A;
                end
            endcase
        

        // reset count
        if (next_state == A || next_state == B)
            next_count = 1;
        else 
            next_count = 12;
        end
    end

    // update SDI on SCK neg
    always_ff @(negedge clk) begin
        if (next_state == C && next_count - 1 >= 0)
            ADC_SDI <= SDI[next_count- 1];

        if (state == C)
            load[count - 1] <= ADC_SDO;
            
    end

    assign ADC_SCK = (state == C) ? clk : 1'b0;
endmodule