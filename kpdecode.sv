// kpdecode.sv
// decodes 4X4 keypad into hex values
// Author: Tom Kuzma
// Date: Jan 23, 2022

module kpdecode (
    input logic [3:0] kpc, kpr,
    output logic [3:0] num,
    output logic kphit
);

	// memory for keypad values
    logic [3:0] matrix [3:0][3:0] = '{'{4'h1,4'h2,4'h3,4'hA},
                                        '{4'h4,4'h5,4'h6,4'hB},
                                        '{4'h7,4'h8,4'h9,4'hC},
                                        '{4'hE,4'h0,4'hF,4'hD}};

	// for concatenating kpr and kpc
	logic [7:0] kp; 

    always_comb begin
		num = 4'bxxxx;
		kp = {kpr, kpc}; // concatenate kpr and kpc

		// decode kp using decode matrix keys
		if (kpr != '1) begin
			case (~kp)
				8'h88 : num = matrix[3][3];
				8'h84 : num = matrix[3][2];
				8'h82 : num = matrix[3][1];
				8'h81 : num = matrix[3][0];
				8'h48 : num = matrix[2][3];
				8'h44 : num = matrix[2][2];
				8'h42 : num = matrix[2][1];
				8'h41 : num = matrix[2][0];
				8'h28 : num = matrix[1][3];
				8'h24 : num = matrix[1][2];
				8'h22 : num = matrix[1][1];
				8'h21 : num = matrix[1][0];
				8'h18 : num = matrix[0][3];
				8'h14 : num = matrix[0][2];
				8'h12 : num = matrix[0][1];
				8'h11 : num = matrix[0][0];

				default: kphit = 'b0;

			endcase

			kphit = 'b1; // set kphit
		end
		else begin
			kphit = 'b0; // clear kphit
		end

    end

endmodule