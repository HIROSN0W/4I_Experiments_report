`timescale 1ns / 1ps

// 参照: 資料 P.12, P.13 [cite: 194-230]
module Display_7seg(
    input CLK,              // W5: 100MHz
    input RESET,            // BTNC
    input [3:0] D3,         // SW15-12 (3桁目)
    input [3:0] D2,         // SW11-8  (2桁目)
    input [3:0] D1,         // SW7-4   (1桁目)
    input [3:0] D0,         // SW3-0   (0桁目)
    output [6:0] SEG_OUT,   // CA-CG (Active Low)
    output [3:0] ANODE      // AN3-AN0 (Active Low)
);

    // --- パラメータ設定 ---
    // 実機動作時は 10ms (1,000,000カウント)
    // シミュレーション時は短縮可能
    parameter division_ratio = 32'd100_000; 

    // --- 内部信号 ---
    reg [31:0] count;       // カウンタ
    wire carry;             // キャリー信号
    reg [3:0] place;        // 表示桁選択 (One-hot like logic for Anode)
    wire [3:0] disp_val;    // その桁に表示する4bit値

    // --- 分周回路 (P.13) ---
    always @(posedge CLK or posedge RESET) begin
        if (RESET == 1'b1) begin
            count <= 32'd0;
        end else if (carry == 1'b1) begin
            count <= 32'd0;
        end else begin
            count <= count + 1'b1;
        end
    end

    // キャリー生成
    assign carry = (count == division_ratio) ? 1'b1 : 1'b0;

    // --- 表示桁の更新 (P.14) ---
    // キャリーごとにアノードを左回転シフト (Active Lowなので0が移動)
    always @(posedge CLK or posedge RESET) begin
        if (RESET == 1'b1) begin
            place <= 4'b1110; // 初期値: 0桁目のみ点灯
        end else if (carry == 1'b1) begin
            // {place[2:0], place[3]} は左回転シフト
            // 1110 -> 1101 -> 1011 -> 0111 -> 1110
            place <= {place[2:0], place[3]};
        end
    end

    assign ANODE = place;

    // --- 表示値の選択 (P.16) ---
    // 現在アクティブ(Low)になっているアノードに対応する入力データを選択
    function [3:0] seg_value;
        input [3:0] pl;
        input [3:0] d3, d2, d1, d0;
        begin
            case (pl)
                4'b1110: seg_value = d0; // 0桁目
                4'b1101: seg_value = d1; // 1桁目
                4'b1011: seg_value = d2; // 2桁目
                4'b0111: seg_value = d3; // 3桁目
                default: seg_value = 4'b0000;
            endcase
        end
    endfunction

    assign disp_val = seg_value(place, D3, D2, D1, D0);

    // --- セグメントデコーダ (P.15) ---
    // 出力は gfedcba の並び (Active Low)
    function [6:0] seg_dec;
        input [3:0] val;
        begin
            case (val)
                4'h0: seg_dec = 7'b1000000; // 0 (g OFF)
                4'h1: seg_dec = 7'b1111001; // 1
                4'h2: seg_dec = 7'b0100100; // 2
                4'h3: seg_dec = 7'b0110000; // 3
                4'h4: seg_dec = 7'b0011001; // 4
                4'h5: seg_dec = 7'b0010010; // 5
                4'h6: seg_dec = 7'b0000010; // 6
                4'h7: seg_dec = 7'b1011000; // 7 (または 7'b1111000)
                4'h8: seg_dec = 7'b0000000; // 8
                4'h9: seg_dec = 7'b0010000; // 9
                
                // 課題(P.17 3-②): 10以上でエラー "E" を表示
                // "E" = a,d,e,f,g ON (b,c OFF) -> 0000110
                default: seg_dec = 7'b0000110; 
            endcase
        end
    endfunction

    assign SEG_OUT = seg_dec(disp_val);

endmodule