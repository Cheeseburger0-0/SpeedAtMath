shader_type canvas_item;

// Chalkboard Color
uniform vec3 board_color = vec3(0.1, 0.3, 0.1);  // Dark green
uniform float noise_strength = 0.1; // Adjust chalk dust effect

void fragment() {
    // Basic chalkboard color
    vec3 color = board_color;
    
    // Add noise for a realistic chalky texture
    float noise = fract(sin(dot(FRAGCOORD.xy, vec2(12.9898, 78.233))) * 43758.5453);
    color += noise * noise_strength;

    COLOR = vec4(color, 1.0);
}
