`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;					// Primary test inputs
  wire nA, nB, nAandnB, nAornB, AandB, AorB, AnandB, AnorB;	// Test outputs

  demorgan dut(A, B, nA, nB, nAandnB, nAornB, AandB, AorB, AnandB, AnorB);  // Module to be tested


  // Run sequence of test stimuli
  initial begin
    $display("DeMorgan's Law: ~A~B = ~(A+B)");
    $display("A B | ~A ~B | ~A~B ");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);

    $display("A B | A+B | ~(A+B) ");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |   %b |      %b  ", A,B, AorB, AnorB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |   %b |      %b  ", A,B, AorB, AnorB);
    A=1;B=0; #1
    $display("%b %b |   %b |      %b  ", A,B, AorB, AnorB);
    A=1;B=1; #1
    $display("%b %b |   %b |      %b  ", A,B, AorB, AnorB);

    $display("DeMorgan's Law: ~A+~B = ~(AB)");
    $display("A B | ~A ~B | ~A+~B ");           // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |     %b  ", A,B, nA, nB, nAornB);

    $display("A B | AB | ~(AB) ");              // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b |     %b  ", A,B, AandB, AnandB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b |     %b  ", A,B, AandB, AnandB);
    A=1;B=0; #1
    $display("%b %b |  %b |     %b  ", A,B, AandB, AnandB);
    A=1;B=1; #1
    $display("%b %b |  %b |     %b  ", A,B, AandB, AnandB);
  end
endmodule    // End demorgan_test
