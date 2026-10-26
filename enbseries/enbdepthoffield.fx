//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ENBSeries Skyrim SE dx11 effect file
// visit facebook.com/MartyMcModding for news/updates
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Advanced Depth of Field 1.1b by Marty McFly 
// Port of Advanced Depth of Field 4.3 for ReShade
// Do not redistribute without credits!
// Beta version for testing
// Copyright © 2008-2016 Marty McFly
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

bool bADOF_AutofocusEnable <
string UIName = "DOF: Enable Autofocus";
> = {true};

float2	fADOF_AutofocusCenter
<
	string UIName="DOF: Autofocus sample center";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=1.00;
> = {0.5,0.5};

int	iADOF_AutofocusSamples
<
	string UIName="DOF: Autofocus sample count";
	string UIWidget="spinner";
	int UIMin=0;
	int UIMax=10;
> = {6};

float	fADOF_AutofocusRadius
<
	string UIName="DOF: Autofocus sample radius";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=0.50;
> = {0.05};

float	fADOF_NearBlurCurve
<
	string UIName="DOF: Near blur curve";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=20.0;
> = {1.0};

float	fADOF_FarBlurCurve
<
	string UIName="DOF: Far blur curve";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=20.0;
> = {1.0};

float	fADOF_NearBlurMult
<
	string UIName="DOF: Near blur mult";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=1.0;
> = {1.0};

float	fADOF_FarBlurMult
<
	string UIName="DOF: Far blur mult";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.00;
	float UIMax=1.0;
> = {1.0};

float	fADOF_ManualfocusDepth
<
	string UIName="DOF: Manual focus depth";
	string UIWidget="Spinner";
	float UIStep=0.001;
	float UIMin=0.00;
	float UIMax=1.0;
> = {0.05};

float	fADOF_InfiniteFocus
<
	string UIName="DOF: Infinite depth distance";
	string UIWidget="Spinner";
	float UIStep=0.001;
	float UIMin=0.00;
	float UIMax=1.0;
> = {1.0};

float	fADOF_ShapeRadius
<
	string UIName="DOF: Maximal blur radius";
	string UIWidget="Spinner";
	float UIStep=0.1;
	float UIMin=0.0;
	float UIMax=50.0;
> = {12.0};

int	iADOF_ShapeVertices
<
	string UIName="DOF: Bokeh shape vertices";
	string UIWidget="spinner";
	int UIMin=3;
	int UIMax=9;
> = {6};

int	iADOF_ShapeQuality
<
	string UIName="DOF: Bokeh shape quality";
	string UIWidget="spinner";
	int UIMin=2;
	int UIMax=25;
> = {9};

float	fADOF_BokehCurve
<
	string UIName="DOF: Bokeh Intensity";
	string UIWidget="Spinner";
	float UIStep=0.1;
	float UIMin=0.1;
	float UIMax=10.0;
> = {4.0};

float	fADOF_ShapeRotation
<
	string UIName="DOF: Bokeh rotation";
	string UIWidget="Spinner";
	float UIStep=1;
	float UIMin=0;
	float UIMax=360;
> = {15};

float	fADOF_RenderResolutionMult
<
	string UIName="DOF: Blur render res mult";
	string UIWidget="Spinner";
	float UIStep=0.01;
	float UIMin=0.5;
	float UIMax=1.0;
> = {0.7};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//external enb parameters, do not modify
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float4	Timer; 			//x = generic timer in range 0..1, period of 16777216 ms (4.6 hours), y = average fps, w = frame time elapsed (in seconds)
float4	ScreenSize; 		//x = Width, y = 1/Width, z = aspect, w = 1/aspect, aspect is Width/Height
float	AdaptiveQuality;	//changes in range 0..1, 0 means full quality, 1 lowest dynamic quality (0.33, 0.66 are limits for quality levels)
float4	Weather;		//x = current weather index, y = outgoing weather index, z = weather transition, w = time of the day in 24 standart hours. Weather index is value from weather ini file, for example WEATHER002 means index==2, but index==0 means that weather not captured.
float4	TimeOfDay1;		//x = dawn, y = sunrise, z = day, w = sunset. Interpolators range from 0..1
float4	TimeOfDay2;		//x = dusk, y = night. Interpolators range from 0..1
float	ENightDayFactor;	//changes in range 0..1, 0 means that night time, 1 - day time
float	EInteriorFactor;	//changes 0 or 1. 0 means that exterior, 1 - interior
#define PixelSize 		float2(ScreenSize.y,ScreenSize.y*ScreenSize.z)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//external enb debugging parameters for shader programmers, do not modify
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float4	tempF1; 		//0,1,2,3
float4	tempF2; 		//5,6,7,8
float4	tempF3; 		//9,0
float4	tempInfo1; 		//float4(cursorpos.xy 0~1,isshaderwindowopen, mouse buttons)
float4	tempInfo2;		//float4(cursorpos.xy prev left mouse button click, cursorpos.xy prev right mouse button click)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//mod parameters, do not modify
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float4			DofParameters;		//z = ApertureTime multiplied by time elapsed, w = FocusingTime multiplied by time elapsed
Texture2D		TextureCurrent; 	//current frame focus depth or aperture. unused in dof computation
Texture2D		TexturePrevious; 	//previous frame focus depth or aperture. unused in dof computation
Texture2D		TextureOriginal; 	//color R16B16G16A16 64 bit hdr format
Texture2D		TextureColor; 		//color which is output of previous technique (except when drawed to temporary render target), R16B16G16A16 64 bit hdr format
Texture2D		TextureDepth; 		//scene depth R32F 32 bit hdr format
Texture2D		TextureFocus; 		//this frame focus 1*1 R32F hdr red channel only. computed in PS_Focus
Texture2D		TextureAperture; 	//this frame aperture 1*1 R32F hdr red channel only. computed in PS_Aperture
Texture2D		TextureAdaptation;	//previous frame vanilla or enb adaptation 1*1 R32F hdr red channel only. adaptation computed after depth of field and it's kinda "average" brightness of screen!!!
//temporary textures which can be set as render target for techniques via annotations like <string RenderTarget="RenderTargetRGBA32";>
Texture2D		RenderTargetRGBA32; 	//R8G8B8A8 32 bit ldr format
Texture2D		RenderTargetRGBA64; 	//R16B16G16A16 64 bit ldr format
Texture2D		RenderTargetRGBA64F; 	//R16B16G16A16F 64 bit hdr format
Texture2D		RenderTargetR16F; 	//R16F 16 bit hdr format with red channel only
Texture2D		RenderTargetR32F; 	//R32F 32 bit hdr format with red channel only
Texture2D		RenderTargetRGB32F; 	//32 bit hdr format without alpha

SamplerState		Sampler0
{
	Filter = MIN_MAG_MIP_POINT;
	AddressU = Clamp;
	AddressV = Clamp;
};
SamplerState		Sampler1
{
	Filter = MIN_MAG_MIP_LINEAR;
	AddressU = Clamp;
	AddressV = Clamp;
};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Vertex Shader
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void VS_DOF(in float3 inpos : POSITION, inout float2 txcoord0 : TEXCOORD0, out float4 outpos : SV_POSITION)
{
	outpos = float4(inpos.xyz,1.0);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Functions
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float GetLinearDepth(float2 coords)
{
	float depth = TextureDepth.SampleLevel(Sampler1, coords.xy,0).x;
	static const float N = 1.0;
	static const float F = 3000.0;

	depth /= F - depth * (F - N);
	return depth;
}

float GetCoC(float2 texcoord)
{
	float	scenedepth	= GetLinearDepth(texcoord.xy);
	float	scenefocus	= TextureFocus.Sample(Sampler0, texcoord.xy).x;
	float   scenecoc 	= 0.0;

	scenefocus = smoothstep(0.0,fADOF_InfiniteFocus,scenefocus);
	scenedepth = smoothstep(0.0,fADOF_InfiniteFocus,scenedepth);
	
	float farBlurDepth = scenefocus*pow(4.0,fADOF_FarBlurCurve);

	if(scenedepth < scenefocus)
	{
		scenecoc = (scenedepth - scenefocus) / scenefocus;
		scenecoc *= fADOF_NearBlurMult;
	}
	else
	{
		scenecoc=(scenedepth - scenefocus)/(farBlurDepth - scenefocus);
		scenecoc *= fADOF_FarBlurMult;
		scenecoc=saturate(scenecoc);
	}

	scenecoc = (scenedepth < 0.00000001) ? 0.0 : scenecoc; //first person models
	scenecoc = saturate(scenecoc * 0.5 + 0.5);	
	return scenecoc;
}

float3 BokehBlur(Texture2D colortex, float2 coords, float discRadius, float centerDepth)
{
	float4 res 			= float4(TextureColor.Sample(Sampler1, coords.xy).xyz, 1.0);
	int ringCount			= round(lerp(0.0,(float)iADOF_ShapeQuality,discRadius/fADOF_ShapeRadius));
	float2 discRadiusInPixels	= discRadius*PixelSize.xy;
	float Alpha = 6.2831853 / iADOF_ShapeVertices;

	float2 currentVertex;
	float2 matrixVector;
	sincos(fADOF_ShapeRotation*0.0174533,currentVertex.y,currentVertex.x);
	sincos(Alpha,matrixVector.x,matrixVector.y);
	float2x2 rotMatrix = float2x2(matrixVector.y,-matrixVector.x,matrixVector.x,matrixVector.y);

	res.xyz = pow(res.xyz,fADOF_BokehCurve)*res.w;

	[fastopt]
	for(float i = 1; i <= ringCount && i<= 25; i++)
	{
		[fastopt]
		for (int j = 1; j <= iADOF_ShapeVertices && j <= 9; j++) 
		{
			float radiusCoeff = i/ringCount;
			float blursamples = i;

			float2 nextVertex = mul(currentVertex.xy, rotMatrix);

			[fastopt]
			for (float k = 0; k < blursamples && k < 25; k++)
			{
				float2 sampleOffset = lerp(currentVertex,nextVertex,k/blursamples) * radiusCoeff;

				float4 tap = colortex.SampleLevel(Sampler1, coords.xy + sampleOffset.xy * discRadiusInPixels,0);

				float tapcoc = tap.w * 2.0 - 1.0;
				tap.w = (tap.w >= centerDepth) ? 1.0 : tapcoc*tapcoc*tapcoc*tapcoc;

				res.xyz += pow(tap.xyz,fADOF_BokehCurve)*tap.w;
				res.w += tap.w; 
			}

			currentVertex = nextVertex;
		}
	}
	res.xyz = max(res.xyz/res.w,0.0);
	return pow(res.xyz,1.0/fADOF_BokehCurve);
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Pixel Shaders
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//? -> 1x1 R32F
float4	PS_Aperture(float2 texcoord : TEXCOORD0) : SV_Target
{
	//as I don't use aperture and deleting the technique causes weird things to happen, don't waste resources :v
	return 1; 
}

//fullres -> 16x16 R32F
float4	PS_ReadFocus(float2 texcoord : TEXCOORD0) : SV_Target
{
	float scenefocus 	= fADOF_ManualfocusDepth;	
	float2 coords 		= 0.0;

	if(bADOF_AutofocusEnable != 0)
	{
		scenefocus = GetLinearDepth(fADOF_AutofocusCenter.xy);
		float2 offsetVector = float2(1.0,0.0) * fADOF_AutofocusRadius;
		float Alpha = 6.2831853 / iADOF_AutofocusSamples; 
		float2x2 rotMatrix = float2x2(cos(Alpha),-sin(Alpha),sin(Alpha),cos(Alpha));

		for(int i=0; i<iADOF_AutofocusSamples; i++)
		{
			float2 currentOffset = fADOF_AutofocusCenter + offsetVector.xy;
			scenefocus += GetLinearDepth(currentOffset);
			offsetVector = mul(offsetVector,rotMatrix);
		}

		scenefocus /= iADOF_AutofocusSamples;
	}

	scenefocus = saturate(scenefocus);
	return scenefocus;
}

//16x16 -> 1x1 R32F
float4	PS_Focus(float2 texcoord : TEXCOORD0) : SV_Target
{
	float prevFocus = TexturePrevious.Sample(Sampler1, texcoord.xy).x;
	float currFocus = TextureCurrent.Sample(Sampler1, texcoord.xy).x;	

	float res = lerp(prevFocus, currFocus, DofParameters.w);
	res = saturate(res);
	return res;
}

float4	PS_CoC(float2 texcoord : TEXCOORD0) : SV_Target
{
	float4 res 		= TextureColor.Sample(Sampler1, texcoord.xy);
	float scenecoc 		= GetCoC(texcoord.xy);
	res.w = scenecoc;
	return res;
}

float4	PS_DoF_Main(float2 texcoord : TEXCOORD0) : SV_Target
{
	float2 scaledcoord = texcoord.xy / fADOF_RenderResolutionMult;

	if(!all(saturate(-scaledcoord * scaledcoord + scaledcoord))) discard;
	float4 scenecolor = TextureColor.Sample(Sampler1, scaledcoord.xy);

	float centerDepth = scenecolor.w;
	float blurAmount = abs(centerDepth * 2.0 - 1.0);
	float discRadius = blurAmount * fADOF_ShapeRadius;

	discRadius*=(centerDepth < 0.5) ? (1.0 / max(fADOF_NearBlurCurve * 2.0, 1.0)) : 1.0; 

	scenecolor.xyz = BokehBlur(TextureColor,scaledcoord.xy, discRadius, centerDepth);	
	scenecolor.w = centerDepth;

	return scenecolor;
}

float4	PS_DoF_Combine(float2 texcoord : TEXCOORD0) : SV_Target
{
	float4 blurredcolor 		= TextureColor.Sample(Sampler1, texcoord.xy*fADOF_RenderResolutionMult);
	float4 unblurredcolor		= TextureOriginal.Sample(Sampler1, texcoord.xy);
	float4 scenecolor		= 0.0;
	float centerDepth		= GetCoC(texcoord.xy);

	float discRadius = abs(centerDepth * 2.0 - 1.0) * fADOF_ShapeRadius;	
	discRadius*=(centerDepth < 0.5) ? (1.0 / max(fADOF_NearBlurCurve * 2.0, 1.0)) : 1.0; 

	scenecolor.xyz = lerp(blurredcolor.xyz, unblurredcolor.xyz,smoothstep(4.0,0.25,discRadius));

	scenecolor.w = 1.0;
	return scenecolor;
}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Techniques
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//write aperture with time factor, this is always first technique
technique11 Aperture
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_Aperture()));
	}
}

//compute focus from depth of screen and may be brightness, this is always second technique
technique11 ReadFocus
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_ReadFocus()));
	}
}

//write focus with time factor, this is always third technique
technique11 Focus
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_Focus()));
	}
}

technique11 DOF <string UIName="Marty McFly's ADOF";>
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_CoC()));
	}
}

technique11 DOF1 
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_DoF_Main()));
	}
}

technique11 DOF2
{
	pass p0
	{
		SetVertexShader(CompileShader(vs_5_0, VS_DOF()));
		SetPixelShader(CompileShader(ps_5_0, PS_DoF_Combine()));
	}
}

