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
    logic [3:0] count, next_count;
    logic [11:0] SDI;
    logic [11:0] load;


    always_ff @( negedge clk, negedge reset_n ) begin
        if (~reset_n) begin
            state <= D;
            count = 1;
        end
        else begin
            state <= next_state;
            count <= next_count;
        end
    end

    always_comb begin   
        next_count = count - 1'b1;
        ADC_CONVST = '0;
        // set SDI from chan
        SDI = {1'b1, chan[0], chan[2], chan[1], 1'b1, {7{1'b0}}};
        next_state = state;

        // next state logic
        if (next_count == 0) begin
            case (state)
                A : begin
                   
                    
                                            next_state = B;
                end
                B : begin
                                            next_state = C;
                end 
                C : begin
                                            next_state = D;
                    end
                default: begin
                                            next_state = A;
                end
                D: begin
                    // result = load;          
                    next_state = A;
                end
            endcase

        if (state == A)
            ADC_CONVST = 1'b1;
        else 
            ADC_CONVST = 1'b0;

        // reset count
        if (next_state == C)
            next_count = 12;
        else 
            next_count = 1;
        end
    end

    // // update SDI on SCK neg
    always_ff @(negedge clk) begin
        // send SDI 
        if (next_state == C)// && next_count - 1 >= 0)
            ADC_SDI <= SDI[next_count -1];
        else ADC_SDI <= 1'b0;

        // store ADC_SDO
        if (next_state == C)
            load[next_count - 1] <= ADC_SDO;
            
    end

    always_ff @(state == D) begin
        result = load;
    end

    assign ADC_SCK = (state == C) ? clk : 1'b0;
endmodule