local frame = CreateFrame("Frame");

local function isGoggleArea(areaName)
    return tableHasValue({'Nagrand', 'Shadowmoon Valley', 'Netherstorm', 'Zangarmarsh'}, areaName);
end

local function isNonGoggleArea(areaName)
    return IsInInstance();
end

local function gogglesAreEquipped()
    return IsEquippedItem('Ultra-Spectropic Detection Goggles');
end

local function goggleAlert(message)
	print(message);
end

frame:SetScript('OnEvent', function(_, event)

    local currentArea = GetRealZoneText();
    if isGoggleArea(currentArea) then

        if not gogglesAreEquipped() then
            goggleAlert('Engineering Goggles are not equipped!');
        end

    elseif isNonGoggleArea(currentArea) then

        if gogglesAreEquipped() then
            goggleAlert('Engineering Goggles are still equipped!');
        end

    end
end)

frame:RegisterEvent('ZONE_CHANGED_NEW_AREA');
