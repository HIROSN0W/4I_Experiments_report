`timescale 1ns / 1ps

module test_top;
    reg CLK, RESET;
    reg STARTBTN;
    reg [9:0] NUM;
    wire [3:0] HBITS;

    top uut(
        .CLK(CLK), 
        .RESET(RESET),
        .STARTBTN(STARTBTN),
        .NUM(NUM), 
        .HBITS(HBITS)
    );

    initial forever #5 CLK = ~CLK; // 100MHz

    initial begin
        // 初期化
        CLK = 0; RESET = 1; STARTBTN = 0; NUM = 0;
        #100;
        RESET = 0;
        #50;

        // --- 1回目: 0x00A (2bit) ---
        NUM = 10'h00A;
        #50;
        STARTBTN = 1; #20; STARTBTN = 0; // ボタン・プッシュ
        #200; // 計算完了と点灯待ち

        // --- 2回目: 0x3FE (9bit) ---
        // スイッチを変えても、ボタンを押すまでは前のLEDのまま
        NUM = 10'h3FE;
        #100; 
        
        // ボタンを押して再計算
        STARTBTN = 1; #20; STARTBTN = 0;
        #200;

        $finish;
    end
endmodule