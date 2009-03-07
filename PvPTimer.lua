local UPDATE_PERIOD = 0.5
local elapsed = 0.5

local str_format = string.format

local PVP_MAX_TIME = 301000
local PVP_ICON_FFA = 'Interface\\TargetingFrame\\UI-PVP-FFA'
local PVP_ICON = 'Interface\\TargetingFrame\\UI-PVP-'

local f = CreateFrame("frame")
local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(
	'PvPTimer', 
	{type='data source', text='', label='PvP: '}
)

f:SetScript("OnUpdate", function(self, elap)
	elapsed = elapsed + elap
	if elapsed < UPDATE_PERIOD then return end
	elapsed = 0
	
	local time = GetPVPTimer()
	local text = ''
	local ffa = UnitIsPVPFreeForAll("player")
	
	if( time < PVP_MAX_TIME ) then
		local min = floor(time/60000)
		local sec = floor(time/1000)%60
		sec = sec < 10 and '0'..sec or sec
		text = str_format("|cffffffff%s%s:%s|r", ffa and 'FFA' or '', min, sec)
	elseif( UnitIsPVP("player") ) then
		text = ffa and '|cffff1919FFA|r' or '|cffff1919PvP|r'
	else
		text = '|cff8c8c8cPvE|r'
	end
	
	dataobj.text = text
end)
