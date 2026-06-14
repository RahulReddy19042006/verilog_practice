//A negative edge sensitive JK flipflop
primitive JKFF(q,j,k,clk,clr);
output q;
reg q;
input j,k,clk,clr;
table
//j k clk  clr  : q : qnew
  ? ?  ?    1   : ? : 0; //clear
  ? ?  ?   (10) : ? : -; //ignore negedge of clr
  0 0 (10)  0   : ? : -; //no change
  0 1 (10)  0   : ? : 0; //reset
  1 0 (10)  0   : ? : 1; //set
  1 1 (10)  0   : 0 : 1; //toggle
  1 1 (10)  0   : 1 : 0; //toggle
  ? ? (01)  0   : ? : -; //ignore posedge of clk
  endtable
  endprimitive


