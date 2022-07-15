shader_type canvas_item;

uniform int search_depth;
uniform float diffuseRate;
uniform float decayRate;
uniform sampler2D frame;

vec4 blur (vec4 originalCol,vec2 uv )
{

	vec4 sum = vec4(0f);
	// 3x3 blur
	for (int offsetX = -search_depth; offsetX <= search_depth; offsetX ++) {
		for (int offsetY = -search_depth; offsetY <= search_depth; offsetY ++) {
			float sampleX = min(1024f, max(0f, uv.x + float(offsetX)/1024f));
			float sampleY = min(600f, max(0f, uv.y + float(offsetY)/600f));
			sum += texture(frame,vec2(sampleX,sampleY));
		}
	}

	vec4 blurredCol = sum / float((search_depth * 2 + 1) * (search_depth*2 + 1));
	float diffuseWeight = clamp(diffuseRate,0f,1f);
	blurredCol = originalCol * (1f - diffuseWeight) + blurredCol * (diffuseWeight);

	//DiffusedTrailMap[id.xy] = blurredCol * saturate(1 - decayRate * deltaTime);
	return max(vec4(0f), blurredCol - decayRate);
}

void fragment()
{
	COLOR = blur(texture(frame,UV),UV);
}
