#ifndef EVERWILD_COMMON_FXH
#define EVERWILD_COMMON_FXH

static const float3 EW_LumaWeights=float3(0.2126,0.7152,0.0722);

inline float EW_Luminance(float3 c){return dot(c,EW_LumaWeights);}
inline float EW_Max3(float3 c){return max(c.r,max(c.g,c.b));}
inline float EW_Min3(float3 c){return min(c.r,min(c.g,c.b));}
inline float EW_ColorSaturation(float3 c){return EW_Max3(c)-EW_Min3(c);}
inline float3 EW_Lerp(float3 a,float3 b,float t){return lerp(a,b,saturate(t));}
inline float3 EW_SafePow(float3 v,float e){return pow(max(v,0.0),e);}
inline float3 EW_ClampLDR(float3 c){return saturate(c);}

#endif
