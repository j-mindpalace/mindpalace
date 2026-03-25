shader_type canvas_item;
uniform bool enabled;
uniform sampler2D Blend;  //Blending mode texture
uniform float Intensity : hint_range(0, 1) = 1.0;  //Default should be 1 but syntax doesn't allow it currently?

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
//uniform vec4 desired_color : source_color;

vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
	if (enabled){
		vec4 bgColor;
		vec3 desired_color1 = hsv2rgb(vec3(TIME,1,1));
		vec4 desired_color = vec4(desired_color1.rgb,1.0);
		vec4 Color = desired_color * vec4(1,1,1,desired_color.a*texture(TEXTURE,UV).a);
		vec4 blendColor;
	   	vec4 output = vec4(1,1,1,1);

		bgColor = texture( SCREEN_TEXTURE, SCREEN_UV);

		output.a = Color.a;

		blendColor = texture( Blend, vec2(bgColor.r, Color.r) );
		output.r = blendColor.r;
		blendColor = texture( Blend, vec2(bgColor.g, Color.g) );
		output.g = blendColor.g;
		blendColor = texture( Blend, vec2(bgColor.b, Color.b) );
		output.b = blendColor.b;

		output.rgb = mix(Color.rgb, output.rgb, Intensity);
		COLOR = output;

	} else {
		COLOR = texture(TEXTURE, UV);
	}
}