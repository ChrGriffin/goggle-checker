function tableHasValue(theTable, search)
    for index, value in ipairs(theTable) do
        if value == search then
            return true
        end
    end

    return false
end