# EVERWILD ENB 4.0 - FINAL RC 1
Full changelog since 3.3

==================================================
WEATHERS - COMPLETE OVERHAUL
==================================================
Direction: 100% natural. No more "fantasy" skies, colored fog or stylized lighting.

- Every weather rebuilt on 9 real-world bases taken from the most refined Everwild weathers:
  Clear, Cloudy, Overcast, Rain, Thunderstorm, Snow, Blizzard, Fog, Underground.
  Each weather keeps a subtle variation of its own so they all stay consistent with each other.
- Color filters limited to physically plausible values:
  - Sky gradients: saturation limited
  - Sun and moon: saturation strongly limited
  - Lighting, fog, clouds: saturation very strongly limited (even more for fog, snow and underground)
  - Green and magenta casts removed, interiors almost neutral
- Natural sky: blue during the day, pale horizon, warm orange sun at sunrise/sunset, slightly cool nights.
- Auroras toned down. No stars or auroras underground.
- Fixed the Apocrypha weather, which was missing a large part of its parameters.

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
Applied from dawn to dusk. Full effect in clear weather, reduced in cloudy weather, light in overcast/rain/fog/snow, very light in storms. Nights, interiors and underground weathers unchanged.

- Ambient light decreased: stronger sun/shade contrast, more depth.
- Shadow fill decreased: deeper yet readable shadows.
- Ambient desaturation decreased: shadows keep the slight blue tint of skylight.
- Sun disc slightly increased.
- Specular reflections decreased: no more plastic or wet look on dry stone and skin. Decreased less in rain, storms and fog.
- Base values in enbseries.ini now match a natural clear weather: unrecognized weathers no longer fall back to a cyan sky.

==================================================
INTERIOR SYSTEM (NEW)
==================================================
16 interior atmospheres, assigned per location through _locationweather.ini:

- Tavern (19 locations): dimmer windows, stronger firelight, light smoke. Warm and cozy.
- House (144): Everwild base, cleaner air.
- Shop (19): slightly brighter, clear air.
- Castle (24): more window light, more light shafts and haze. Great halls.
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
- Shadow fill always kept close to the base, to avoid crushed blacks.
- Requires the standard load order: Skyrim, Update, Dawnguard, HearthFires, Dragonborn.

==================================================
COLOR & TONEMAPPING (enbeffect.fx)
==================================================
- Contrast and saturation now computed on luminance: no more hue shifts (foliage turning yellow, skin turning orange).
- Color correction rebalanced while keeping the same midtones:
  - Gamma slightly increased
  - Black level slightly increased
  - White level increased
  - Brightness slightly decreased
  - Result: whites now reach pure white (no more milky highlights), deep shadows no longer clipped.
- Overall saturation decreased to a natural level.
- Shadow desaturation decreased.
- Blue tint in highlights halved.
- Dawn, dusk, sunrise and sunset saturation slightly decreased.
- Brightness and tonemapping curves reworked per time of day.

==================================================
POST-PROCESS (enbeffectpostpass.fx)
==================================================
- New dithering: removes banding in skies, fog and dark gradients.
- Saturation increased.
- Contrast slightly decreased.
- Shadows less crushed.
- Highlights no longer darkened.
- Midtones slightly brighter.

==================================================
EYE ADAPTATION (enbadaptation.fx)
==================================================
- Adaptation now smoothed in perceptual space.
- Eyes adjust to darkness more slowly than to light, like real eyes. New setting: "Adapt Dark Speed".
- Day, night and interior adaptation ranges reworked.

==================================================
DEPTH OF FIELD
==================================================
- Near blur strongly decreased: hands and weapons stay sharp in first person. Subtle distance blur kept.

==================================================
QUALITY & EFFECTS (enbseries.ini)
==================================================
- Procedural sun enabled.
- Bloom and volumetric fog now driven by each weather.
- SSIL indirect lighting:
  - resolution decreased, with denoiser
  - indirect light slightly decreased
  - ambient occlusion reworked
- Detailed shadows quality increased. Subsurface scattering quality increased.
- Complex fire/particle light shadows quality decreased (performance).
- Water toned down for realism:
  - reflections decreased
  - caustics strongly decreased
  - dispersion decreased
  - sun scattering slightly decreased
  - Fresnel decreased
- ENB object reflections disabled.
- ENB rain disabled: vanilla rain textures are used.
- Unused palette texture disabled.

==================================================
TECHNICAL
==================================================
- Cleanup of all configuration files (unused, duplicated or corrupted entries removed).
- Interior category names kept in _locationweather.ini for easy editing.
