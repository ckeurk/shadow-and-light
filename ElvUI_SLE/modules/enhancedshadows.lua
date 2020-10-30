local SLE, T, E, L, V, P, G = unpack(select(2, ...))
local ENH = SLE:NewModule('EnhancedShadows', 'AceEvent-3.0')
local DT = E:GetModule('DataTexts')
local MM = E:GetModule('Minimap')

local _G = _G
local CreateFrame = CreateFrame
local UnitAffectingCombat = UnitAffectingCombat
local SIDE_BUTTON = E.db.chat.hideChatToggles and 0 or 19

ENH.CreatedShadows = {}
ENH.DummyPanels = {}
ENH.frames = {
	chat = {
		['leftpanel'] = 'LeftChatPanel',
		['rightpanel'] = 'RightChatPanel',
	},
	databars = {
		['honor'] = {'ElvUI_HonorBar', L["Honor Bar"]},
		['experience'] = {'ElvUI_ExperienceBar', L["Experience Bar"]},
		['reputation'] = {'ElvUI_ReputationBar', L["Reputation Bar"]},
		['azerite'] = {'ElvUI_AzeriteBar', L["Azerite Bar"]},
		['threat'] = {'ElvUI_ThreatBar', L["Threat Bar"]},
	},
	datatexts = {
		['LeftChatDataPanel'] = {'LeftChatDataPanel', L["Datatext Panel (Left)"]},
		['RightChatDataPanel'] = {'RightChatDataPanel', L["Datatext Panel (Right)"]},
	},
	unitframes = {
		player = {
			order = 1,
			group = 'individualUnits',
		},
		target = {
			order = 2,
			group = 'individualUnits',
		},
		targettarget = {
			order = 3,
			group = 'individualUnits',
		},
		targettargettarget = {
			order = 4,
			group = 'individualUnits',
		},
		focus = {
			order = 5,
			group = 'individualUnits',
		},
		focustarget = {
			order = 6,
			group = 'individualUnits',
		},
		pet = {
			order = 7,
			group = 'individualUnits',
		},
		pettarget = {
			order = 8,
			group = 'individualUnits',
		},
		party = {
			order = 9,
			group = 'groupUnits',
		},
		raid = {
			order = 10,
			group = 'groupUnits',
		},
		raid40 = {
			order = 11,
			group = 'groupUnits',
		},
		boss = {
			order = 12,
			group = 'groupUnits',
		},
		arena = {
			order = 13,
			group = 'groupUnits',
		},
	},
}

function ENH:ProcessShadow(frame, parent, level, db)
	if not frame then return end

	local name = frame:GetName()
	level = (level >= 0 and level or 0)
	frame.enhshadow = frame:CreateShadow(nil, true)
	frame.enhshadow:SetParent(parent and parent or frame)
	frame.enhshadow:SetFrameLevel(level)
	frame.enhshadow.size = db.size

	if name then
		frame.enhshadow.name = name
	end

	ENH:RegisterShadow(frame.enhshadow)
	ENH:UpdateShadow(frame.enhshadow)
end

function ENH:RegisterShadow(shadow)
	if not shadow or shadow.isRegistered then return end

	ENH.CreatedShadows[shadow] = true
	shadow.isRegistered = true
end

function ENH:UpdateShadows()
	if UnitAffectingCombat('player') then ENH:RegisterEvent('PLAYER_REGEN_ENABLED', ENH.UpdateShadows) return end

	ENH:UnregisterEvent('PLAYER_ENTERING_WORLD')

	for frame, _ in pairs(ENH.CreatedShadows) do
		ENH:UpdateShadow(frame)
	end
end

function ENH:UpdateShadow(shadow)
	local r, g, b = E.db.sle.shadows.shadowcolor.r, E.db.sle.shadows.shadowcolor.g, E.db.sle.shadows.shadowcolor.b
	local size = shadow.size and shadow.size or 3
	local offset = (E.PixelMode and size) or (size + 1)

	if shadow.name == 'LeftChatDataPanel' or shadow.name == 'LeftChatPanel' then
		-- Left Chat Datatext Panel adjustments from old shadows setup
		if E.db.sle.shadows.datatexts.panels.LeftChatDataPanel.backdrop and not E.db.sle.shadows.chat.LeftChatPanel.backdrop then
			_G.LeftChatToggleButton:SetFrameStrata('LOW')
			_G.LeftChatToggleButton:SetFrameLevel(0)
			_G.LeftChatDataPanel:SetFrameStrata('LOW')
			_G.LeftChatDataPanel:SetFrameLevel(0)
		end

		-- Left Chat Panel adjustments from old shadows setup
		if E.db.sle.shadows.chat.LeftChatPanel.backdrop and not E.db.sle.shadows.datatexts.panels.LeftChatDataPanel.backdrop then
			_G.LeftChatToggleButton:SetFrameStrata('BACKGROUND')
			_G.LeftChatToggleButton:SetFrameLevel(201)
			_G.LeftChatDataPanel:SetFrameStrata('BACKGROUND')
			_G.LeftChatDataPanel:SetFrameLevel(201)
		end
	elseif shadow.name == 'RightChatDataPanel' or shadow.name == 'RightChatPanel' then
		-- Right Chat Datatext Panel adjustments from old shadows setup
		if E.db.sle.shadows.datatexts.panels.RightChatDataPanel.backdrop and not E.db.sle.shadows.chat.RightChatPanel.backdrop then
			_G.RightChatToggleButton:SetFrameStrata('LOW')
			_G.RightChatToggleButton:SetFrameLevel(0)
			_G.RightChatDataPanel:SetFrameStrata('LOW')
			_G.RightChatDataPanel:SetFrameLevel(0)
		end
		-- Right Chat Panel adjustments from old shadows setup
		if E.db.sle.shadows.chat.RightChatPanel.backdrop and not E.db.sle.shadows.datatexts.panels.RightChatDataPanel.backdrop then
			_G.RightChatToggleButton:SetFrameStrata('BACKGROUND')
			_G.RightChatToggleButton:SetFrameLevel(201)
			_G.RightChatDataPanel:SetFrameStrata('BACKGROUND')
			_G.RightChatDataPanel:SetFrameLevel(201)
		end
	end

	shadow:SetOutside(shadow:GetParent(), offset, offset)
	shadow:SetBackdrop({
		edgeFile = E.LSM:Fetch('border', 'ElvUI GlowBorder'), edgeSize = size > 3 and size or 3,
		-- insets = {left = E:Scale(5), right = E:Scale(5), top = E:Scale(5), bottom = E:Scale(5)},  --! Don't see a need for this
	})
	shadow:SetBackdropColor(r, g, b, 0)
	shadow:SetBackdropBorderColor(r, g, b, 0.9)
end

function ENH:CreateABShadows()
	if not E.private.actionbar.enable then return end

	-- Actionbar backdrops
	for i = 1, 10 do
		local styleBacks = {_G['ElvUI_Bar'..i]}
		for _, frame in pairs(styleBacks) do
			ENH:ProcessShadow(frame, frame.backdrop, frame:GetFrameLevel(), ENH.db.actionbars['bar'..i])

			for k = 1, 12 do
				local buttonBars = {_G['ElvUI_Bar'..i..'Button'..k]}
				for _, button in pairs(buttonBars) do
					ENH:ProcessShadow(button, button.backdrop, button:GetFrameLevel(), ENH.db.actionbars['bar'..i])
				end
			end
		end
	end

	do
		-- Pet Bar
		local frame = _G.ElvUI_BarPet
		ENH:ProcessShadow(frame, frame.backdrop, frame:GetFrameLevel(), ENH.db.actionbars.petbar)
		for i = 1, 12 do
			local button = _G['PetActionButton'..i]
			if not button then break end
			ENH:ProcessShadow(button, button.backdrop, button:GetFrameLevel(), ENH.db.actionbars.petbar)
		end
	end

	do
		-- Micro Bar
		local frame = _G.ElvUI_MicroBar
		ENH:ProcessShadow(frame, nil, frame:GetFrameLevel(), ENH.db.actionbars.microbar)
		for i = 1, (#MICRO_BUTTONS) do
			if not _G[MICRO_BUTTONS[i]] then break end
			local button = _G[MICRO_BUTTONS[i]]
			ENH:ProcessShadow(button, button.backdrop, button:GetFrameLevel()-1, ENH.db.actionbars.microbar)
		end
	end

	do
		-- Stance Bar
		local frame = _G.ElvUI_StanceBar
		ENH:ProcessShadow(frame, frame.backdrop, frame:GetFrameLevel(), ENH.db.actionbars.stancebar)
		for i = 1, 12 do
			local button = _G['ElvUI_StanceBarButton'..i]
			if not button then break end
			ENH:ProcessShadow(button, button.backdrop, button:GetFrameLevel(), ENH.db.actionbars.stancebar)
		end
	end

	-- TODO: Add Enhanced Vehicle UI Later
	-- do
	-- -- S&L Enhanced Vehicle Bar
	-- 	local frame = _G.ElvUISL_EnhancedVehicleBar
	-- 	ENH:ProcessShadow(frame, nil, frame:GetFrameLevel(), ENH.db.actionbars.vehicle)
	-- 	for i = 1, 12 do
	-- 		local button = _G['ElvUISL_EnhancedVehicleBarButton'..i]
	-- 		if not button then break end
	-- 		ENH:ProcessShadow(button, button.backdrop, button:GetFrameLevel(), ENH.db.actionbars.vehicle)
	-- 	end
	-- end
end

function ENH:ToggleABShadows()
	if not E.private.actionbar.enable then return end

	-- Player ActionBars
	for i = 1, 10 do
		local frame = _G['ElvUI_Bar'..i]
		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.actionbars['bar'..i].backdrop)
		end
		for k = 1, 12 do
			local button = _G['ElvUI_Bar'..i..'Button'..k]
			if button and button.enhshadow then
				button.enhshadow:SetShown(ENH.db.actionbars['bar'..i].buttons)
			end
		end
	end

	-- TODO: Add Enhanced Vehicle UI Later
	-- S&L Enhanced Vehicle Bar
	-- do
	-- 	local frame = _G.ElvUISL_EnhancedVehicleBar
	-- 	if frame and frame.enhshadow then
	-- 		frame.enhshadow:SetShown(ENH.db.actionbars.vehicle.backdrop)
	-- 	end
	-- 	for i = 1, 12 do
	-- 		local button = _G['ElvUISL_EnhancedVehicleBarButton'..i]
	-- 		if button and button.enhshadow then
	-- 			button.enhshadow:SetShown(ENH.db.actionbars.vehicle.buttons)
	-- 		end
	-- 	end
	-- end

	do
		-- Pet Bar
		local frame = _G.ElvUI_BarPet
		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.actionbars.petbar.backdrop)
		end
		for i = 1, 12 do
			local button = _G['PetActionButton'..i]
			if not button then break end
			if button.enhshadow then
				button.enhshadow:SetShown(ENH.db.actionbars.petbar.buttons)
			end
		end
	end

	do
		-- Micro Bars
		local frame = _G.ElvUI_MicroBar
		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.actionbars.microbar.backdrop)
		end

		for i=1, (#MICRO_BUTTONS) do
			local button = _G[MICRO_BUTTONS[i]]
			if not button then break end
			if button.enhshadow then
				button.enhshadow:SetShown(ENH.db.actionbars.microbar.buttons)
			end
		end
	end

	do
		-- Stance Bar
		local frame = _G.ElvUI_StanceBar
		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.actionbars.stancebar.backdrop)
		end
		for i = 1, 12 do
			local button = _G['ElvUI_StanceBarButton'..i]
			if not button then break end
			if button and button.enhshadow then
				button.enhshadow:SetShown(ENH.db.actionbars.stancebar.buttons)
			end
		end
	end
end

function ENH:CreateDBShadows()
	for bar, tbl in pairs(ENH.frames.databars) do
		local name = unpack(tbl)
		local frame = _G[name]
		ENH:ProcessShadow(frame, nil, frame:GetFrameLevel(), ENH.db.databars[bar])
	end
end

function ENH:ToggleDBShadows()
	for bar, tbl in next, ENH.frames.databars do
		local frame = unpack(tbl)
		frame = _G[frame]
		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.databars[bar].backdrop)
		end
	end
end

function ENH:CreateDTShadows()
	ENH.DummyPanels.LeftChatDataPanel = CreateFrame('Frame', nil, _G.LeftChatDataPanel)
	ENH.DummyPanels.LeftChatDataPanel:Point('TOPLEFT', _G.LeftChatDataPanel, 'TOPLEFT', -SIDE_BUTTON, 0)
	ENH.DummyPanels.LeftChatDataPanel:Point('BOTTOMRIGHT', _G.LeftChatDataPanel, 'BOTTOMRIGHT', 0, 0)
	ENH.DummyPanels.LeftChatDataPanel:SetFrameStrata('LOW')
	ENH:ProcessShadow(ENH.DummyPanels.LeftChatDataPanel, nil, ENH.DummyPanels.LeftChatDataPanel:GetFrameLevel(), ENH.db.datatexts.panels.LeftChatDataPanel)

	ENH.DummyPanels.RightChatDataPanel = CreateFrame('Frame', nil, _G.RightChatDataPanel)
	ENH.DummyPanels.RightChatDataPanel:Point('TOPRIGHT', _G.RightChatDataPanel, 'TOPRIGHT', SIDE_BUTTON, 0)
	ENH.DummyPanels.RightChatDataPanel:Point('BOTTOMLEFT', _G.RightChatDataPanel, 'BOTTOMLEFT', 0, 0)
	ENH.DummyPanels.RightChatDataPanel:SetFrameStrata('LOW')
	ENH:ProcessShadow(ENH.DummyPanels.RightChatDataPanel, nil, ENH.DummyPanels.RightChatDataPanel:GetFrameLevel(), ENH.db.datatexts.panels.RightChatDataPanel)

	for name, frame in next, DT.RegisteredPanels do
		if name ~= 'LeftChatDataPanel' and name ~= 'RightChatDataPanel' then
			ENH:ProcessShadow(frame, nil, frame:GetFrameLevel(), ENH.db.datatexts.panels[name])
		end
	end
end

function ENH:ToggleDTShadows()
	for name, frame in next, DT.RegisteredPanels do
		if ENH.DummyPanels[name] and ENH.DummyPanels[name].enhshadow then
			ENH.DummyPanels[name].enhshadow:SetShown(ENH.db.datatexts.panels[name].backdrop)
		end

		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.datatexts.panels[name].backdrop)
		end
	end
end

function ENH:CreateCHShadows()
	ENH:ProcessShadow(_G.LeftChatPanel, _G.LeftChatPanel.backdrop, _G.LeftChatPanel:GetFrameLevel(), ENH.db.chat.LeftChatPanel)
	ENH:ProcessShadow(_G.RightChatPanel, _G.RightChatPanel.backdrop, _G.RightChatPanel:GetFrameLevel(), ENH.db.chat.RightChatPanel)
end

function ENH:ToggleCHShadows()
	for panel, _ in pairs(E.db.sle.shadows.chat) do
		local frame = _G[panel]

		if frame and frame.enhshadow then
			frame.enhshadow:SetShown(ENH.db.chat[panel].backdrop)
		end
	end
end

function ENH:UpdateDefaults()
	for name, _ in pairs(DT.RegisteredPanels) do
		if not E.db.sle.shadows.datatexts.panels[name] then
			E.db.sle.shadows.datatexts.panels[name] = {
				backdrop = false,
				size = 3,
			}
		end
	end
end

function ENH:CreateMMShadows()
	if not E.private.general.minimap.enable then return end
	ENH.DummyPanels.Minimap = CreateFrame("Frame", nil, _G.MMHolder)

	ENH:ProcessShadow(ENH.DummyPanels.Minimap, nil, ENH.DummyPanels.Minimap:GetFrameLevel(), ENH.db.minimap)
	ENH:ProcessShadow(_G.MMHolder, nil, _G.MMHolder:GetFrameLevel(), ENH.db.minimap)

	hooksecurefunc(MM, "UpdateSettings", ENH.ToggleMMShadows)
end

function ENH:ToggleMMShadows()
	if _G.MMHolder and _G.MMHolder.enhshadow then
		_G.MMHolder.enhshadow:SetShown(ENH.db.minimap.backdrop and not E.private.sle.minimap.rectangle)
	end

	if ENH.DummyPanels.Minimap and ENH.DummyPanels.Minimap.enhshadow then
		ENH.DummyPanels.Minimap:Point('TOPLEFT', _G.Minimap, 'TOPLEFT', -1, -(E.MinimapSize/6.1)+1)

		if E.db.datatexts.panels.MinimapPanel.enable then
			ENH.DummyPanels.Minimap:Point('BOTTOMRIGHT', _G.MinimapPanel, 'BOTTOMRIGHT', 0, 0)
		else
			ENH.DummyPanels.Minimap:Point('BOTTOMRIGHT', _G.Minimap, 'BOTTOMRIGHT', 1, (E.MinimapSize/6.1)-1)
		end

		ENH.DummyPanels.Minimap.enhshadow:SetShown(ENH.db.minimap.backdrop and E.private.sle.minimap.rectangle)
	end
end

function ENH:ADDON_LOADED(event, addon)
	if addon ~= 'ElvUI_OptionsUI' then return end
	ENH:UnregisterEvent(event)
	hooksecurefunc(DT, "PanelLayoutOptions", ENH.UpdateDatatextOptions)
end

function ENH:Initialize()
	if not SLE.initialized or not E.private.sle.module.shadows.enable then return end
	-- if not SLE.initialized then return end
	ENH.db = E.db.sle.shadows

	--! Idea to update defaults for custom datatext panels
	ENH:UpdateDefaults()

	ENH:RegisterEvent('PLAYER_ENTERING_WORLD', ENH.UpdateShadows)
	ENH:RegisterEvent('ADDON_LOADED')

	ENH:CreateABShadows()
	ENH:ToggleABShadows()

	ENH:CreateDBShadows()
	ENH:ToggleDBShadows()

	ENH:CreateDTShadows()
	ENH:ToggleDTShadows()

	ENH:CreateMMShadows()
	ENH:ToggleMMShadows()

	ENH:CreateCHShadows()
	ENH:ToggleCHShadows()
	-- E:Dump(DT.db.panels, true)
	-- for k, v in pairs(DT.db.panels) do
	-- 	print(k, v)
	-- end
	-- ENH:UpdateShadows()
	function ENH:ForUpdateAll()
		ENH:UpdateShadows()
	end
	-- hooksecurefunc(DT, "PanelLayoutOptions", ENH.PanelLayoutOptions)
end

SLE:RegisterModule(ENH:GetName())
