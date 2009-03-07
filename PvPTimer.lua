local UPDATE_PERIOD = 0.5
local elapsed = 0.5

local f = CreateFrame("frame")
local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(
	'PvPTimer', 
	{type='data source', text='', label='PvP: '}
)

f:SetScript("OnUpdate", function(self, elap)
	elapsed = elapsed + elap
	if elapsed < UPDATE_PERIOD then return end
	elapsed = 0
		
	dataobj.text = ''
end)
