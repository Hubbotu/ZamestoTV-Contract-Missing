-- Localization Table
local L = {}
local locale = GetLocale()

if locale == "ruRU" then
    L["Contract: Dragonscale Expedition"] = "Контракт с Драконьей экспедицией"
    L["Contract: Maruuk Centaur"] = "Контракт с кентаврами"
    L["Contract: Iskaara Tuskarr"] = "Контракт с искарскими клыкаррами"
    L["Contract: Valdrakken Accord"] = "Контракт с Вальдраккеном"
    L["Contract: Artisan's Consortium"] = "Контракт с Консорциумом ремесленников"
    L["Contract: Loamm Niffen"] = "Контракт с лоаммскими ниффами"
    L["Contract: Dream Wardens"] = "Контракт со Стражами Сна"
    L["CONTRACT MISSING"] = "КОНТРАКТ ОТСУТСТВУЕТ"
else
    L["Contract: Dragonscale Expedition"] = "Contract: Dragonscale Expedition"
    L["Contract: Maruuk Centaur"] = "Contract: Maruuk Centaur"
    L["Contract: Iskaara Tuskarr"] = "Contract: Iskaara Tuskarr"
    L["Contract: Valdrakken Accord"] = "Contract: Valdrakken Accord"
    L["Contract: Artisan's Consortium"] = "Contract: Artisan's Consortium"
    L["Contract: Loamm Niffen"] = "Contract: Loamm Niffen"
    L["Contract: Dream Wardens"] = "Contract: Dream Wardens"
    L["CONTRACT MISSING"] = "CONTRACT MISSING"
end

-- Main Addon Code
local frame = CreateFrame("Frame", "DragonflightContractMissingFrame", UIParent)
frame:SetSize(400, 100)
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 420)

frame.text = frame:CreateFontString(nil, "OVERLAY")
frame.text:SetFont("Fonts\\ARIALN.TTF", 36, "OUTLINE")
frame.text:SetPoint("CENTER", frame, "CENTER")
frame.text:SetTextColor(1, 0, 0.031372550874949, 1)
frame.text:SetShadowColor(0, 0, 0, 1)
frame.text:SetShadowOffset(1, -1)
frame.text:SetText(L["CONTRACT MISSING"])

local contracts = {
    L["Contract: Dragonscale Expedition"],
    L["Contract: Maruuk Centaur"],
    L["Contract: Iskaara Tuskarr"],
    L["Contract: Valdrakken Accord"],
    L["Contract: Artisan's Consortium"],
    L["Contract: Loamm Niffen"],
    L["Contract: Dream Wardens"]
}

local function CheckContracts()
    for _, contract in ipairs(contracts) do
        if AuraUtil.FindAuraByName(contract, "player", "HELPFUL") then
            frame:Hide()
            return
        end
    end
    frame:Show()
end

frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_AURA")
frame:SetScript("OnEvent", CheckContracts)

frame:Hide() -- Start hidden
