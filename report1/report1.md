# FPGA実験１

## 目的

### 演習１ 
> 半加算器２個を用いて、全加算器を構成しなさい。  
> 
![alt text](image-2.png)

### 演習２
> 全加算器をVerilog HDLで記述しなさい。

```Verilog HDL
    wire S1, C1, C2;
    
    assign S1 = A ^ B;
    assign C1 = A & B;
    assign C2 = C_I & S1;
    assign S = C_I ^ S1;
    assign C_O = C1|C2;
```

### 演習３
> RTL解析を行いなさい。
> 
![alt text](image.png)

### 演習４
> テストベンチを作成しなさい。
```Verilog HDL
`timescale 1ns / 1ps

module test_fulladd;
    reg A ,B, C_I;
    wire S, C_O;
    
    fulladd uut(.A(A),.B(B),.C_I(C_I),.S(S),.C_O(C_O));
    
initial begin
        A=1'b0; B=1'b0; C_I=1'b0;
      #100;
        A=1'b1; B=1'b0; C_I=1'b0;#20;
        A=1'b1; B=1'b1; C_I=1'b0;#20;
        A=1'b0; B=1'b1; C_I=1'b1;#20;
        A=1'b1; B=1'b1; C_I=1'b1;#20;
        A=1'b1; B=1'b0; C_I=1'b1;#20;
        A=1'b0; B=1'b0; C_I=1'b1;#20;
        A=1'b1; B=1'b1; C_I=1'b0;#20;
        A=1'b0; B=1'b1; C_I=1'b0;#20;
        A=1'b0; B=1'b0; C_I=1'b0;#20;
    $stop;
end;
endmodule
```

### 演習５
> ビヘイビアシミュレーションを行いなさい。
> 
![alt text](image-1.png)

### 演習６
> ビヘイビアシミュレーションの結果から動作を確かめよ。  
>
| 入力 A | 入力 B | 入力 Ci | 出力 Co (仕様) | 出力 Co (動作) | 出力 S (仕様) | 出力 S (動作) | 合否 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 0 | 0 | 0 | 0| 0| 0| 0| 〇|
| 0 | 0 | 1 | 0| 0| 1| 1| 〇|
| 0 | 1 | 0 | 0| 0| 1| 1| 〇|
| 0 | 1 | 1 | 1| 1| 0| 0| 〇|
| 1 | 0 | 0 | 0| 0| 1| 1| 〇|
| 1 | 0 | 1 | 1| 1| 0| 0| 〇|
| 1 | 1 | 0 | 1| 1| 0| 0| 〇|
| 1 | 1 | 1 | 1| 1| 1| 1| 〇|

### 演習７
> 入出力端子を割り当てなさい。

割り当てました。

### 演習８
![alt text](image-3.png)