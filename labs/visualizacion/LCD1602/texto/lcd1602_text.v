module LCD1602_controller #(parameter num_commands = 4, num_data_all = 32,  num_data_perline = 16, COUNT_MAX = 800000)(
    input clk,            
    input reset,          
    input ready_i,
    output reg rs,        
    output reg rw,
    output enable,    
    output reg [7:0] data
);

// Definir los estados del controlador
localparam IDLE = 3'b000;
localparam CMD1 = 3'b001;
localparam DATA_1L = 3'b010;
localparam CMD2 = 3'b011;
localparam DATA_2L = 3'b100;

reg [2:0] fsm_state;
reg [2:0] next;
reg clk_16ms;
reg [$clog2(COUNT_MAX)-1:0] counter;

// Comandos de configuración
localparam CLEAR_DISPLAY = 8'h01;
localparam SHIFT_CURSOR_RIGHT = 8'h06;
localparam DISPON_CURSOROFF = 8'h0C;
localparam DISPON_CURSORBLINK = 8'h0E;
localparam LINES2_MATRIX5x8_MODE8bit = 8'h38;
localparam LINES2_MATRIX5x8_MODE4bit = 8'h28;
localparam LINES1_MATRIX5x8_MODE8bit = 8'h30;
localparam LINES1_MATRIX5x8_MODE4bit = 8'h20;
localparam START_2LINE = 8'hC0;


// Definir un contador para controlar el envío de comandos
reg [$clog2(num_commands):0] command_counter;
// Definir un contador para controlar el envío de datos
reg [$clog2(num_data_perline):0] data_counter;

// Banco de registros
reg [7:0] data_memory [0: num_data_all-1];
reg [7:0] config_memory [0:num_commands-1]; 

integer i;

initial begin
    fsm_state <= IDLE;
    command_counter <= 'b0;
    data_counter <= 'b0;
    rs <= 'b0;
    rw <= 0;
    data <= 'b0;
    clk_16ms <= 0;
    counter <= 0;
    $readmemh("path_to_data.txt", data_memory);    
	config_memory[0] <= LINES2_MATRIX5x8_MODE8bit;
	config_memory[1] <= SHIFT_CURSOR_RIGHT;
	config_memory[2] <= DISPON_CURSOROFF;
	config_memory[3] <= CLEAR_DISPLAY;
end

always @(posedge clk) begin
    if (counter == COUNT_MAX-1) begin
        clk_16ms <= ~clk_16ms;
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end


always @(posedge clk_16ms)begin
    if(reset == 0)begin
        fsm_state <= IDLE;
    end else begin
        fsm_state <= next;
    end
end

always @(*) begin
    case(fsm_state)
        IDLE: begin
            next <= (ready_i)? CMD1 : IDLE;
        end
        CMD1: begin 
            next <= (command_counter == num_commands)? DATA_1L : CMD1;
        end
        DATA_1L:begin
            if (data_counter == num_data_perline) begin
				if (config_memory[0] == LINES2_MATRIX5x8_MODE8bit) begin
				    next <= CMD2;
				end else begin
					next <= IDLE;
				end
            end else next = DATA_1L;
        end
        CMD2: begin 
            next <= DATA_2L;
        end
		DATA_2L: begin
			next <= (data_counter == num_data_perline)? IDLE : DATA_2L;
		end
        default: next = IDLE;
    endcase
end

// Asignar el estado inicial
always @(posedge clk_16ms) begin
    if (reset == 0) begin
        command_counter <= 'b0;
        data_counter <= 'b0;
		data <= 'b0;
        $readmemh("path_to_data.txt", data_memory);
    end else begin
        case (next)
            IDLE: begin
                command_counter <= 'b0;
                data_counter <= 'b0;
                data <= 'b0;
                rs <= 'b0;
            end
            CMD1: begin
                command_counter <= command_counter + 1;
				rs <= 0; 
			    data <= config_memory[command_counter];
            end
            DATA_1L: begin
                data_counter <= data_counter + 1;
                rs <= 1; 
				data <= data_memory[data_counter];
            end
            CMD2: begin
                data_counter <= 'b0;
				rs <= 0; data <= START_2LINE;
            end
			DATA_2L: begin
                data_counter <= data_counter + 1;
                rs <= 1; 
				data <= data_memory[num_data_perline + data_counter];
            end
        endcase
    end
end

assign enable = clk_16ms;

endmodule
