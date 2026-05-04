# Open-Ended_Project

This project implements a hardware-based image processing system using MATLAB and SystemVerilog.

## Overview

An input image is first processed in MATLAB, where it is converted to grayscale and resized to 256x256 pixels. The pixel values are then written to a text file and used as input for the hardware modules in Quartus.

Three designs were implemented:
- Sequential brightness processor (1 pixel per cycle)
- Parallel brightness processor (4 pixels per cycle)
- Sobel edge detector (3x3 convolution)

The output from each design is written to a text file and an image is reconstructed in MATLAB for verification.

## Files

- `matlab/` – MATLAB scripts for image processing and reconstruction  
- `verilog/` – SystemVerilog modules for sequential, parallel, and Sobel designs. Along with testbench for simulation.
- `results/` – Sequential, parallel, and Sobel output text files and PNG images. Along with hardware analysis.

## How Project Works

1. Import image into MATLAB
2. Run MATLAB script to generate input pixel file for ModelSim
3. Simulate SystemVerilog designs in ModelSim
3. Three output pixel files are generated  
4. MATLAB reconstructs all three output images for visual comparison

## Key Differences Between Designs

- Sequential: simplest & slowest  
- Parallel: higher throughput (4 pixels per cycle)  
- Sobel: more complex computation using neighboring pixels  

## Results

|**Total Sequential Cycles** | **Total Parallel Cycles**  | **Total Sobel Cycles** |
| -------------------------- | -------------------------- | ---------------------- |
| 65,536 | 16,384 | 65,536 |

- Parallel design has lower Fmax but higher throughput  
- Sobel design performs edge detection
- All designs use very low hardware resources  

## Tools Used

- MATLAB  
- Quartus
- ModelSim  
