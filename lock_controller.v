module lock_controller (
    input        clk,
    input        rst,
    input  [3:0]  digit_in,
    output reg    unlocked_led
);

    // Стани контролера
    localparam LOCKED   = 2'b00;
    localparam WAIT_D2  = 2'b01;
    localparam WAIT_D3  = 2'b10;
    localparam UNLOCKED = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;

    // Код замка: 5 -> 3 -> 7
    localparam [3:0] CODE_1 = 4'd5;
    localparam [3:0] CODE_2 = 4'd3;
    localparam [3:0] CODE_3 = 4'd7;

    // 1. Регістр стану
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= LOCKED;
        else
            state <= next_state;
    end

    // 2. Логіка переходів
    always @(*) begin
        case (state)

            LOCKED: begin
                if (digit_in == CODE_1)
                    next_state = WAIT_D2;
                else
                    next_state = LOCKED;
            end

            WAIT_D2: begin
                if (digit_in == CODE_2)
                    next_state = WAIT_D3;
                else
                    next_state = LOCKED;
            end

            WAIT_D3: begin
                if (digit_in == CODE_3)
                    next_state = UNLOCKED;
                else
                    next_state = LOCKED;
            end

            UNLOCKED: begin
                next_state = UNLOCKED;
            end

            default: begin
                next_state = LOCKED;
            end

        endcase
    end

    // 3. Логіка виходу
    always @(*) begin
        if (state == UNLOCKED)
            unlocked_led = 1'b1;
        else
            unlocked_led = 1'b0;
    end

endmodule