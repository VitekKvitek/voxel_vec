// Vertex shader

// Define a custom data structure to hold the output of the vertex shader.
// The position of the vertex in clip space is stored in clip_position.
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
};

// Main entry point for the vertex shader.
@vertex
fn vs_main(
    @builtin(vertex_index) in_vertex_index: u32, // Input vertex index.
) -> VertexOutput {
    var out: VertexOutput; // Mutable variable to hold the output.
    
    // Calculate the x coordinate for the vertex position in clip space.
    // The formula converts the vertex index to an x coordinate in the range [-0.5, 0.5].
    let x = f32(1 - i32(in_vertex_index)) * 0.5; // `let` defines an immutable variable.
    
    // Calculate the y coordinate for the vertex position in clip space.
    // The formula converts the vertex index to a y coordinate in the range [-0.5, 0.5].
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    
    // Assign the calculated clip space position to the output variable.
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    
    // Return the output with the position data.
    return out;
}

// Fragment shader

// Main entry point for the fragment shader.
// Takes the output of the vertex shader as input.
@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Return a constant color for each fragment.
    // The color is a vec4 with RGB values of (0.3, 0.2, 0.1) and an alpha value of 1.0.
    return vec4<f32>(0.3, 0.2, 1.0, 1.0);
}
