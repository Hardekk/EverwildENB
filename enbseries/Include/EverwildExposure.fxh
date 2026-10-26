#ifndef EVERWILD_EXPOSURE_FXH
#define EVERWILD_EXPOSURE_FXH
inline float3 EW_ProcessExposure(float3 c){return c*exp2(Exposure);}
#endif
