#ifndef EVERWILD_CURVES_FXH
#define EVERWILD_CURVES_FXH

// float Blacks
// <
//     string UIName = "Blacks";
//     string UIWidget = "spinner";
//     float UIMin = -1.0;
//     float UIMax = 1.0;
// > = 0.0;
//
// float Shadows
// <
//     string UIName = "Shadows";
//     string UIWidget = "spinner";
//     float UIMin = -1.0;
//     float UIMax = 1.0;
// > = 0.0;
//
// float Highlights
// <
//     string UIName = "Highlights";
//     string UIWidget = "spinner";
//     float UIMin = -1.0;
//     float UIMax = 1.0;
// > = 0.0;
//
// float Whites
// <
//     string UIName = "Whites";
//     string UIWidget = "spinner";
//     float UIMin = -1.0;
//     float UIMax = 1.0;
// > = 0.0;
//
//=============================================================================

inline float3 EW_ProcessCurves(float3 color)
{
    float luma = EW_Luminance(color);

    float blackMask     = saturate(1.0 - luma * 4.0);
    float shadowMask    = saturate(1.0 - luma * 2.0) * (1.0 - blackMask);
    float highlightMask = saturate((luma - 0.5) * 2.0);
    float whiteMask     = saturate((luma - 0.75) * 4.0);

    color += Blacks     * blackMask;
    color += Shadows    * shadowMask * 0.5;
    color += Highlights * highlightMask * 0.5;
    color += Whites     * whiteMask;

    return max(color, 0.0);
}

#endif // EVERWILD_CURVES_FXH
