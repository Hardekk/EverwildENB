#ifndef EVERWILD_COLOR_FXH
#define EVERWILD_COLOR_FXH
inline float3 EW_ProcessColor(float3 c)
{
 c=((c-0.5)*Contrast)+0.5;
 float l=EW_Luminance(c);
 c=lerp(l.xxx,c,Saturation);
 float s=EW_ColorSaturation(c);
 c=EW_Lerp(l.xxx,c,1.0+(1.0-s)*Vibrance);
 c=EW_SafePow(c,1.0/max(Midtones,0.001));
 return c;
}
#endif
