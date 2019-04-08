# Simple-General-Purpose-Processor.
Desgined and constructed a macro-processor using VHDL and implemented it on a FPGA board. 
# Introduction  
Constructing the Simple General-Purpose Processor requires multiple parts such as two latches, one Arithmetic Logic Unit (ALU), Control Unit which contains a FSM and a 4x16 Decoder, and the seven-segment display unit to output the our results. Each processor takes two inputs of 8-bits and processes it through the latches, which then goes into the ALU. The ALU also has the Control Unit’s output going into it, which then everything gets complied and processed. The overall output then is seen on the seven-segment display. The main goal of this lab was to design and construct and Arithmetic Logic Unit (ALU) in VHDL and implement it on an FPGA board.
# Components
## Latch (1 and 2):
The latch is a temporary storage unit which holds the value of the inputs, A and B, and take that output into ALU so that the ALU could execute the function programmed. The latch has 3 components, two inputs, D and clock, and one output Q. The clock input is either 0 or 1. 1 is the “on” state and 0 is the “off” state.
## 4x16 Decoder:
As the upcounter increments up by one to each state of clock, it will have a 4-bit input value which will determine what kind of operation to run. The programmer must have added approximately 9 functions into the ALU and the decoder chooses which function to run based on the input given to it. Also, the decoder has an enable switch which is off when it is 0 or on when it is 1.
## Arithmetic Logic Unit (ALU):
The ALU conveys all the components together. It has 4 inputs, Clock, A (8-bit), B (8-bit), and Op (8-Bit), and 1 output, R (8-bit). The A & B inputs come from the outputs of the 2 latches. The Op input comes from the output of the decoder. After receiving instructions from the outputs of the latches, decoder, and upcounter, the ALU processes it all together. When the clock is decreasing, the value of the Op is calculated using the outputs of the two latches. The decoder and upcounter work together and the latches work together to send different signals go the same ALU. In Figure 3.1 below, you can see the entire ALU and the processing system working.
## Finite State Machine (FSM):
The FSM I used was a Moore machine to go to the next state of the functions. It chooses which function goes into the ALU for processing. The FSM essentially works with the decoder to control part of the output







