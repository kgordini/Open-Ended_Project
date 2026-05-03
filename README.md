# Open-Ended_Project

This project implements a hardware-based image processing system using MATLAB and SystemVerilog.

## Overview

An input image is first processed in MATLAB, where it is converted to grayscale and resized to 256x256. The pixel values are then written to a text file and used as input for the hardware modules in Quartus.

Three designs were implemented:
- Sequential brightness processor (1 pixel per cycle)
- Parallel brightness processor (4 pixels per cycle)
- Sobel edge detector (3x3 convolution)

The output from each design is written to a text file and reconstructed in MATLAB for verification.

## Files

- `matlab/` – MATLAB scripts for image processing and reconstruction  
- `verilog/` – SystemVerilog modules for sequential, parallel, and Sobel designs. Along with testbench for simulation.
- `results/` – Sequential, parallel, and Sobel output text files and PNG images. Along with hardware analysis.

## How It Works

1. Run MATLAB script to generate input pixel file  
2. Simulate SystemVerilog design in ModelSim  
3. Output pixel file is generated  
4. MATLAB reconstructs the output image for comparison

## Key Differences

- Sequential: simplest, slowest  
- Parallel: higher throughput (4 pixels per cycle)  
- Sobel: more complex computation using neighboring pixels  

## Results

- Parallel design has lower Fmax but higher throughput  
- Sobel design performs edge detection
- All designs use very low hardware resources  

## Tools Used

- MATLAB  
- Quartus
- ModelSim  
