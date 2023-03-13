local SLE, T, E, L, V, P, G = unpack(select(2, ...))

local UF_Auras = {
	enable = false,
	threshold = 4,
}

local sharedIndicatorOptions = {
	enable = false,
	keepSizeRatio = true,
	size = 36,
	height = 36,
	anchorPoint = 'CENTER',
	xOffset = 0,
	yOffset = 0,
	texture = 'SKULL',
	custom = '',
}

P["sle"] = {
	--Actionbar
	actionbar = {
		vehicle = {
			enable = false,
			mouseover = false,
			clickThrough = false,
			keepSizeRatio = true,
			buttonsPerRow = 7,
			point = 'TOPLEFT',
			backdrop = true,
			heightMult = 1,
			widthMult = 1,
			backdropSpacing = 2,
			buttonSize = 40,
			buttonHeight = 40,
			buttonSpacing = 2,
			alpha = 1,
			showGrid = true,
			hotkeyColor = { r = 1, g = 1, b = 1 },
			hotkeyFont = 'Homespun',
			hotkeyFontOutline = 'MONOCHROMEOUTLINE',
			hotkeyFontSize = 12,
			hotkeytext = true,
			hotkeyTextPosition = 'TOPRIGHT',
			hotkeyTextXOffset = 0,
			hotkeyTextYOffset = -3,
			useHotkeyColor = false,
			frameStrata = 'LOW',
			frameLevel = 1,
			dragonRiding = true,
		},
	},
	--Armory
	["armory"] = {
		["character"] = {
			["enable"] = false,
			["showWarning"] = true,
			["ilvl"] = {
				["colorType"] = "NONE",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["font"] = "PT Sans Narrow",
				["fontSize"] = 12,
				["fontStyle"] = "OUTLINE",
			},
			["enchant"] = {
				["xOffset"] = 0,
				["yOffset"] = 0,
				["font"] = "PT Sans Narrow",
				["fontSize"] = 12,
				["fontStyle"] = "OUTLINE",
				showReal = true,
			},
			["gem"] = {
				["xOffset"] = 0,
				["yOffset"] = 0,
				["size"] = 10,
			},
			["gradient"] = {
				["enable"] = true,
				["color"] = { .41, .83, 1 },
				["quality"] = false,
				["setArmor"] = false,
				["setArmorColor"] = { 0, 1, 0 },
				["warningColor"] = { 1, 0.2, 0.2 },
				["warningBarColor"] = { 1, 0.2, 0.2 },
			},
			["transmog"] = {
				["enableGlow"] = false,
				["enableArrow"] = true,
				["glowNumber"] = 4,
				["glowOffset"] = 1,
			},
			["durability"] = {
				["display"] = "Always", -- Always, MouseoverOnly, DamagedOnly, Hide
				["font"] = "PT Sans Narrow",
				["fontSize"] = 10,
				["fontStyle"] = "OUTLINE",
				["xOffset"] = 0,
				["yOffset"] = 0,
			},
			["background"] = {
				["selectedBG"] = "Space",
				["customTexture"] = "",
				["overlay"] = true,
			},
		},
		["inspect"] = {
			["enable"] = false,
			["showWarning"] = true,
			["ilvl"] = {
				["colorType"] = "NONE",
				["xOffset"] = 0,
				["yOffset"] = 0,
				["font"] = "PT Sans Narrow",
				["fontSize"] = 12,
				["fontStyle"] = "OUTLINE",
			},
			["enchant"] = {
				["xOffset"] = 0,
				["yOffset"] = 0,
				["font"] = "PT Sans Narrow",
				["fontSize"] = 12,
				["fontStyle"] = "OUTLINE",
				showReal = true,
			},
			["gem"] = {
				["xOffset"] = 0,
				["yOffset"] = 0,
				["size"] = 10,
			},
			["gradient"] = {
				["enable"] = true,
				["color"] = { .41, .83, 1 },
				["quality"] = false,
				["setArmor"] = false,
				["setArmorColor"] = { 0, 1, 0 },
				["warningColor"] = { 1, 0.2, 0.2 },
				["warningBarColor"] = { 1, 0.2, 0.2 },
			},
			["transmog"] = {
				["enableGlow"] = false,
				["enableArrow"] = true,
				["glowNumber"] = 4,
				["glowOffset"] = 1,
			},
			["background"] = {
				["selectedBG"] = "Space",
				["customTexture"] = "",
				["overlay"] = true,
			},
		},
		["stats"] = {
			["enable"] = true,
			["decimals"] = true,
			["itemLevel"] = {
				["font"] = "PT Sans Narrow",
				["size"] = 12,
				["outline"] = "",
			},
			["IlvlFull"] = true,
			["IlvlColor"] = false,
			["AverageColor"] = {r = 0, g = 1, b = .59},
			["OnlyPrimary"] = true,
			["statFonts"] = {
				["font"] = "PT Sans Narrow",
				["size"] = 12,
				["outline"] = "",
			},
			["catFonts"] = {
				["font"] = "PT Sans Narrow",
				["size"] = 12,
				["outline"] = "",
			},
			["List"] = {
				--* Attributes
				HEALTH = false,
				POWER = false,
				ALTERNATEMANA = false,
				MOVESPEED = true,
				--* Attack
				ATTACK_DAMAGE = true,
				ATTACK_AP = false,
				ATTACK_ATTACKSPEED = false,
				SPELLPOWER = true,
				MANAREGEN = false,
				ENERGY_REGEN = false,
				RUNE_REGEN = false,
				FOCUS_REGEN = false,
				--* Enhancements
				CRITCHANCE = true,
				HASTE = true,
				MASTERY = true,
				VERSATILITY = true,
				LIFESTEAL = true,
				--* Defense
				ARMOR = true,
				AVOIDANCE = true,
				DODGE = true,
				PARRY = true,
				BLOCK = true,
			},
		},
		enchantString = {
			enable = true,
			-- ["fullText"] = false,
			replacement = true,
			strict = true,
		},
	},
	--Backgrounds
	["backgrounds"] = {
		["bg1"] = {
			["enabled"] = false,
			["trans"] = false,
			["texture"] = "",
			["width"] = (E.eyefinity or E.ultrawide or E.physicalWidth)/4 + 32,
			["height"] = E.physicalHeight/6 - 13,
			["xoffset"] = 0,
			["yoffset"] = 0,
			["pethide"] = true,
			["template"] = "Default",
			["alpha"] = 1,
			["clickthrough"] = true,
			["visibility"] = "show",
		},
		["bg2"] = {
			["enabled"] = false,
			["trans"] = false,
			["texture"] = "",
			["width"] = (E.eyefinity or E.ultrawide or E.physicalWidth)/10 - 4,
			["height"] = E.physicalHeight/5 + 11,
			["xoffset"] = 0,
			["yoffset"] = 0,
			["pethide"] = true,
			["template"] = "Default",
			["alpha"] = 1,
			["clickthrough"] = false,
			["visibility"] = "show",
		},
		["bg3"] = {
			["enabled"] = false,
			["trans"] = false,
			["texture"] = "",
			["width"] = (E.eyefinity or E.ultrawide or E.physicalWidth)/10 - 4,
			["height"] = E.physicalHeight/5 + 11,
			["xoffset"] = 0,
			["yoffset"] = 0,
			["pethide"] = true,
			["template"] = "Default",
			["alpha"] = 1,
			["clickthrough"] = false,
			["visibility"] = "show",
		},
		["bg4"] = {
			["enabled"] = false,
			["trans"] = false,
			["texture"] = "",
			["width"] = (E.eyefinity or E.ultrawide or E.physicalWidth)/4 + 32,
			["height"] = E.physicalHeight/20 + 5,
			["xoffset"] = 0,
			["yoffset"] = 0,
			["pethide"] = true,
			["template"] = "Default",
			["alpha"] = 1,
			["clickthrough"] = true,
			["visibility"] = "show",
		},
	},
	bags = {
		equipmentmanager = {
			enable = false,
			size = 14,
			point = 'TOPRIGHT',
			xOffset = -1,
			yOffset = -1,
			icon = 'EQUIPLOCK',
			customTexture = '',
			color = {
				r = 1,
				g = 0.82,
				b = 0,
				a = 1,
			}
		},
	},
	--Blizzard
	["blizzard"] = {
		["rumouseover"] = false,
		["errorframe"] = {
			["height"] = 60,
			["width"] = 512,
		},
		["vehicleSeatScale"] = 1,
	},
	--Chat
	["chat"] = {
		["guildmaster"] = false,
		["dpsSpam"] = false,
		["textureAlpha"] = {
			["enable"] = false,
			["alpha"] = 0.5,
		},
		["combathide"] = "NONE",
		["justify"] = {
			["frame1"] = "LEFT",
			["frame2"] = "LEFT",
			["frame3"] = "LEFT",
			["frame4"] = "LEFT",
			["frame5"] = "LEFT",
			["frame6"] = "LEFT",
			["frame7"] = "LEFT",
			["frame8"] = "LEFT",
			["frame9"] = "LEFT",
			["frame10"] = "LEFT",
		},
		["tab"] = {
			["resize"] = "Blizzard",
			["customWidth"] = 50,
		},
		["invite"] = {
			["altInv"] = false,
			["invLinks"] = false,
			["keys"] = "invite",
			["color"] = {r = 1, g = 1, b = 0},
		},
	},
	--Databars
	["databars"] = {
		experience = {
			longtext = false,
			chatfilter = {
				enable = false,
				iconsize = 12,
				style = "STYLE1",
			},
		},
		reputation = {
			chatfilter = {
				enable = false,
				chatframe = "AUTO",
				iconsize = 12,
				style = {
					increase = 'STYLE1',
					decrease = 'STYLE1',
				},
			},
			ignoreGuild = true,
			longtext = false,
		},
		["honor"] = {
			["longtext"] = false,
			["chatfilter"] = {
				["enable"] = false,
				["iconsize"] = 12,
				["style"] = "STYLE1",
				["awardStyle"] = "STYLE1",
			},
		},
		["azerite"] = {
			["longtext"] = false,
			["chatfilter"] = {
				["enable"] = false,
				["iconsize"] = 12,
				["style"] = "STYLE1",
			},
		},
	},
	--SLE Datatexts
	["dt"] = {
		friends = {
			--*  General Settings
			panelStyle = "DEFAULT",
			tooltipAutohide = 0.2,
			hide_hintline = false,
			combat = false,
			hide_titleline = false,
			--*  Hide By Clients
			hideWoW = false,		--WoW Retail
			hideWoWClassic = false,	--WoW Classic
			hideApp = false,		--Launcher
			hideBSAp = false,		--Mobile
			hideD3 = false,			--Diablo 3
			hideWTCG = false,		--Hearthstone
			hideHero = false,		--Heros of the Storm
			hidePro = false,		--Overwatch
			hideS1 = false,			--Starcraft
			hideS2 = false,			--Starcraft 2
			hideVIPR = false,		--COD: Black Ops 4
			hideODIN = false,		--COD: Modern Warfare
			hideLAZR = false,		--COD: Modern Warfare 2
			--*  Hide By Status
			hideAFK = false,
			hideDND = false,
		},
		["guild"] = {
			["combat"] = false,
			["hide_gmotd"] = false,
			["hideGuild"] = false,
			["hide_guildname"] = false,
			["hide_hintline"] = false,
			["hide_titleline"] = false,
			["sortGuild"] = 'TOONNAME',
			["tooltipAutohide"] = 0.2,
			["totals"] = false,
			["textStyle"] = "Default",
			["onoteColor"] = { r = 0, g = 1, b = 0 },
			["noteColor"] = { r = 1, g = 1, b = 0 },
		},
		["currency"] = {
			["Archaeology"] = true,
			["Jewelcrafting"] = true,
			["PvP"] = true,
			["Raid"] = true,
			["Cooking"] = true,
			["Miscellaneous"] = true,
			["Zero"] = true,
			["Icons"] = true,
			["Faction"] = true,
			["Unused"] = true,
			["gold"] = {
				["direction"] = "normal",
				["method"] = "name",
				["throttle"] = {
					["mode"] = "NONE",
					["numChars"] = 5,
					["goldAmount"] = 5000,
				},
			},
			["cur"] = {
				["direction"] = "normal",
				["method"] = "name",
			},
		},
		["regen"] = {
			["short"] = false,
		},
	},
	--Legacy
	["legacy"] = {
		["garrison"] = {
			["autoOrder"] = {
				["enable"] = false,
				["autoWar"] = false,
				["autoTrade"] = false,
				["autoShip"] = false,
			},
			["toolbar"] = {
				["buttonsize"] = 30,
				["active"] = true,
				["enable"] = false,
			},
		},
		["orderhall"] = {
			["autoOrder"] = {
				["enable"] = false,
				["autoEquip"] = false,
			},
		},
		["warwampaign"] = {
			["autoOrder"] = {
				["enable"] = false,
			},
		}
	},
	--LFR options
	["lfr"] = {
		["enabled"] = false,
		["cata"] = {
			["ds"] = false,
		},
		["mop"] = {
			["mv"] = false,
			["hof"] = false,
			["toes"] = false,
			["tot"] = false,
			["soo"] = false,
		},
		["wod"] = {
			["hm"] = false,
			["brf"] = false,
			["hfc"] = false,
		},
		["legion"] = {
			["nightmare"] = false,
			["trial"] = false,
			["palace"] = false,
			["tomb"] = false,
			["antorus"] = false,
		},
		["bfa"] = {
			["uldir"] = false,
			["daz"] = false,
			["sc"] = false,
			["ep"] = false,
			["nzoth"] = false,
		},
	},
	--Loot
	["loot"] = {
		["enable"] = false,
		["autoroll"] = {
			["enable"] = true,
			["autoconfirm"] = false,
			["autode"] = false,
			["autogreed"] = false,
			["autoqlty"] = 2,
			["bylevel"] = false,
			["level"] = 1,
		},
		["announcer"] = {
			["auto"] = true,
			["channel"] = "RAID",
			["enable"] = false,
			["override"] = '5',
			["quality"] = "EPIC",
		},
		["history"] = {
			["alpha"] = 1,
			["autohide"] = false,
		},
		["looticons"] = {
			["enable"] = false,
			["position"] = "LEFT",
			["size"] = 12,
			["channels"] = {
				["CHAT_MSG_BN_WHISPER"] = false,
				["CHAT_MSG_BN_WHISPER_INFORM"] = false,
				["CHAT_MSG_BN_CONVERSATION"] = false,
				["CHAT_MSG_CHANNEL"] = false,
				["CHAT_MSG_EMOTE"] = false,
				["CHAT_MSG_GUILD"] = false,
				["CHAT_MSG_INSTANCE_CHAT"] = false,
				["CHAT_MSG_INSTANCE_CHAT_LEADER"] = false,
				["CHAT_MSG_LOOT"] = true,
				["CHAT_MSG_OFFICER"] = false,
				["CHAT_MSG_PARTY"] = false,
				["CHAT_MSG_PARTY_LEADER"] = false,
				["CHAT_MSG_RAID"] = false,
				["CHAT_MSG_RAID_LEADER"] = false,
				["CHAT_MSG_RAID_WARNING"] = false,
				["CHAT_MSG_SAY"] = false,
				["CHAT_MSG_SYSTEM"] = true,
				["CHAT_MSG_WHISPER"] = false,
				["CHAT_MSG_WHISPER_INFORM"] = false,
				["CHAT_MSG_YELL"] = false,
			},
		},
	},
	--Media
	media = {
		fonts = {
			zone = {
				font = 'PT Sans Narrow',
				fontSize = 32,
				fontOutline = 'NONE',
			},
			subzone = {
				font = 'PT Sans Narrow',
				fontSize = 25,
				fontOutline = 'OUTLINE',
				offset = 0,
			},
			pvp = {
				font = 'PT Sans Narrow',
				fontSize = 22,
				fontOutline = 'OUTLINE',
			},
			mail = {
				font = 'PT Sans Narrow',
				fontSize = 12,
				fontOutline = 'NONE',
			},
			gossip = {
				font = 'PT Sans Narrow',
				fontSize = 12,
				fontOutline = 'NONE', -- Should always be none
			},
			objective = {
				font = 'PT Sans Narrow',
				fontSize = 12,
				fontOutline = 'OUTLINE',
			},
			objectiveHeader = {
				font = 'PT Sans Narrow',
				fontSize = 12,
				fontOutline = 'NONE',
			},
			questFontSuperHuge = {
				font = 'PT Sans Narrow',
				fontSize = 24,
				fontOutline = 'NONE',
			},
			scenarioStage = {
				HeaderText = {
					font = 'PT Sans Narrow',
					fontSize = 16,
					fontOutline = 'OUTLINE',
				},
				TimerText = {
					font = 'PT Sans Narrow',
					fontSize = 22,
					fontOutline = 'OUTLINE',
				},
			},
		},
	},
	--Minimap Module
	["minimap"] = {
		["combat"] = false,
		["coords"] = {
			["enable"] = false,
			mouseover = false,
			xOffset = 0,
			yOffset = 0,
			["format"] = "%.0f",
			["font"] = "PT Sans Narrow",
			["fontSize"] = 12,
			["fontOutline"] = "OUTLINE",
			["throttle"] = 0.2,
			["color"] = {r = 1,g = 1,b = 1},
		},
		mail = {
			hideicon = false,
		},
		["instance"] = {
			["enable"] = false,
			["xoffset"] = -10,
			["yoffset"] = 0,
			["onlyNumber"] = false,
			["colors"] = {
				["lfr"] = {r = 0.32,g = 0.91,b = 0.25},
				["normal"] = {r = 0.09,g = 0.51,b = 0.82},
				["heroic"] = {r = 0.82,g = 0.42,b = 0.16},
				["challenge"] = {r = 0.9,g = 0.89,b = 0.27},
				["mythic"] = {r = 0.9,g = 0.14,b = 0.15},
				["time"] = {r = 0.41,g = 0.80,b = 0.94}
			},
			["font"] = "PT Sans Narrow",
			["fontSize"] = 12,
			["fontOutline"] = "OUTLINE",
		},
		["locPanel"] = {
			["enable"] = false,
			["autowidth"] = false,
			["width"] = 200,
			["height"] = 21,
			["linkcoords"] = true,
			["template"] = "Transparent",
			["font"] = "PT Sans Narrow",
			["fontSize"] = 12,
			["fontOutline"] = "OUTLINE",
			["throttle"] = 0.2,
			["format"] = "%.0f",
			["zoneText"] = true,
			["colorType"] = "REACTION",
			["colorType_Coords"] = "DEFAULT",
			["customColor"] = {r = 1, g = 1, b = 1 },
			["customColor_Coords"] = {r = 1, g = 1, b = 1 },
			["combathide"] = false,
			["orderhallhide"] = false,
			["portals"] = {
				["enable"] = true,
				["HSplace"] = true,
				["customWidth"] = false,
				["customWidthValue"] = 200,
				["justify"] = "LEFT",
				["cdFormat"] = "DEFAULT",
				["ignoreMissingInfo"] = false,
				["showHearthstones"] = true,
				["hsPrio"] = "54452,64488,93672,142542,162973,163045,165669,165670,165802,166746,166747,168907,172179,182773,183716,180290,184353,188952,190237",
				["showToys"] = true,
				["showSpells"] = true,
				["showEngineer"] = true,
			},
		},
	},
	--Misc
	["misc"] = {
		["viewport"] = {
			["left"] = 0,
			["right"] = 0,
			["top"] = 0,
			["bottom"] = 0,
		},
	},
	--Nameplate Options
	["nameplates"] = {
		["threat"] = {
			["enable"] = false,
			["font"] = "PT Sans Narrow",
			["fontOutline"] = "OUTLINE",
			["size"] = 12,
			["xoffset"] = 1,
			["yoffset"] = 2,
		},
		["targetcount"] = {
			["enable"] = false,
			["font"] = "PT Sans Narrow",
			["fontOutline"] = "OUTLINE",
			["size"] = 12,
			["xoffset"] = 1,
			["yoffset"] = 2,
		},
		["visibleRange"] = 60,
	},
	--Quests
	["quests"] = {
		["visibility"] = {
			["enable"] = false,
			["bg"] = "COLLAPSED",
			["arena"] = "COLLAPSED",
			["dungeon"] = "FULL",
			["raid"] = "COLLAPSED",
			["scenario"] = "FULL",
			["rested"] = "FULL",
			["garrison"] = "FULL",
			["orderhall"] = "FULL",
			["combat"] = "NONE",
		},
		["autoReward"] = false,
	},
	--PvP
	["pvp"] = {
		["autorelease"] = false,
		["rebirth"] = true,
		["duels"] = {
			["regular"] = false,
			["pet"] = false,
			["announce"] = false,
		},
	},
	--Raid Manager
	["raidmanager"] = {
		["level"] = true,
		["roles"] = false,
	},
	--Raid Markers
	["raidmarkers"] = {
		["enable"] = true,
		["visibility"] = 'DEFAULT',
		["customVisibility"] = "[noexists, nogroup] hide; show",
		["backdrop"] = false,
		["buttonSize"] = 22,
		["spacing"] = 2,
		["orientation"] = 'HORIZONTAL',
		["modifier"] = 'shift-',
		["reverse"] = false,
		["mouseover"] = false,
		["notooltip"] = false,
	},
	--AFK
	afk = {
		enable = false,
		customGraphics = {},
		defaultGraphics = {
			classCrest = {
				enable = true,
				styleOptions = 'sltheme',
				width = 140,
				height = 140,
				xOffset = 0,
				yOffset = 0,
				inversePoint = false,
				anchorPoint = 'BOTTOMRIGHT',
				attachTo = 'SL_BottomPanel',
			},
			exPack = {
				enable = true,
				expansion = 'df',
				styleOptions = 'sltheme',
				width = 450,
				height = 225,
				xOffset = 0,
				yOffset = -20,
				inversePoint = false,
				anchorPoint = 'TOP',
				attachTo = 'SL_TopPanel',
			},
			factionCrest = {
				enable = true,
				styleOptions = 'sltheme',
				width = 128,
				height = 128,
				xOffset = -floor(GetScreenWidth()/6),
				yOffset = -71,
				inversePoint = false,
				anchorPoint = 'TOP',
				attachTo = 'SL_TopPanel',
			},
			factionLogo = {
				enable = true,
				styleOptions = 'sltheme',
				width = 140,
				height = 140,
				xOffset = 0,
				yOffset = 0,
				inversePoint = false,
				anchorPoint = 'BOTTOMLEFT',
				attachTo = 'SL_BottomPanel',
			},
			raceCrest = {
				enable = true,
				styleOptions = 'sltheme',
				width = 128,
				height = 128,
				xOffset = floor(GetScreenWidth()/6),
				yOffset = -71,
				inversePoint = false,
				anchorPoint = 'TOP',
				attachTo = 'SL_TopPanel',
			},
			slLogo = {
				enable = true,
				styleOptions = 'original',
				width = 270,
				height = 135,
				xOffset = floor(GetScreenWidth()/10),
				yOffset = 70,
				inversePoint = false,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_BottomPanel',
			},
			benikuiLogo = {
				enable = false,
				styleOptions = 'original',
				width = 275,
				height = 138,
				xOffset = floor(GetScreenWidth()/4),
				yOffset = 70,
				inversePoint = false,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_BottomPanel',
			},
			elvuiLogo = {
				enable = true,
				styleOptions = 'sltheme',
				width = 275,
				height = 118,
				xOffset = -floor(GetScreenWidth()/10),
				yOffset = 78,
				inversePoint = false,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_BottomPanel',
			},
			merauiLogo = {
				enable = false,
				styleOptions = 'sltheme',
				width = 275,
				height = 138,
				xOffset = -GetScreenWidth()/4,
				yOffset = 70,
				inversePoint = false,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_BottomPanel',
			},
		},
		defaultTexts = {
			SL_AFKMessage = {
				enable = true,
				font = "PT Sans Narrow",
				outline = "OUTLINE",
				size = 28,
				inversePoint = false,
				anchorPoint = 'TOP',
				attachTo = 'SL_TopPanel',
				xOffset = -25,
				yOffset = -2,
			},
			SL_AFKTimePassed = {
				enable = true,
				font = "PT Sans Narrow",
				outline = "OUTLINE",
				size = 28,
				inversePoint = true,
				anchorPoint = 'RIGHT',
				attachTo = 'SL_AFKMessage',
				xOffset = 0,
				yOffset = 0,
				countdown = false,
			},
			SL_SubText = {
				enable = true,
				font = "PT Sans Narrow",
				outline = "OUTLINE",
				size = 15,
				inversePoint = true,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_AFKMessage',
				xOffset = 25,
				yOffset = 0,
			},
			-- SL_PlayerTitle = {
			-- 	enable = true,
			-- 	font = "PT Sans Narrow",
			-- 	outline = "OUTLINE",
			-- 	size = 28,
			-- 	inversePoint = true,
			-- 	anchorPoint = 'LEFT',
			-- 	attachTo = 'SL_PlayerName',
			-- 	xOffset = 0,
			-- 	yOffset = 0,
			-- },
			SL_PlayerName = {
				enable = true,
				font = "PT Sans Narrow",
				outline = "OUTLINE",
				size = 28,
				inversePoint = true,
				anchorPoint = 'TOPRIGHT',
				attachTo = 'SL_TopPanel',
				xOffset = -20,
				yOffset = -65,
			},
			-- SL_PlayerServer = {
			-- 	enable = true,
			-- 	font = "PT Sans Narrow",
			-- 	outline = "OUTLINE",
			-- 	size = 28,
			-- 	inversePoint = true,
			-- 	anchorPoint = 'TOPRIGHT',
			-- 	attachTo = 'SL_TopPanel',
			-- 	xOffset = -20,
			-- 	yOffset = -40,
			-- },
			-- SL_PlayerServer = {
			-- 	enable = true,
			-- 	font = "PT Sans Narrow",
			-- 	outline = "OUTLINE",
			-- 	size = 15,
			-- 	inversePoint = true,
			-- 	anchorPoint = 'BOTTOMRIGHT',
			-- 	attachTo = 'SL_PlayerName',
			-- 	xOffset = 0,
			-- 	yOffset = 0,
			-- },
			SL_PlayerClass = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 15,
				inversePoint = true,
				anchorPoint = 'BOTTOMRIGHT',
				attachTo = 'SL_GuildRank',
				xOffset = 0,
				yOffset = 0,
			},
			SL_PlayerLevel = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 15,
				inversePoint = true,
				anchorPoint = 'LEFT',
				attachTo = 'SL_PlayerClass',
				xOffset = -2,
				yOffset = 0,
			},
			SL_GuildName = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 15,
				inversePoint = true,
				anchorPoint = 'LEFT',
				attachTo = 'SL_GuildRank',
				xOffset = 0,
				yOffset = 0,
			},
			SL_GuildRank = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = "OUTLINE",
				size = 15,
				inversePoint = true,
				anchorPoint = 'BOTTOMRIGHT',
				attachTo = 'SL_PlayerName',
				xOffset = 0,
				yOffset = 0,
			},
			SL_Date = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 20,
				inversePoint = false,
				anchorPoint = 'LEFT',
				attachTo = 'SL_TopPanel',
				xOffset = 40,
				yOffset = 10,
			},
			SL_Time = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 15,
				inversePoint = true,
				anchorPoint = 'BOTTOM',
				attachTo = 'SL_Date',
				xOffset = 0,
				yOffset = -2,
				hour24 = true,
			},
			SL_ScrollFrame = {
				enable = true,
				font = 'PT Sans Narrow',
				outline = 'OUTLINE',
				size = 20,
				inversePoint = true,
				anchorPoint = 'CENTER',
				attachTo = 'SL_BottomPanel',
				xOffset = 0,
				yOffset = 0,
			},
		},
		panels = {
			top = {
				width = 0,
				height = 135,
				template = 'Transparent',
			},
			bottom = {
				width = 0,
				height = 135,
				template = 'Transparent',
			},
		},
		chat = {
			show = true,
			inversePoint = false,
			anchorPoint = 'TOPLEFT',
			xOffset = 0,
			yOffset = 0,
		},
		musicSelection = 'NONE',
		['keydown'] = true,
		['title'] = {
			['font'] = 'PT Sans Narrow',
			['size'] = 28,
			['outline'] = 'OUTLINE',
		},
		['subtitle'] = {
			['font'] = 'PT Sans Narrow',
			['size'] = 15,
			['outline'] = 'OUTLINE',
		},
		['height'] = 135,
		['playermodel'] = {
			['enable'] = true,
			['anim'] = 4,
			['distance'] = 4.5,
			['holderXoffset'] = 0,
			['holderYoffset'] = 0,
			['rotation'] = 0,
		},
		['animTime'] = 0,
		['animBounce'] = true,
		['animType'] = 'SlideIn',
		['tipThrottle'] = 15,
		['panelTemplate'] = 'Transparent',
	},
	--Shadows
	shadows = {
		shadowcolor = { ['r'] = 0, ['g'] = 0, ['b'] = 0 },
		actionbars = {
			bar1 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar2 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar3 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar4 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar5 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar6 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar7 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar8 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar9 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			bar10 = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			stancebar = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			microbar = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
			petbar = {
				backdrop = true,
				buttons = false,
				size = 3,
			},
			vehicle = {
				backdrop = false,
				buttons = false,
				size = 3,
			},
		},
		chat = {
			LeftChatPanel = {
				backdrop = false,
				size = 3,
			},
			RightChatPanel = {
				backdrop = false,
				size = 3,
			},
		},
		databars = {
			threat = {
				backdrop = false,
				size = 3,
			},
			experience = {
				backdrop = false,
				size = 3,
			},
			honor = {
				backdrop = false,
				size = 3,
			},
			reputation = {
				backdrop = false,
				size = 3,
			},
			azerite = {
				backdrop = false,
				size = 3,
			},
		},
		datatexts = {
			panels = {
				LeftChatDataPanel = {
					backdrop = false,
					size = 3,
				},
				RightChatDataPanel = {
					backdrop = false,
					size = 3,
				},
				MinimapPanel = {
					backdrop = false,
					size = 3,
				},
			},
		},
		general = {
			bottomPanel = {
				backdrop = false,
				size = 3,
			},
			topPanel = {
				backdrop = false,
				size = 3,
			},
		},
		minimap = {
			backdrop = false,
			size = 3,
		},
		objectiveframe = {
			backdrop = false,
			size = 3,
		},
		torghastPowers = {
			backdrop = false,
			size = 3,
		},
		unitframes = {
			size = 3,
			player = {
				legacy = false,
				health = false,
				power = false,
				classbar = false,
			},
			target = {
				legacy = false,
				health = false,
				power = false,
			},
			targettarget = {
				legacy = false,
				health = false,
				power = false,
			},
			targettargettarget = {
				legacy = false,
				health = false,
				power = false,
			},
			focus = {
				legacy = false,
				health = false,
				power = false,
			},
			focustarget = {
				legacy = false,
				health = false,
				power = false,
			},
			pet = {
				legacy = false,
				health = false,
				power = false,
			},
			pettarget = {
				legacy = false,
				health = false,
				power = false,
			},
			boss = {
				legacy = false,
				health = false,
				power = false,
			},
			arena = {
				legacy = false,
				health = false,
				power = false,
			},
			party = {
				legacy = false,
				health = false,
				power = false,
			},
			raid1 = {
				legacy = false,
				health = false,
				power = false,
			},
			raid2 = {
				legacy = false,
				health = false,
				power = false,
			},
			raid3 = {
				legacy = false,
				health = false,
				power = false,
			},
		},
	},
	--Skins
	["skins"] = {
		["objectiveTracker"] = {
			["classHeader"] = false,
			["colorHeader"] = {r = 1, g = 0.82, b = 0},
			["underline"] = true,
			["underlineClass"] = false,
			["underlineColor"] = {r = 1, g = 0.82, b = 0},
		},
		["merchant"] = {
			["list"] = {
				["nameFont"] = "PT Sans Narrow",
				["nameSize"] = 13,
				["nameOutline"] = "OUTLINE",
				["subFont"] = "PT Sans Narrow",
				["subSize"] = 12,
				["subOutline"] = "OUTLINE",
			},
		},
		["talkinghead"] = {
			["hide"] = false,
		},
	},
	--Tooltip
	tooltip = {
		showFaction = false,
		alwaysCompareItems = false,
		RaidProg = {
			enable = false,
			NameStyle = "SHORT",
			DifStyle = "SHORT",
			raids = {
				nightmare = false,
				trial = false,
				nighthold = false,
				sargeras = false,
				antorus = false,
				uldir = false,
				daz = false,
				sc = false,
				ep = false,
				nzoth = false,
				nathria = false,
				sod = false,
				voti = true,
			},
		},
	},
	--UI Buttons
	["uibuttons"] = {
		["enable"] = false,
		["size"] = 17,
		["mouse"] = false,
		["menuBackdrop"] = false,
		["dropdownBackdrop"] = false,
		["orientation"] = "vertical",
		["spacing"] = 3,
		["point"] = "TOPLEFT",
		["anchor"] = "TOPRIGHT",
		["xoffset"] = 0,
		["yoffset"] = 0,
		["visibility"] = "show",
		["customroll"] = {
			["min"] = "1",
			["max"] = "50",
		},
		["Config"] = {
			["enabled"] = false,
			["called"] = "Reload",
		},
		["Addon"] = {
			["enabled"] = false,
			["called"] = "Manager",
		},
		["Status"] = {
			["enabled"] = false,
			["called"] = "AFK",
		},
		["Roll"] = {
			["enabled"] = false,
			["called"] = "Hundred",
		},
	},
	--! Unitframe (slowly transition to match elvui db)
	unitframe = {
		roleIcons = {
			enable = false,
			icons = 'ElvUI',
		},
		statusbarTextures = {
			aurabar = {
				enable = false,
				texture = 'ElvUI Norm',
			},
			castbar = {
				enable = false,
				texture = 'ElvUI Norm',
			},
			classbar = {
				enable = false,
				texture = 'ElvUI Norm',
			},
			powerbar = {
				enable = false,
				texture = 'ElvUI Norm',
			},
		},
		units = {
			--* Individual Units
			player = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				pvpicontext = {
					level = {
						enable = false,
						anchorPoint = 'TOP',
						xOffset = 1,
						yOffset = 5,
						font = 'PT Sans Narrow',
						fontSize = 12,
						fontOutline = 'THICKOUTLINE',
					},
					timer = {
						enable = false,
						anchorPoint = 'BOTTOM',
						xOffset = 1,
						yOffset = -6,
						font = 'PT Sans Narrow',
						fontSize = 13,
						fontOutline = 'THICKOUTLINE',
					},
				},
			},
			target = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
				pvpicontext = {
					level = {
						enable = false,
						anchorPoint = 'TOP',
						xOffset = 1,
						yOffset = 5,
						font = 'PT Sans Narrow',
						fontSize = 12,
						fontOutline = 'THICKOUTLINE',
					},
					timer = {
						enable = false,
						anchorPoint = 'BOTTOM',
						xOffset = 1,
						yOffset = -6,
						font = 'PT Sans Narrow',
						fontSize = 13,
						fontOutline = 'THICKOUTLINE',
					},
				},
			},
			targettarget = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			targettargettarget = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			focus = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			focustarget = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			pet = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
			},
			pettarget = {
				buffs = CopyTable(UF_Auras),
				debuffs = CopyTable(UF_Auras),
			},
			--* Group Units
			party = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			raid1 = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			raid2 = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			raid3 = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			raidpet = {
				buffs = CopyTable(UF_Auras),
				debuffs = CopyTable(UF_Auras),
			},
			tank = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			assist = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			arena = {
				buffs = CopyTable(UF_Auras),
				deathIndicator = CopyTable(sharedIndicatorOptions),
				debuffs = CopyTable(UF_Auras),
				offlineIndicator = CopyTable(sharedIndicatorOptions),
			},
			boss = {
				buffs = CopyTable(UF_Auras),
				debuffs = CopyTable(UF_Auras),
			},
		}
	},
	--Unitfrmes
	["unitframes"] = {
		["unit"] = {
			["party"] = {
				["role"] = {
					["xoffset"] = 0,
					["yoffset"] = 0,
				},
			},
			["raid1"] = {
				["role"] = {
					["xoffset"] = 0,
					["yoffset"] = 0,
				},
			},
			["raid2"] = {
				["role"] = {
					["xoffset"] = 0,
					["yoffset"] = 0,
				},
			},
			["raid3"] = {
				["role"] = {
					["xoffset"] = 0,
					["yoffset"] = 0,
				},
			},
		},
		roleIcons = {
			enable = false,
			icons = 'ElvUI',
		},
	},
}
