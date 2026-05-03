module image_processor #(parameter int ROWS = 256,
                         parameter int COLS = 256,
                         parameter int TOTAL_PIXELS = ROWS * COLS)

                        (input  logic clk,
                         input  logic reset,
                         input  logic start,
                         output logic done);

    // input and output image memories
    logic [7:0] input_memory  [0:TOTAL_PIXELS-1];
    logic [7:0] output_memory [0:TOTAL_PIXELS-1];

    // pixel counter
    logic [$clog2(TOTAL_PIXELS):0] pixel_index;

    // for brightness adjustment
    logic [8:0] bright_pixel;

    // cycle counter
    logic [31:0] cycle_count;

    // load image data from MATLAB file
    initial begin
        $readmemh("image_input.txt", input_memory);
    end

    // image processing
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            pixel_index <= 0;
            done        <= 0;
            cycle_count <= 0;
        end else begin
            if (start && !done) begin

                // increment cycle counter every clock
                cycle_count <= cycle_count + 1;

                // grayscale-preserving brightness increase
                // adds 40 to each pixel but stops at 255
                bright_pixel = input_memory[pixel_index] + 9'd40;

                if (bright_pixel > 9'd255)
                    output_memory[pixel_index] <= 8'd255;
                else
                    output_memory[pixel_index] <= bright_pixel[7:0];

                // move to next pixel
                if (pixel_index == TOTAL_PIXELS - 1) begin
                    done <= 1;
                end else begin
                    pixel_index <= pixel_index + 1;
                end

            end
        end
    end

endmodule 
