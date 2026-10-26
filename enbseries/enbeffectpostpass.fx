//=============================================================================
// Everwild Postpass by Timmyss
//=============================================================================

#include "Include/EverwildCommon.fxh"
#include "Include/EverwildUI.fxh"
#include "Include/EverwildExposure.fxh"
#include "Include/EverwildColor.fxh"
#include "Include/EverwildTonemap.fxh"
#include "Include/EverwildWhiteBalance.fxh"
#include "Include/EverwildCurves.fxh"


//-----------------------------------------------------------------------------
// ENB resources
//-----------------------------------------------------------------------------

Texture2D TextureColor;

SamplerState Sampler0
{
    Filter = MIN_MAG_MIP_POINT;
    AddressU = Clamp;
    AddressV = Clamp;
};

struct VS_INPUT_POST
{
    float3 pos : POSITION;
    float2 txcoord : TEXCOORD0;
};

struct VS_OUTPUT_POST
{
    float4 pos : SV_POSITION;
    float2 txcoord0 : TEXCOORD0;
};

VS_OUTPUT_POST VS_PostProcess(VS_INPUT_POST IN)
{
    VS_OUTPUT_POST OUT;
    OUT.pos = float4(IN.pos, 1.0);
    OUT.txcoord0 = IN.txcoord;
    return OUT;
}

float4 PS_PostProcess(VS_OUTPUT_POST IN, float4 pos : SV_Position) : SV_Target
{
    float3 color = TextureColor.Sample(Sampler0, IN.txcoord0).rgb;

    color = EW_ProcessExposure(color);
    color = EW_ProcessWhiteBalance(color);
    color = EW_ProcessColor(color);
    color = EW_ProcessTonemap(color);
    color = EW_ProcessCurves(color);

    float2 ewSeed = pos.xy;
    float  ewN1 = frac(sin(dot(ewSeed, float2(12.9898, 78.233))) * 43758.5453);
    float  ewN2 = frac(sin(dot(ewSeed + 0.5813, float2(39.3468, 11.1353))) * 24634.6345);
    color += (ewN1 + ewN2 - 1.0) / 255.0;

    return float4(EW_ClampLDR(color), 1.0);
}

technique11 PostProcess
<
    string UIName = "Everwild PP";
>
{
    pass P0
    {
        SetVertexShader(CompileShader(vs_5_0, VS_PostProcess()));
        SetPixelShader(CompileShader(ps_5_0, PS_PostProcess()));
    }
}
