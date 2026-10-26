float3 technicolor(float3 Color, float brightness, float techStrength)
{
   float3 source      = saturate( Color.rgb );
   float3 temp        = 1-source.rgb;
   float3 target      = temp.grg;
   float3 target2     = temp.bbr;
   float3 temp2       = source.rgb * target.rgb;
   temp2.rgb         *= target2.rgb;
   
   temp.rgb           = temp2.rgb;
   temp2.rgb         *= brightness;
   
   target.rgb         = temp.grg;
   target2.rgb        = temp.bbr;
   
   temp.rgb           = source.rgb - target.rgb;
   temp.rgb          += temp2.rgb;
   temp2.rgb          = temp.rgb - target2.rgb;
   
   return               lerp( source.rgb, temp2.rgb, techStrength );
}