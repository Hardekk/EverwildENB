# EVERWILD ENB 4.0 - FINAL RC 1
Full changelog since 3.3

==================================================
WEATHERS - COMPLETE OVERHAUL
==================================================
Direction: 100% natural. No more "fantasy" skies, colored fog or stylized lighting.

- Every weather rebuilt on 9 real-world bases taken from the most refined Everwild weathers:
  Clear, Cloudy, Overcast, Rain, Thunderstorm, Snow, Blizzard, Fog, Underground.
  Each weather keeps a subtle variation of its own (max +/-10% from its base) so they stay consistent with each other.
- Color filters capped to physically plausible values:
  - Sky gradients: saturation capped at 0.55
  - Sun and moon: capped at 0.45
  - Lighting, fog, clouds: capped at 0.28 (even lower for fog, snow and underground)
  - Green and magenta casts removed, interiors almost neutral
- Natural sky: blue during the day, pale horizon, warm orange sun at sunrise/sunset, slightly cool nights.
- Auroras capped at 1.2 intensity. No stars or auroras underground.
- Fixed the Apocrypha weather, which was missing about 260 parameters.

Renamed weathers (3.3 -> 4.0):
- EW_CloudlessSky -> Serene
- EW_Clear -> Radiant + Azure (clear skies are now split into two weathers)
- EW_Clear_Sunnier -> Zenith
- EW_Clear15E -> Lucent
- EW_Cloudy -> Cirrus
- EW_Cloudy_B -> Stratus
- EW_Cloudy_C -> Veil
- EW_Cloudy_D -> Empyrean
- EW_Cloudy_less_sun -> Gloam
- EW_Rainy -> Nimbus
- EW_Stormy -> Tempest
- EW_Storm_Blowing_Grass -> Gale
- EW_Snow_Storm -> Boreas
- EW_Fog_heavy -> Pall
- EW_Fog_VT -> Brume
- EW_Fog_FF -> Shroud
- EW_Fog_RE -> Murk
- EW_Palace_Fog -> Miasma
- EW_Helgen_Attack -> Inferno
- EW_Blackreach -> Abyssal
- EW_Soulcairn -> Requiem
- EW_Falmer_Valley -> Rime
- EW_Sovngarde -> Elysium
- EW_Sovngarde_Dark -> Nadir
- EW_BloatedM_Grotto -> Verdance
- EW_Solstheim_A to E -> Ashfall, Smolder, Tephra, Cinder, Obsidian
- EW_Apocrypha -> Atrament
- EW_Kathspire, EW_Eclipse -> Kathspire, Eclipse
- EW_UneditedWIP -> Unedited
- EW_Dungeons removed (replaced by the new interior system)

Special locations now use realistic weather types:
- Sovngarde, Bloated Man's Grotto -> clear
- Soul Cairn, dark Sovngarde, Eclipse, Helgen attack, Solstheim ash -> overcast
- Solstheim ash storm -> thunderstorm
- Blackreach, Apocrypha -> underground

==================================================
LIGHTING BALANCE
==================================================
Applied from dawn to dusk. Full effect in clear weather, about 70% in cloudy, 35% in overcast/rain/fog/snow, 25% in storms. Nights, interiors and underground weathers unchanged.

- Ambient light reduced (clear day: 1.49 -> 1.01): stronger sun/shade contrast, more depth.
- Shadow fill reduced (AmbientMinLevel, clear day: 0.62 -> 0.44): deeper yet readable shadows.
- Ambient desaturation lowered (0.49 -> 0.28): shadows keep the slight blue tint of skylight.
- Sun disc slightly stronger (0.53 -> 0.64).
- Specular reflections reduced (2.5 -> 1.67): no more plastic or wet look on dry stone and skin. Reduced less in rain, storms and fog.
- Base values in enbseries.ini now match a natural clear weather: unrecognized weathers no longer fall back to a cyan sky.

==================================================
INTERIOR SYSTEM (NEW)
==================================================
16 interior atmospheres, assigned per location through _locationweather.ini:

- Tavern (19 locations): dimmer windows, stronger firelight, light smoke. Warm and cozy.
- House (144): Everwild base, cleaner air.
- Shop (19): slightly brighter, clear air.
- Castle (24): +20% window light, more light shafts and haze. Great halls.
- Fort (42): dimmer, slightly hazier.
- Temple (19): brighter windows, incense haze.
- Library (6): bright and clear (College of Winterhold, Bards College).
- Forge (12): stronger firelight, light smoke (smithies, mills, sawmill, meaderies).
- Cave (52): almost no outside light, lower ambient, more haze.
- Ice Cave (21): light filtering through ice, slightly cool neutral tone.
- Prison (8): dark and damp.
- Crypt (19): darkest profile, more haze, duller colors.
- Nordic Ruin (40): close to Crypt, slightly brighter (draugr barrows).
- Dwemer Ruin (19): steam haze, slightly stronger lights (Blackreach, Mzulft...).
- Mine (23): dusty air, stronger lanterns.
- Arcane (11): neutral and dim (Apocrypha, Soul Cairn, Tel Mithryn, Azura's Star).

- 478 locations assigned, identified from Lux interior cells. Compatible with both Lux and Lux CS.
- Mixed-use locations (Thalmor Embassy, Pinewatch, Mor Khazgur, Windhelm smithy/residence) are intentionally left out to avoid wrong assignments.
- Shadow fill never drops below 90% of the base, to avoid crushed blacks.
- Requires the standard load order: Skyrim, Update, Dawnguard, HearthFires, Dragonborn.

==================================================
COLOR & TONEMAPPING (enbeffect.fx)
==================================================
- Contrast and saturation now computed on luminance: no more hue shifts (foliage turning yellow, skin turning orange).
- Color correction rebalanced with identical midtones:
  - Gamma 1.0 -> 1.08
  - Out black 0.04 -> 0.054
  - Out white 0.70 -> 0.73
  - Brightness 1.3 -> 1.25
  - Result: whites now reach pure white (previously capped at ~0.92), deep shadows no longer clipped.
- Overall saturation lowered to a natural level (CC saturation 1.25 -> 1.0).
- Shadow desaturation 0.62 -> 0.5.
- Blue tint in highlights halved.
- Dawn/dusk saturation 1.22 -> 1.12, sunrise/sunset 1.15 -> 1.10.
- Brightness and tonemapping curves reworked per time of day.

==================================================
POST-PROCESS (enbeffectpostpass.fx)
==================================================
- New dithering: removes 8-bit banding in skies, fog and dark gradients.
- Saturation 0.85 -> 0.95.
- Contrast 1.07 -> 1.05.
- Shadows -0.05 -> -0.03: less crushed.
- Highlights -0.05 -> 0.
- Midtones 1.0 -> 1.035.

==================================================
EYE ADAPTATION (enbadaptation.fx)
==================================================
- Adaptation now smoothed in perceptual (log) space.
- Eyes adjust to darkness more slowly than to light, like real eyes. New setting: "Adapt Dark Speed".
- Day, night and interior adaptation ranges reworked.

==================================================
DEPTH OF FIELD
==================================================
- Near blur 0.35 -> 0.12: hands and weapons stay sharp in first person. Subtle distance blur kept.

==================================================
QUALITY & EFFECTS (enbseries.ini)
==================================================
- Procedural sun enabled.
- Bloom and volumetric fog now driven by each weather.
- SSIL indirect lighting:
  - resolution scale 1.0 -> 0.75 with denoiser
  - IL amount 3.2 -> 3.0
  - AO tuned (amount 3.1 -> 1.0, intensity 0.5 -> 0.7)
- Detailed shadows quality 0 -> 1. Subsurface scattering quality 0 -> 1.
- Complex fire/particle light shadows quality 2 -> 1 (performance).
- Water toned down for realism:
  - reflections 0.7 -> 0.55
  - caustics 0.85 -> 0.35
  - dispersion 0.5 -> 0.2
  - sun scattering 8.0 -> 6.8
  - Fresnel min 0.45 -> 0.25
- ENB object reflections disabled (amount 0).
- ENB rain disabled: vanilla rain textures are used.
- Unused palette texture disabled.

==================================================
TECHNICAL
==================================================
- Cleanup of all configuration files (unused, duplicated or corrupted entries removed).
- Weather index file documented with every weather name and ID.
