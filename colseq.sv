// colseq.sv
// Simple 4 state FSM 
// Author: Tom Kuzma
// Date: Jan 20, 2022

module colseq (
    input logic clk,
    input logic reset_n,
    input logic [3:0] kpr,
    output logic [3:0] kpc);

    // define state variable and values
    typedef enum logic [3:0] {A = 4'b0111, B = 4'b1011, C = 4'b1101, D = 4'b1110} State;

    // declare 2 State variables
    State current, next;

    // synchronous ff state change
    always_ff @(posedge clk, negedge reset_n) begin
        if (~reset_n) 
				current <= A;
        else 
				current <= next;
    end

    // Combinational logic sets next state
    always_comb begin
        if (kpr != '1)
            next = current; // keep state the same if button hit detected
        else
            // state sequence
            case (current)
                A : next = B;
                B : next = C;
                C : next = D;
                D : next = A;
                default: next = A;
            endcase
    end 
        // set output logic to current state
        assign kpc = current;
endmodule