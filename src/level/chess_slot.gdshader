shader_type canvas_item;

uniform vec4 level_color = vec4(1.0);

void fragment() {
	COLOR = level_color;
}
