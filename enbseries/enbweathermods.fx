/////////////////////////////////////////////////////////
//                PHOTOREALISTIC TAMRIEL X             //
//-----------------------------------------------------//
//                	WEATHER MOD SETTINGS               //
//                         0.0.1                       //

float 	satLimit  ;
float 	MinExposureDay  ;
float 	MaxExposureDay  ;
float 	fxcolorMixDay  ;
float 	fTintPercentDay  ;
float 	fTintPercentNight  ;
float 	fTintPercentInterior  ;
float 	AdaptationMinDay  ;
float 	AdaptationMaxDay  ;
float 	BrightnessDay  ;
float 	IntensityContrastDay  ;
float 	SaturationDay  ;
float 	ToneMappingOversaturationDay  ;
float 	ToneMappingCurveDay  ;
float	RedFilterDay  ;
float	GreenFilterDay  ;
float	BlueFilterDay  ;
float	DesatRDay  ;
float	DesatGDay  ;
float	DesatBDay  ;
float 	MinExposureDawn ;
float 	MinExposureSunrise ;
float 	MinExposureSunset ;
float 	MinExposureDusk ;
float 	MinExposureNight  ;
float 	MaxExposureNight  ;
float 	fxcolorMixNight  ;
float 	AdaptationMinNight  ;
float 	AdaptationMaxNight  ;
float 	BrightnessNight  ;
float 	IntensityContrastNight  ;
float 	SaturationNight  ;
float 	ToneMappingOversaturationNight  ;
float 	ToneMappingCurveNight  ;
float	RedFilterNight  ;
float	GreenFilterNight  ;
float	BlueFilterNight  ;
float	DesatRNight  ;
float	DesatGNight  ;
float	DesatBNight  ;
float 	MinExposureInterior  ;
float 	MaxExposureInterior  ;
float 	fxcolorMixInterior  ;
float 	AdaptationMinInterior  ;
float 	AdaptationMaxInterior  ;
float 	BrightnessInterior  ;
float 	IntensityContrastInterior  ;
float 	SaturationInterior  ;
float 	ToneMappingOversaturationInterior  ;
float 	ToneMappingCurveInterior  ;
float	RedFilterInterior  ;
float	GreenFilterInterior  ;
float	BlueFilterInterior  ;
float	DesatRInterior  ;
float	DesatGInterior  ;
float	DesatBInterior  ;

// INTERIOR

 	MinExposureInterior = 1.0;
 	MaxExposureInterior = 1.0;
 	fxcolorMixInterior = 0.350;
	fTintPercentInterior = 0.50;
 	AdaptationMinInterior = 0.0010;
 	AdaptationMaxInterior = 0.150;
 	BrightnessInterior = 1.0+(fIntLuma/10);
 	IntensityContrastInterior = 1.0;
 	SaturationInterior = 2.70;
 	ToneMappingOversaturationInterior = 300.0;
 	ToneMappingCurveInterior = 8.00*fIntLuma;
	RedFilterInterior = 1.0;
	GreenFilterInterior = 1.0;
	BlueFilterInterior = 1.0;
	DesatRInterior = 0.90;
	DesatGInterior = 0.0;
	DesatBInterior = 0.70;
	
/////////////////////////////////////////////////////////
//              	VANILLA - TRUE STORMS              //
/////////////////////////////////////////////////////////

if (iWeatherMod == 0) {
 	
	satLimit = 0.900;
// DAY
 	MinExposureDay = 0.550;
 	MaxExposureDay = 3.0;
 	fxcolorMixDay = 0.300;
	fTintPercentDay = 0.30;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.250;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 1.05;
 	SaturationDay = 2.60;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 5.50*fDayLuma;
	RedFilterDay = 0.995;
	GreenFilterDay = 1.0;
	BlueFilterDay = 1.0;
	DesatRDay = 1.0;
	DesatGDay = 0.10;
	DesatBDay = 0.70;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 0.900;
 	MinExposureSunrise = 0.800;
 	MinExposureSunset = 0.800;
 	MinExposureDusk = 0.900;

// NIGHT
 	MinExposureNight = 1.0;
 	MaxExposureNight = 4.0;
 	fxcolorMixNight = 0.250;
	fTintPercentNight = 0.60;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.40;
 	ToneMappingOversaturationNight = 300.0;
 	ToneMappingCurveNight = 6.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.65;
}

/////////////////////////////////////////////////////////
//              NATURAL & ATMOSPHERIC TAMRIEL          //
/////////////////////////////////////////////////////////

if (iWeatherMod == 1) {

 	satLimit = 0.9750;
// DAY
 	MinExposureDay = 0.950;
 	MaxExposureDay = 1.500;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.250;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 2.6;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 3.60*fDayLuma;
	RedFilterDay = 0.998;
	GreenFilterDay = 1.0;
	BlueFilterDay = 1.0;
	DesatRDay = 0.98;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 0.950;
 	MinExposureSunrise = 1.100;
 	MinExposureSunset = 1.100;
 	MinExposureDusk = 0.950;

// NIGHT
 	MinExposureNight = 1.0;
 	MaxExposureNight = 1.0;
 	fxcolorMixNight = 0.350;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.75;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.5;
 	ToneMappingOversaturationNight = 300.0;
 	ToneMappingCurveNight = 5.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.8;
}

/////////////////////////////////////////////////////////
//              	Obsidian Weathers                  //
/////////////////////////////////////////////////////////

if (iWeatherMod == 2) {

 	satLimit = 0.850;
// DAY
 	MinExposureDay = 0.800;
 	MaxExposureDay = 1.000;
 	fxcolorMixDay = 0.350;
	fTintPercentDay = 0.80;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.240;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 2.5;
 	ToneMappingOversaturationDay = 300.0 ;
 	ToneMappingCurveDay = 4.50*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 0.995;
	BlueFilterDay = 1.0 ;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 0.900;
 	MinExposureSunrise = 0.900;
 	MinExposureSunset = 0.900;
 	MinExposureDusk = 0.900;

// NIGHT
 	MinExposureNight = 0.850;
 	MaxExposureNight = 1.0;
 	fxcolorMixNight = 0.250;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.110;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.50;
 	ToneMappingOversaturationNight = 300.0;
 	ToneMappingCurveNight = 5.5*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.80;
}

/////////////////////////////////////////////////////////
//              	VIVID WEATHERS              	   //
/////////////////////////////////////////////////////////

if (iWeatherMod == 3) {

 	satLimit = 0.900;
// DAY

 	MinExposureDay = 0.900;
 	MaxExposureDay = 1.0;
 	fxcolorMixDay = 0.150;
	fTintPercentDay = 0.15;	
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.250;
 	BrightnessDay = 1.4;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 1.70;
 	ToneMappingOversaturationDay = 150;
 	ToneMappingCurveDay = 12.0*fDayLuma;
	RedFilterDay = 0.992;
	GreenFilterDay = 1.0;
	BlueFilterDay = 1.0;
	DesatRDay = 1.0;
	DesatGDay = 0.25;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 0.950;
 	MinExposureSunrise = 0.750;
 	MinExposureSunset = 0.750;
 	MinExposureDusk = 0.950;

// NIGHT
 	MinExposureNight = 0.950;
 	MaxExposureNight = 3.0;
 	fxcolorMixNight = 0.350;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.02;
 	SaturationNight = 2.20;
 	ToneMappingOversaturationNight = 300;
 	ToneMappingCurveNight = 6.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.70; 
}

/////////////////////////////////////////////////////////
//              	RUSTIC WEATHERS              	   //
/////////////////////////////////////////////////////////

if (iWeatherMod == 4) {

 	satLimit = 0.750;
// DAY

 	MinExposureDay = 0.850 ;
 	MaxExposureDay = 1.0;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.220;
 	BrightnessDay = 1.02;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 2.40;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 3.40*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 1.0;
	BlueFilterDay = 1.0;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 1.5;
 	MinExposureSunrise = 1.35;
 	MinExposureSunset = 1.35;
 	MinExposureDusk = 1.5;

// NIGHT
 	MinExposureNight = 1.000;
 	MaxExposureNight = 1.500;
 	fxcolorMixNight = 0.300;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.50;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.20;
 	ToneMappingOversaturationNight = 300.0;
 	ToneMappingCurveNight = 5.0*fNightLuma;
	RedFilterNight = 1.0;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

/////////////////////////////////////////////////////////
//              	  DOLOMITE                         //
/////////////////////////////////////////////////////////

if (iWeatherMod == 5) {

 	satLimit = 0.750;
// DAY

 	MinExposureDay = 0.900;
 	MaxExposureDay = 1.000;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.20;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.210;
 	BrightnessDay = 1.0 ;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 2.50;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 3.20*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 1.0;
	BlueFilterDay = 1.0;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 1.000;
 	MinExposureSunrise = 1.000;
 	MinExposureSunset = 1.000;
 	MinExposureDusk = 1.000;

// NIGHT
 	MinExposureNight = 0.850;
 	MaxExposureNight = 1.000;
 	fxcolorMixNight = 0.250;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.100;
 	BrightnessNight = 0.35;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.50;
 	ToneMappingOversaturationNight = 300.0;
 	ToneMappingCurveNight = 2.50*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0 ;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

/////////////////////////////////////////////////////////
//              	 	ELFX              			   //
/////////////////////////////////////////////////////////

if (iWeatherMod == 6) {

 	satLimit = 1.0;
// DAY

 	MinExposureDay = 0.700;
 	MaxExposureDay = 1.500;
 	fxcolorMixDay = 0.300;
	fTintPercentDay = 0.15;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.280;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 1.03;
 	SaturationDay = 2.80;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 4.50*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 0.998;
	BlueFilterDay = 0.990;
	DesatRDay = 1.0;
	DesatGDay = 0.15;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 1.000;
 	MinExposureSunrise = 0.900;
 	MinExposureSunset = 0.900;
 	MinExposureDusk = 1.000;

// NIGHT
 	MinExposureNight = 0.800;
 	MaxExposureNight = 2.000;
 	fxcolorMixNight = 0.150;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.100;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.50;
 	ToneMappingOversaturationNight = 200.0;
 	ToneMappingCurveNight = 4.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.000;
	BlueFilterNight = 1.000;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

/////////////////////////////////////////////////////////
//              		  COT              			   //
/////////////////////////////////////////////////////////

if (iWeatherMod == 7) {

 	satLimit = 0.900;
// DAY

 	MinExposureDay = 0.900;
 	MaxExposureDay = 1.00;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.230;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 0.95;
 	SaturationDay = 2.5;
 	ToneMappingOversaturationDay = 300.0;
 	ToneMappingCurveDay = 5.0*fDayLuma;
	RedFilterDay = 1.000;
	GreenFilterDay = 1.000;
	BlueFilterDay = 0.990;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 1.0;
 	MinExposureSunrise = 0.950;
 	MinExposureSunset = 0.950;
 	MinExposureDusk = 1.0;

// NIGHT
 	MinExposureNight = 0.800;
 	MaxExposureNight = 5.000;
 	fxcolorMixNight = 0.180;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.50;
 	ToneMappingOversaturationNight = 150.0;
 	ToneMappingCurveNight = 6.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.00;
	BlueFilterNight = 1.00;
	DesatRNight = 1.00;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

/////////////////////////////////////////////////////////
//              	  Mythical Ages                    //
/////////////////////////////////////////////////////////

if (iWeatherMod == 8) {

 	satLimit = 0.900;
// DAY

 	MinExposureDay = 1.0;
 	MaxExposureDay = 1.5;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.220;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 1.0;
 	SaturationDay = 2.70;
 	ToneMappingOversaturationDay = 180.0;
 	ToneMappingCurveDay = 3.50*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 0.998;
	BlueFilterDay = 0.998;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 0.900;
 	MinExposureSunrise = 1.0;
 	MinExposureSunset = 1.0;
 	MinExposureDusk = 0.900;

// NIGHT
 	MinExposureNight = 0.900;
 	MaxExposureNight = 2.0;
 	fxcolorMixNight = 0.250;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.25;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.40;
 	ToneMappingOversaturationNight = 150.0;
 	ToneMappingCurveNight = 2.80*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

/////////////////////////////////////////////////////////
//              	Aequinoctium              		   //
/////////////////////////////////////////////////////////

if (iWeatherMod == 9) {

 	satLimit = 0.900;
// DAY

 	MinExposureDay = 1.0;
 	MaxExposureDay = 1.500;
 	fxcolorMixDay = 0.250;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = 0.0;
 	AdaptationMaxDay = 0.230;
 	BrightnessDay = 1.0;
 	IntensityContrastDay = 0.98;
 	SaturationDay = 2.45;
 	ToneMappingOversaturationDay = 220;
 	ToneMappingCurveDay = 3.50*fDayLuma;
	RedFilterDay = 1.0;
	GreenFilterDay = 1.0;
	BlueFilterDay = 0.999;
	DesatRDay = 1.0;
	DesatGDay = 0.12;
	DesatBDay = 0.60;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = 1.4;
 	MinExposureSunrise = 1.2;
 	MinExposureSunset = 1.2;
 	MinExposureDusk = 1.4;

// NIGHT
 	MinExposureNight = 0.900;
 	MaxExposureNight = 2.0;
 	fxcolorMixNight = 0.200;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = 0.0010;
 	AdaptationMaxNight = 0.150;
 	BrightnessNight = 0.30;
 	IntensityContrastNight = 1.0;
 	SaturationNight = 2.20;
 	ToneMappingOversaturationNight = 200;
 	ToneMappingCurveNight = 2.0*fNightLuma;
	RedFilterNight = 0.995;
	GreenFilterNight = 1.0;
	BlueFilterNight = 1.0;
	DesatRNight = 1.0;
	DesatGNight = 0.0;
	DesatBNight = 0.80; 
}

 
/////////////////////////////////////////////////////////
//              	VANILLA - TRUE STORMS              //
/////////////////////////////////////////////////////////
/* 
if (iWeatherMod == 0) {

 	satLimit = ;
// DAY

 	MinExposureDay = ;
 	MaxExposureDay = ;
 	fxcolorMixDay = ;
	fTintPercentDay = 0.50;
 	AdaptationMinDay = ;
 	AdaptationMaxDay = ;
 	BrightnessDay = ;
 	IntensityContrastDay = ;
 	SaturationDay = ;
 	ToneMappingOversaturationDay = ;
 	ToneMappingCurveDay = *fDayLuma;
	RedFilterDay = ;
	GreenFilterDay = ;
	BlueFilterDay = ;
	DesatRDay = ;
	DesatGDay = ;
	DesatBDay = ;

// DAWN DUSK SUNRISE SUNSETS
 	MinExposureDawn = ;
 	MinExposureSunrise = ;
 	MinExposureSunset = ;
 	MinExposureDusk = ;

// NIGHT
 	MinExposureNight = ;
 	MaxExposureNight = ;
 	fxcolorMixNight = ;
	fTintPercentNight = 0.50;
 	AdaptationMinNight = ;
 	AdaptationMaxNight = ;
 	BrightnessNight = ;
 	IntensityContrastNight = ;
 	SaturationNight = ;
 	ToneMappingOversaturationNight = ;
 	ToneMappingCurveNight = *fNightLuma;
	RedFilterNight = ;
	GreenFilterNight = ;
	BlueFilterNight = ;
	DesatRNight = ;
	DesatGNight = ;
	DesatBNight = ; 
}
 */

