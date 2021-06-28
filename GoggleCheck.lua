local frame = CreateFrame("Frame");

local function tableHasValue(theTable, search)
    for index, value in ipairs(theTable) do
        if value == search then
            return true
        end
    end

    return false
end

local function isGoggleArea(areaName)
	return tableHasValue({'Nagrand', 'Shadowmoon Valley', 'Netherstorm', 'Zangarmarsh'}, areaName);
end

local function isNonGoggleArea(areaName)
	return IsInInstance();
end

local function gogglesAreEquipped()
	return IsEquippedItem('Ultra-Spectropic Detection Goggles');
end

frame:SetScript('OnEvent', function(_, event)

	local currentArea = GetRealZoneText();
    if isGoggleArea(currentArea) then

    	if not gogglesAreEquipped() then
    		print('Equip Goggles!');
    	end

	elseif isNonGoggleArea(currentArea) then

    	if gogglesAreEquipped() then
    		print('Unequip Goggles!');
    	end

	end
end)

frame:RegisterEvent('ZONE_CHANGED_NEW_AREA');
