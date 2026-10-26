#ifndef EVERWILD_WHITEBALANCE_FXH
#define EVERWILD_WHITEBALANCE_FXH

// float Temperature
// <
//     string UIName="Temperature";
//     string UIWidget="spinner";
//     float UIMin=-1.0;
//     float UIMax=1.0;
// > = 0.0;
//
// float Tint
// <
//     string UIName="Tint";
//     string UIWidget="spinner";
//     float UIMin=-1.0;
//     float UIMax=1.0;
// > = 0.0;

inline float3 EW_ProcessWhiteBalance(float3 color)
{
    // Temperature
    color.r += Temperature * 0.10;
    color.b -= Temperature * 0.10;

    // Tint
    color.g += Tint * 0.05;
    color.r -= Tint * 0.025;
    color.b -= Tint * 0.025;

    return max(color, 0.0);
}

#endif
