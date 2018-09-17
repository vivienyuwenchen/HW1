module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,    // Single bit output, (~A)*(~B)
  output nAornB,     // Single bit output, (~A)+(~B)
  output AandB,      // Output intermediate combined inputs
  output AorB,
  output AnandB,     // Single bit output, ~(A*B)
  output AnorB       // Single bit output, ~(A+B)
);

  wire nA;
  wire nB;
  wire AandB;
  wire AorB;
  not  Ainv(nA, A);  	// Intermediate, inverter takes signal A as input and produces signal nA
  not  Binv(nB, B);	// Intermediate, inverter takes signal B as input and produces signal nB
  and  andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB
  or   orgate(nAornB, nA, nB);		// OR gate produces nAornB from nA and nB
  and  andgate(AandB, A, B);		// Intermediate, AND gate produces AandB from A and B
  or   orgate(AorB, A, B);		// Intermediate, OR gate produces AorB from A and B
  nand nandgate(AnandB, A, B);		// NAND gate produces AnandB from A and B
  nor  norgate(AnorB, A, B);		// NOR gate produces AnorB from A and B

endmodule
