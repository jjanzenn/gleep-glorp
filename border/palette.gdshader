shader_type canvas_item;

// Colours used to make the original sprites
const vec4[] SOURCE_PALETTE = {
	vec4(1, 1, 1, 1),
	vec4(0.66, 0.66, 0.66, 1),
	vec4(0.33, 0.33, 0.33, 1),
	vec4(0, 0, 0, 1)
};
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec4 colour1 : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 colour2 : source_color = vec4(0.66, 0.66, 0.66, 1.0);
uniform vec4 colour3 : source_color = vec4(0.33, 0.33, 0.33, 1.0);
uniform vec4 colour4 : source_color = vec4(0.0, 0.0, 0.0, 1.0);

// Returns whether the given vectors are close enough to be considered equal
bool nearlyEqual(vec4 vector1, vec4 vector2)
{
	return all(lessThanEqual(abs(vector1 - vector2), vec4(0.01)));
}

void fragment() {
	vec4 colour = textureLod(screen_texture, SCREEN_UV, 0.0);
	if (nearlyEqual(colour, SOURCE_PALETTE[0]))
	{
		colour = colour1;
	}
	else if (nearlyEqual(colour, SOURCE_PALETTE[1]))
	{
		colour = colour2;
	}
	else if (nearlyEqual(colour, SOURCE_PALETTE[2]))
	{
		colour = colour3;
	}
	else if (nearlyEqual(colour, SOURCE_PALETTE[3]))
	{
		colour = colour4;
	}
	
	// american spelling smh
	COLOR = colour;
}