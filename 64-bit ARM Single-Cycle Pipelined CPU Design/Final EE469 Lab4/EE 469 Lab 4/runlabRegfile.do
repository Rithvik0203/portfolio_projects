# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
#     Replace <comments> with specified modules/files/names (leave out <>)
vlog "./MUX2x1.sv"
vlog "./MUX4x1.sv"
vlog "./MUX16x1.sv"
vlog "./MUX32x1.sv"
vlog "./MUX64x32x1.sv"
vlog "./Decoder1x2.sv"
vlog "./Decoder2x4.sv"
vlog "./Decoder3x8.sv"
vlog "./Decoder5x32.sv"
vlog "./DFFEnable.sv"
vlog "./D_FF.sv"
vlog "./regfile.sv"
vlog "./register64.sv"
vlog "./regstim.sv"
#<add all other modules (ex. vlog "./module.sv")>


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work regstim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do regstimwave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
