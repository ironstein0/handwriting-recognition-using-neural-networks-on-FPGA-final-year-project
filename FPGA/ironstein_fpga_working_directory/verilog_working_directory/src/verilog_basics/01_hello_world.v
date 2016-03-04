
//Definea module hello_world
module hello_world;
parameter id_num = 0; //define a module identification number = 0

initial //display the module identification number 
	$display("Disp1aying hello_world id number = %d",id_num);
endmodule
//define top_level module

module top;
//change parameter values in the instantiated modules //Use defparam statement
// defparam w1.id_num = 1, w2.id_num = 2;
//instantiate two hello_world modules 
// hello_world w1();
// hello_world w2();
endmodule
