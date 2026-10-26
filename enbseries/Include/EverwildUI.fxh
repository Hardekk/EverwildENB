#ifndef EVERWILD_UI_FXH
#define EVERWILD_UI_FXH

//=============================================================================
// LIGHT
//=============================================================================

float _HeaderLIGHT
<
    string UIName = "-------- LIGHT --------";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 0.0;
> = 0.0;

float Exposure
<
    string UIName = "Exposure";
    string UIWidget = "spinner";
    float UIMin = -2.0;
    float UIMax = 2.0;
> = 0.0;

//=============================================================================
// WHITE BALANCE
//=============================================================================

float _HeaderWHITEBALANCE
<
    string UIName = "-------- WHITE BALANCE --------";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 0.0;
> = 0.0;

float Temperature
<
    string UIName = "Temperature";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

float Tint
<
    string UIName = "Tint";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

//=============================================================================
// COLOR
//=============================================================================

float _HeaderCOLOR
<
    string UIName = "-------- COLOR --------";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 0.0;
> = 0.0;

float Contrast
<
    string UIName = "Contrast";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 2.0;
> = 1.0;

float Saturation
<
    string UIName = "Saturation";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 2.0;
> = 1.0;

float Vibrance
<
    string UIName = "Vibrance";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

float Midtones
<
    string UIName = "Midtones";
    string UIWidget = "spinner";
    float UIMin = 0.5;
    float UIMax = 2.0;
> = 1.0;

//=============================================================================
// CURVES
//=============================================================================

float _HeaderCURVES
<
    string UIName = "-------- CURVES --------";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 0.0;
> = 0.0;

float Blacks
<
    string UIName = "Black Point";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

float Shadows
<
    string UIName = "Shadows";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

float Highlights
<
    string UIName = "Highlights";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

float Whites
<
    string UIName = "White Point";
    string UIWidget = "spinner";
    float UIMin = -1.0;
    float UIMax = 1.0;
> = 0.0;

//=============================================================================
// TONEMAP
//=============================================================================

float _HeaderTONEMAP
<
    string UIName = "-------- TONEMAP --------";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 0.0;
> = 0.0;

float FilmicStrength
<
    string UIName = "Filmic Strength";
    string UIWidget = "spinner";
    float UIMin = 0.0;
    float UIMax = 1.0;
> = 0.0;

#endif