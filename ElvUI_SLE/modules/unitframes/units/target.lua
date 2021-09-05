local SLE, _, E = unpack(select(2, ...))
local SUF = SLE.UnitFrames

function SUF:Construct_TargetFrame(frame)
	-- print('Construct_TargetFrame: ', frame:GetName())
	frame.SL_DeathIndicator = SUF:Construct_DeathIndicator(frame)
	frame.SL_OfflineIndicator = SUF:Construct_OfflineIndicator(frame)
end

function SUF:Update_TargetFrame(frame)
	-- print('Update_TargetFrame: ', frame:GetName())
	if not frame then return end
	local enableState = E.private.sle.module.shadows.enable and E.db.unitframe.units.target.enable
	local db = E.db.sle.shadows.unitframes[frame.unitframeType]

	frame.SLLEGACY_ENHSHADOW = enableState and db.legacy or false
	frame.SLHEALTH_ENHSHADOW = enableState and db.health or false
	frame.SLPOWER_ENHSHADOW = enableState and db.power or false

	SUF:Configure_Health(frame)
	SUF:Configure_Power(frame)
	SUF:Configure_DeathIndicator(frame)
	SUF:Configure_OfflineIndicator(frame)
end
