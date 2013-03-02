﻿local E, L, V, P, G, _ = unpack(ElvUI); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local SLE = E:NewModule('SLE', 'AceHook-3.0', 'AceEvent-3.0');
local UF = E:GetModule('UnitFrames');
local DTP

SLE.version = GetAddOnMetadata("ElvUI_SLE", "Version")
E.SLEConfigs = {}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
	if addon == "ElvUI_Config" then
		for _, func in pairs(E.SLEConfigs) do
			func()
		end	
		self:UnregisterEvent("ADDON_LOADED")
	end
end)

function SLE:Tutorials() --Additional tutorials
	table.insert(E.TutorialList, #(E.TutorialList)+1, L["To enable full values of health/power on unitframes in Shadow & Light add \":sl\" to the end of the health/power tag.\nExample: [health:current:sl]."]);
end

function SLE:ConfigCats() --Additional mover groups
	table.insert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L");
	E.ConfigModeLocalizedStrings["S&L"] = L["S&L: All"]
	table.insert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L DT");
	E.ConfigModeLocalizedStrings["S&L DT"] = L["S&L: Datatexts"]
	table.insert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L BG");
	E.ConfigModeLocalizedStrings["S&L BG"] = L["S&L: Backgrounds"]
	table.insert(E.ConfigModeLayouts, #(E.ConfigModeLayouts)+1, "S&L MISC");
	E.ConfigModeLocalizedStrings["S&L MISC"] = L["S&L: Misc"]
end

function SLE:LootShow()
	local instance = IsInInstance()
	LootHistoryFrame:SetAlpha(E.db.sle.lootalpha or 1)

	if (not instance and E.db.sle.lootwin) then
		LootHistoryFrame:Hide()
	end
end

function SLE:ChatPos()
	if not E:HasMoverBeenMoved("LeftChatMover") and E.db.datatexts.leftChatPanel then
		if not E.db.movers then E.db.movers = {}; end
		if E.PixelMode then
			E.db.movers.LeftChatMover = "BOTTOMLEFTUIParentBOTTOMLEFT019"
		else
			E.db.movers.LeftChatMover = "BOTTOMLEFTUIParentBOTTOMLEFT021"
		end
		E:SetMoversPositions()
	end
	
	if not E:HasMoverBeenMoved("RightChatMover") and E.db.datatexts.rightChatPanel then
		if not E.db.movers then E.db.movers = {}; end
		if E.PixelMode then
			E.db.movers.RightChatMover = "BOTTOMRIGHTUIParentBOTTOMRIGHT019"
		else
			E.db.movers.RightChatMover = "BOTTOMRIGHTUIParentBOTTOMRIGHT021"
		end
		E:SetMoversPositions()
	end
end

E.PopupDialogs["VERSION_MISMATCH"] = {
	text = L["Your version of ElvUI is older than recommended to use with Shadow & Light Edit. Please, download the latest version from tukui.org."],
	button1 = CLOSE,
	timeout = 0,
	whileDead = 1,	
	preferredIndex = 3,
}
E.PopupDialogs["ELVUI_SLE_REPOOC"] = {
	text = L["Repooc configuration requires PixelPerfect to be enabled. Hit accept to enable Pixel Perfect, hit cancel to not use Repooc's Config."],
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		E:SetupPixelPerfect(true)
		E:RepoocSetup()
	end,
	timeout = 0,
	whileDead = 1,
}
E.PopupDialogs["ELVUI_SLE_AFFINITII"] = {
	text = L["Would you like to load additional addon settings from this profile's author? Note: This will add a new profile in the addons that he has settings for and set your current profile to the newly made profile."],
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		E:AffinitiiSetup(true)
	end,
	OnCancel = function(self)
		E:AffinitiiSetup(false)
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
}
E.PopupDialogs["ELVUI_SLE_DARTH"] = {
	text = L["Would you like to load additional addon settings from this profile's author? Note: This will add a new profile in the addons that he has settings for and set your current profile to the newly made profile."],
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		E:DarthSetup(true)
	end,
	OnCancel = function(self)
		E:DarthSetup(false)
	end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = false,
}

--Showing warning message about too old versions of ElvUI
if tonumber(E.version) < 5.32 then
	E:StaticPopup_Show("VERSION_MISMATCH")
end

E.UpdateAllSLE = E.UpdateAll
function E:UpdateAll()
    E.UpdateAllSLE(self)
	E:GetModule('BackGrounds'):UpdateFrames()
	E:GetModule('BackGrounds'):RegisterHide()
	DTP:Update()
	DTP:DashboardShow()
	DTP:DashWidth()
	if E.private.unitframe.enable then
		UF:Update_CombatIndicator()
	end
	E:GetModule('UIButtons'):UpdateAll()
	E:GetModule('RaidMarks'):Update()
	E:GetModule('Farm'):UpdateLayout()
	SLE:ChatPos()
end

function SLE:Reset(all, uf, dt, bg, mark)
	if all then --Reset All button
		E:CopyTable(E.db.sle, P.sle)
		E:ResetMovers(L["DP_1"])
		E:ResetMovers(L["DP_2"])
		E:ResetMovers(L["DP_3"])
		E:ResetMovers(L["DP_4"])
		E:ResetMovers(L["DP_5"])
		E:ResetMovers(L["DP_6"])
		E:ResetMovers(L["Top_Center"])
		E:ResetMovers(L["Bottom_Panel"])
		E:ResetMovers(L["Dashboard"])
		E:ResetMovers(L["Pet Battle AB"])
		E:ResetMovers("PvP")
		E:ResetMovers('RM')
		E:ResetMovers(L["UI Buttons"])
		E:ResetMovers(L["Bottom BG"])
		E:ResetMovers(L["Left BG"])
		E:ResetMovers(L["Right BG"])
		E:ResetMovers(L["Actionbar BG"])
	end
	if uf then
		E.db.sle.combatico.pos = 'TOP'
		E:CopyTable(E.db.unitframe.units.player.classbar, P.unitframe.units.player.classbar)
		E.db.sle.powtext = false
	end
	if dt then
		E:CopyTable(E.db.sle.datatext, P.sle.datatext)
		E:ResetMovers(L["DP_1"])
		E:ResetMovers(L["DP_2"])
		E:ResetMovers(L["DP_3"])
		E:ResetMovers(L["DP_4"])
		E:ResetMovers(L["DP_5"])
		E:ResetMovers(L["DP_6"])
		E:ResetMovers(L["Top_Center"])
		E:ResetMovers(L["Bottom_Panel"])
		E:ResetMovers(L["Dashboard"])
	end
	if bg then
		E:CopyTable(E.db.sle.backgrounds, P.sle.backgrounds)
		E:ResetMovers(L["Bottom BG"])
		E:ResetMovers(L["Left BG"])
		E:ResetMovers(L["Right BG"])
		E:ResetMovers(L["Actionbar BG"])
	end
	if mark then
		E:CopyTable(E.db.sle.marks, P.sle.marks)
		E:ResetMovers('RM')
	end
	E:UpdateAll()
end

function SLE:BagSearch(itemId)
	for container = 0, NUM_BAG_SLOTS do
		for slot = 1, GetContainerNumSlots(container) do
			if itemId == GetContainerItemID(container, slot) then
				return container, slot
			end
		end
	end
end

E.BeginFoolsDayEventSLE = E.BeginFoolsDayEvent
function E:BeginFoolsDayEvent()
	E.BeginFoolsDayEventSLE(self)
	tinsert(self.massiveShakeObjects, M1)
	tinsert(self.massiveShakeObjects, M2)
	tinsert(self.massiveShakeObjects, M3)
	tinsert(self.massiveShakeObjects, M4)
	tinsert(self.massiveShakeObjects, M5)
	tinsert(self.massiveShakeObjects, M6)
	tinsert(self.massiveShakeObjects, M7)
	tinsert(self.massiveShakeObjects, M8)
	for i=1, 5 do
		if FseedButtons[i] then
			for j = 1, #FseedButtons[i] do
					tinsert(self.massiveShakeObjects, FseedButtons[i][j])
			end
		end
	end
	for i = 1, #FtoolButtons do
		tinsert(self.massiveShakeObjects, FtoolButtons[i])
	end
	for i = 1, #FportalButtons do
		tinsert(self.massiveShakeObjects, FportalButtons[i])
	end
	tinsert(self.massiveShakeObjects, ConfigUIButton)
	tinsert(self.massiveShakeObjects, ReloadUIButton)
	tinsert(self.massiveShakeObjects, MoveUIButton)
	tinsert(self.massiveShakeObjects, Bbutton)
	tinsert(self.massiveShakeObjects, Abutton)
	if Fbutton then tinsert(self.massiveShakeObjects, Fbutton) end
	tinsert(self.massiveShakeObjects, DP_1)
	tinsert(self.massiveShakeObjects, DP_2)
	tinsert(self.massiveShakeObjects, DP_3)
	tinsert(self.massiveShakeObjects, DP_4)
	tinsert(self.massiveShakeObjects, DP_5)
	tinsert(self.massiveShakeObjects, DP_6)
	tinsert(self.massiveShakeObjects, Top_Center)
	tinsert(self.massiveShakeObjects, Bottom_Panel)
	tinsert(self.massiveShakeObjects, BottomBG)
	tinsert(self.massiveShakeObjects, LeftBG)
	tinsert(self.massiveShakeObjects, RightBG)
	tinsert(self.massiveShakeObjects, ActionBG)
end

function SLE:Initialize()
	DTP = E:GetModule('DTPanels')
	if E.private.unitframe.enable then
		self:RegisterEvent("PLAYER_REGEN_DISABLED", UF.Update_CombatIndicator);
	end
	self:RegisterEvent('PLAYER_ENTERING_WORLD', 'LootShow');
	if E.db.general.loginmessage then
		print(format(L['SLE_LOGIN_MSG'], E["media"].hexvaluecolor, SLE.version))
	end
	DTP:DashboardShow()
	SLE:Tutorials()
	SLE:ConfigCats()
	SLE:ChatPos()
end

E:RegisterModule(SLE:GetName())