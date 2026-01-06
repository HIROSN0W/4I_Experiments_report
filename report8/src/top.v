module top(
    input CLK, RESET,
    input STARTBTN,       // ボタン入力
    input [9:0] NUM,
    output [3:0] HBITS    // LED出力
);

    // 制御信号
    reg ap_start = 1'b0;
    wire ap_done;
    wire ap_idle;
    wire ap_ready;

    // HLS IPからの出力を受け取るための内部ワイヤ
    wire [3:0] hbits_out_wire;
    
    // LEDの点灯状態を保持するためのレジスタ
    reg [3:0] led_reg;

    // レジスタの値を実際のLED出力ピンに接続
    assign HBITS = led_reg;

    // HLS IPコア (bitcount_0) のインスタンス化
    bitcount_0 uut(
        .hbits_ap_vld(),        // 使わない
        .ap_clk(CLK),
        .ap_rst(RESET),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .num(NUM),
        .hbits(hbits_out_wire)  // ここをワイヤ接続に変更
    );

    // 制御ロジック
    always @(posedge CLK) begin
        if (RESET == 1'b1) begin
            ap_start <= 1'b0;
            led_reg <= 4'd0;    // リセット時は消灯
        end else begin
            // --- 待機状態 (アイドル) ---
            if (ap_idle == 1'b1) begin
                // ボタンが押されたら再計算スタート
                if (STARTBTN == 1'b1) begin
                   ap_start <= 1'b1;
                   led_reg <= 4'd0; // ★再計算開始の合図としてLEDを一旦消す（任意）
                end
            end 
            
            // --- 計算完了時の処理 ---
            // 計算が終わった瞬間 (ap_doneがH) に結果を保存
            if (ap_done == 1'b1) begin
                ap_start <= 1'b0;         // Startを下げる
                led_reg <= hbits_out_wire; // ★IPの結果をレジスタに焼き付ける（保持）
            end
        end
    end

endmodule