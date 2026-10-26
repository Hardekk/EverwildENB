#ifndef EVERWILD_NEXTGEN_FXH
#define EVERWILD_NEXTGEN_FXH

Texture2D RenderTargetR16F;
Texture2D RenderTargetR32F;

int   EW_NG_Title < string UIName="--------- EVERWILD NEXT GEN ---------"; int UIMin=0; int UIMax=0; > = {0};

bool  EW_LE_Enable   < string UIName="Local Exposure"; > = {true};
float EW_LE_Strength < string UIName="Local Exposure: Strength"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=1.0; > = {0.35};
float EW_LE_MaxEV    < string UIName="Local Exposure: Max EV"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=3.0; > = {1.5};
float EW_LE_Radius   < string UIName="Local Exposure: Radius"; string UIWidget="Spinner"; float UIMin=0.02; float UIMax=0.4; > = {0.12};

bool  EW_MV_Enable   < string UIName="Night Vision (Purkinje)"; > = {true};
float EW_MV_Strength < string UIName="Night Vision: Strength"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=1.0; > = {0.6};

bool  EW_AP_Enable   < string UIName="Aerial Perspective"; > = {true};
float EW_AP_Strength < string UIName="Aerial Perspective: Strength"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=1.0; > = {0.35};
float EW_AP_Start    < string UIName="Aerial Perspective: Start Distance"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=1.0; > = {0.05};
float EW_AP_Density  < string UIName="Aerial Perspective: Density"; string UIWidget="Spinner"; float UIMin=0.0; float UIMax=20.0; > = {3.0};

static const float3 EW_NG_Luma = float3(0.2126, 0.7152, 0.0722);

float EW_NG_LinearDepth(float2 uv)
{
	float d = TextureDepth.SampleLevel(Sampler1, uv, 0).x;
	return d / (3000.0 - d * 2999.0);
}

float4 PS_EW_LumPrep(VS_OUTPUT_POST IN, float4 v0 : SV_Position0) : SV_Target
{
	float2 px = float2(ScreenSize.y, ScreenSize.y * ScreenSize.z);
	float3 c = 0.0;
	c += TextureColor.SampleLevel(Sampler1, IN.txcoord0.xy + px * float2(-1.0, -1.0), 0).rgb;
	c += TextureColor.SampleLevel(Sampler1, IN.txcoord0.xy + px * float2( 1.0, -1.0), 0).rgb;
	c += TextureColor.SampleLevel(Sampler1, IN.txcoord0.xy + px * float2(-1.0,  1.0), 0).rgb;
	c += TextureColor.SampleLevel(Sampler1, IN.txcoord0.xy + px * float2( 1.0,  1.0), 0).rgb;
	float l = max(dot(max(c, 0.0) * 0.25, EW_NG_Luma), 0.00001);
	return float4(log2(l), 0.0, 0.0, 1.0);
}

float4 PS_EW_LumBlur(VS_OUTPUT_POST IN, float4 v0 : SV_Position0) : SV_Target
{
	float center = RenderTargetR16F.SampleLevel(Sampler1, IN.txcoord0.xy, 0).x;
	float sum = center;
	float wsum = 1.0;
	float2 aspect = float2(ScreenSize.w, 1.0);
	[unroll]
	for (int i = 1; i <= 32; i++)
	{
		float r = EW_LE_Radius * sqrt(i / 32.0);
		float a = i * 2.39996323;
		float2 o = float2(cos(a), sin(a)) * r * aspect;
		float s = RenderTargetR16F.SampleLevel(Sampler1, IN.txcoord0.xy + o, 0).x;
		float d = s - center;
		float w = exp(-d * d * 0.5);
		sum += s * w;
		wsum += w;
	}
	return float4(sum / wsum, 0.0, 0.0, 1.0);
}

float3 EW_NextGen(float3 c, float2 uv, float adapt)
{
	c = max(c, 0.0);
	float lum = max(dot(c, EW_NG_Luma), 0.00001);

	if (EW_AP_Enable && EInteriorFactor < 0.5)
	{
		float z = EW_NG_LinearDepth(uv);
		if (z < 0.999)
		{
			float3 sky = 0.0;
			float n = 0.0;
			[unroll]
			for (int i = 0; i < 8; i++)
			{
				float2 p = float2((i + 0.5) / 8.0, 0.18);
				float k = (EW_NG_LinearDepth(p) > 0.999) ? 1.0 : 0.0;
				sky += max(TextureColor.SampleLevel(Sampler1, p, 0).rgb, 0.0) * k;
				n += k;
			}
			float3 haze = (n > 0.5) ? sky / n : lum.xxx;
			float hl = max(dot(haze, EW_NG_Luma), 0.00001);
			haze = haze / hl * lerp(lum, hl, 0.5);
			float f = 1.0 - exp(-max(z - EW_AP_Start, 0.0) * EW_AP_Density);
			c = lerp(c, haze, saturate(f * EW_AP_Strength));
		}
	}

	if (EW_LE_Enable)
	{
		float localLog = RenderTargetR32F.SampleLevel(Sampler1, uv, 0).x;
		float globalLog = 0.0;
		[unroll]
		for (int gy = 0; gy < 3; gy++)
		{
			[unroll]
			for (int gx = 0; gx < 3; gx++)
			{
				globalLog += RenderTargetR32F.SampleLevel(Sampler1, float2((gx + 0.5) / 3.0, (gy + 0.5) / 3.0), 0).x;
			}
		}
		globalLog /= 9.0;
		float ev = clamp((globalLog - localLog) * EW_LE_Strength, -EW_LE_MaxEV, EW_LE_MaxEV);
		c *= exp2(ev);
	}

	if (EW_MV_Enable)
	{
		float a = max(adapt, 0.0001);
		float sceneDark = saturate((-1.5 - log2(a)) / 2.5);
		float l2 = max(dot(c, EW_NG_Luma), 0.00001);
		float pixelDark = saturate(1.0 - l2 / (a * 4.0));
		float w = sceneDark * pixelDark * EW_MV_Strength;
		float3 tint = float3(0.80, 0.90, 1.06);
		tint /= dot(tint, EW_NG_Luma);
		float rod = dot(c, float3(0.02, 0.40, 0.58));
		c = lerp(c, rod * tint, w);
	}

	return max(c, 0.0);
}

#endif
