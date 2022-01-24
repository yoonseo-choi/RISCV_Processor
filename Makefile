riscv:
	verilator --cc -y lib -y src RISCV_Processor.sv

adder:
	verilator --cc -y lib FullAdder_64.sv FullAdder_32.sv FullAdder_16.sv FullAdder_4.sv FullAdder_1.sv

reg_file:
	verilator --cc -y lib RegFile_64.sv

lshift:
	verilator --cc -y lib LShift.sv

mux:
	verilator --cc -y lib Mux_2x1.sv

dff:
	verilator --cc -y lib D_FlipFlop.sv

alu:
	verilator --cc -y src ALU.sv

immgen:
	verilator --cc -y src ImmGen.sv

clean:
	rm -r obj_dir/
