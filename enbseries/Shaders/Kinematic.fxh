

#define noise_mix_multiplier 0.9



float4 Kinematic(float4 original, float4 NoiseColor, float2 txcoord, float k_brightness, float noise_mix_curve)
{
	float2 coord;
	float4 res =0;

	float3 gray_filter = float3 (0.5285, 0.515, 0.515);

	float clamp_low = 0.000005;
	float clamp_high = 15.25;

	float additive_noise_factor = 0.0075;				// More ANF = more noise. Comment this line to disable the B&W filter entirely
	float multiplicative_noise_min = -0.45;
	float multiplicative_noise_max = -0.45;
	
	// Scale
	original.xyz *= k_brightness;
	
	// Limit
	original.xyz = clamp (original.xyz, clamp_low, clamp_high);

	// Noise
	coord.xy = txcoord * ScreenSize.y * 4000.0;
	coord.y += frac (Timer.x * 140000.0);
	float4 noise_big = NoiseColor;
	float mix_fact = noise_big.x;
	mix_fact = saturate ((mix_fact - 0.5) * 5.0);

	coord.xy = txcoord * ScreenSize.x * 0.008;
	coord.x += frac ((noise_big.y) * frac (Timer.x * 100000.0) * 1.3);
	coord.y += frac (Timer.x * 160000.0);
	float4 noise_color = NoiseColor;
	noise_color.w = lerp (noise_color.x, noise_color.y, mix_fact);

	// Mix gray with noise
	mix_fact = dot (original.xyz, 2.133);
	mix_fact = pow (saturate (noise_mix_multiplier * mix_fact), noise_mix_curve);
	noise_color.x = noise_color.w * additive_noise_factor;
	noise_color.w = lerp (multiplicative_noise_min, multiplicative_noise_max, noise_color.w);

	res.xyz = lerp (original.xyz * noise_color.w + noise_color.x, original.xyz, mix_fact);

	return res;
}