#ifndef EVERWILD_TONEMAP_FXH
#define EVERWILD_TONEMAP_FXH

inline float3 EW_FilmicCurve(float3 color)
{
    color=max(color,0.0);

    const float A=0.22;
    const float B=0.30;
    const float C=0.10;
    const float D=0.20;
    const float E=0.01;
    const float F=0.30;

    return ((color*(A*color+C*B)+D*E)/
           (color*(A*color+B)+D*F))-E/F;
}

inline float3 EW_ProcessTonemap(float3 color)
{
    return lerp(color,EW_FilmicCurve(color),saturate(FilmicStrength));
}

#endif
