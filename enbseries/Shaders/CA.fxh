

#define Shift    0.4
#define Strength 0.4

float3 ChromaticAberration(float3 colorInput, float2 texcoord)
{
	float3 color;
	// Sample the color components
	color.r = TextureColor.Sample(LinearSampler, texcoord + (PixelSize * Shift)).r;
	color.g = colorInput.g;
	color.b = TextureColor.Sample(LinearSampler, texcoord - (PixelSize * Shift)).b;

	// Adjust the strength of the effect
	return lerp(colorInput, color, Strength);
}