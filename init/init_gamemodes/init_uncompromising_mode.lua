local require = GLOBAL.require

--	[ 	Import Prefabs, Assets, Widgets	]	--
	modimport("init/init_assets")
	modimport("init/init_widgets")
	modimport("init/minimap_icons")
	
	--  [   Import customized shard RPC module ]    --
    modimport("init/init_uncompromisingshardrpc")
	
	
	--  [   Mock Dragonfly Spit Bait ]    --
	modimport("init/init_weather/init_dragonfly_bait")
	
	
--	[ 	Import Names and Descriptions	]	--
	modimport("init/init_names")
	modimport("init/init_descriptions/generic")
	modimport("init/init_descriptions/willow")
	modimport("init/init_descriptions/wolfgang")
	modimport("init/init_descriptions/wendy")
	modimport("init/init_descriptions/wx78")
	modimport("init/init_descriptions/wickerbottom")
	modimport("init/init_descriptions/woodie")
	modimport("init/init_descriptions/wes")
	modimport("init/init_descriptions/waxwell")
	modimport("init/init_descriptions/wathgrithr")
	modimport("init/init_descriptions/webber")
	modimport("init/init_descriptions/winona")
	modimport("init/init_descriptions/wortox")
	modimport("init/init_descriptions/wormwood")
	modimport("init/init_descriptions/warly")
	modimport("init/init_descriptions/wurt")
	
--	[ 		Number Tuning and PostInits		]	--

	modimport("init/init_tuning")
	modimport("init/init_postinit")
	modimport("init/init_strings")
	modimport("init/init_actions")
	modimport("init/init_containers")
	
--	[ 	Console Commands for tests !	]	--
	
	require("uncompromisingcommands")
	
--	[ 				Gamemodes			]	--
	
	local GAMEMODE_UNCOMPROMISING = 0;
	local GAMEMODE_CUSTOM_SETTINGS = 2;

	--if GLOBAL.GetGameModeProperty("hardcore") then
		--modimport("init/init_gamemodes/init_hardcore") --TODO: Fix hardcore game mode. For now, it is a mod config below.
	--end
	
--	[ 				Features			]	--
	
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS) then
		GLOBAL.TUNING.DSTU.MONSTER_HOUNDS_PER_WAVE_INCREASE = GetModConfigData("hound_increase")
		--GLOBAL.TUNING.DSTU.WEATHERHAZARD_START_DATE = GetModConfigData("weather start date")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_monsters") == true) then
		modimport("init/init_creatures/init_treebuffs")
		modimport("init/init_creatures/init_harder_monsters")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("rare_food") == true) then
		modimport("init/init_food/init_food_changes")
		modimport("init/init_food/init_bird_changes")
		modimport("init/init_food/init_rare_foods")
		modimport("init/init_food/init_disableregrowth")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_recipes") == true) then
		modimport("init/init_recipes")
		modimport("init/init_food/init_crockpot")
		modimport("init/init_food/monsterfoods")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING and GetModConfigData("rat_raids") == true or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("rat_raids") == true) then
		modimport("init/init_ratraid")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_bosses") == true) then
		modimport("init/init_creatures/init_knockback")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_shadows") == true) then
		modimport("init/init_creatures/init_harder_shadows")
		modimport("postinit/prefabs/shadowcreature")
		modimport("postinit/stategraphs/SGshadowcreature")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_weather") == true) then
		modimport("init/init_weather/init_acidmushroom_networking")
		modimport("init/init_weather/init_acid_rain_effects")
		modimport("init/init_weather/init_acid_rain_disease")
		modimport("init/init_weather/init_overworld_toadstool")
		modimport("init/init_weather/init_harder_weather")
		--modimport("init/init_weather/init_snowstorm")
		modimport("init/init_weather/init_snowstorm_structures")
	end
	
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING and GetModConfigData("snowstorms") == true or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("snowstorms") == true) then
		modimport("init/init_weather/init_snowstorm")
	end
	
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING and GetModConfigData("hayfever") == true or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("hayfever") == true) then
		modimport("init/init_weather/init_hayfever")
	end
	
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("durability") == true) then
		modimport("init/init_durability")
	end

	--TODO: Add settings for each individual character after we add many changes
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("character_changes")) then
		modimport("init/init_character_changes/generic")
		modimport("init/init_character_changes/willow")
		modimport("init/init_character_changes/wolfgang")
		modimport("init/init_character_changes/wendy")
		modimport("init/init_character_changes/wx78")
		modimport("init/init_character_changes/wickerbottom")
		modimport("init/init_character_changes/woodie")
		modimport("init/init_character_changes/wes")
		modimport("init/init_character_changes/waxwell")
		modimport("init/init_character_changes/wathgrithr")
		modimport("init/init_character_changes/webber")
		modimport("init/init_character_changes/winona")
		modimport("init/init_character_changes/wortox")
		modimport("init/init_character_changes/wormwood")
		modimport("init/init_character_changes/warly")
	end

	if GetModConfigData("hardcore") then
		modimport("init/init_gamemodes/init_hardcore")
	end

