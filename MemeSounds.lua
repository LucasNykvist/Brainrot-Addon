local defaultSettings = {
    randomDeathSoundStatus = true,
    brainrotDanceMusic = true,
    logoutMusic = true,
}

local function LoadDatabase()
    if not MyAddonDB then
        MyAddonDB = {}
    end

    for key, value in pairs(defaultSettings) do
        if MyAddonDB[key] == nil then
            MyAddonDB[key] = value
        end
    end
end


LoadDatabase()


local function playRandomSound()
    local customSounds = {
        "Interface\\AddOns\\MemeSounds\\sounds\\2h.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\amogus.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\augh.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\bell.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\benyes.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\bobr.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\brainfart.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\benno.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\burh.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\fart.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\holymoly.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\omg.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\rizz.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\sponge.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\sus.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\treat.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\uwu.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\vine.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\scooby.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\whatthe.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\yipee.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\huh.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\guy.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\ogs.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\btb.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\funny.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\tuah.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\monke.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\pluh.mp3",
        "Interface\\AddOns\\MemeSounds\\sounds\\skibidi.mp3",
    }



    local randomIndex = math.random(1, #customSounds)
    local soundPath = customSounds[randomIndex]
    PlaySoundFile(soundPath)
end

local function playRandomSong()
    local customSongs = {
        "Interface\\AddOns\\MemeSounds\\songs\\skibidi.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\funky.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\seashanty.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\shantytrap.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\thickofit.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\wil.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\miiflute.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\miidance.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\alia.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\stars.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\sandstorm.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\dota.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\thejam.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\mafia.mp3",
        "Interface\\AddOns\\MemeSounds\\songs\\ocean.mp3",
    }
    local randomIndex = math.random(1, #customSongs)
    local soundPath = customSongs[randomIndex]


    _, Sh = PlaySoundFile(soundPath, "Master")

    return Sh
end






local mainFrame = CreateFrame("Frame", "WarlockMainFrame", UIParent, "BasicFrameTemplateWithInset")
mainFrame:SetSize(230, 160)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("Brainrot Options")
mainFrame:Hide()
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")

mainFrame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
    PlaySound(808)
end)

mainFrame:SetScript("OnHide", function()
    PlaySound(808)
end)

table.insert(UISpecialFrames, "WarlockMainFrame")

local startingY = -20
local yOffset = -40
local elementCount = 0


local function handleKillSoundToggle(isChecked)
    if isChecked then
        print("Brainrot Kill Sounds Enabled")
    else
        print("Brainrot Kill Sounds Disabled")
    end
end

local function handleDanceMusicToggle(isChecked)
    if isChecked then
        print("Brainrot Dance Music Enabled")
    else
        print("Brainrot Dance Music Disabled")
    end
end

local function handleLogoutMusicToggle(isChecked)
    if isChecked then
        print("Logout Music Enabled")
    else
        print("Logout Music Disabled")
    end
end

local function createCheckTextElement(parent, text, stateVariable, onClickFunction)
    local checkButton = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    local yPosition = startingY + (yOffset * elementCount)
    checkButton:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, yPosition - 10)
    checkButton.Text:SetText(text)
    checkButton:SetChecked(MyAddonDB[stateVariable])
    checkButton:SetScript("OnClick", function(self)
        local isChecked = self:GetChecked()
        MyAddonDB[stateVariable] = isChecked
        if onClickFunction then
            onClickFunction(isChecked)
        end
    end)

    elementCount = elementCount + 1
    return checkButton
end

mainFrame.killSoundsCheck = createCheckTextElement(
    mainFrame,
    "Enable brainrot kill sounds",
    "randomDeathSoundStatus",
    handleKillSoundToggle
)

mainFrame.danceMusicCheck = createCheckTextElement(
    mainFrame,
    "Enable brainrot dance music",
    "brainrotDanceMusic",
    handleDanceMusicToggle
)

mainFrame.logoutMusicCheck = createCheckTextElement(
    mainFrame,
    "Enable logout music",
    "logoutMusic",
    handleLogoutMusicToggle
)

-- MAIN FRAME CONTENT --
local addon = LibStub("AceAddon-3.0"):NewAddon("MemeSounds")
MyAddonMinimapButton = LibStub("LibDBIcon-1.0", true)

local miniButton = LibStub("LibDataBroker-1.1"):NewDataObject("MemeSounds", {
    type = "data source",
    text = "MemeSounds",
    icon = "Interface\\AddOns\\MemeSounds\\minimap.tga",
    OnClick = function(self, btn)
        if btn == "LeftButton" then
            if mainFrame:IsShown() then
                mainFrame:Hide()
            else
                mainFrame:Show()
            end
        end
    end,
})

function addon:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("MyAddonMinimapPOS", {
        profile = {
            minimap = {
                hide = false,
            },
        },
    })

    MyAddonMinimapButton:Register("MemeSounds", miniButton, self.db.profile.minimap)
end

MyAddonMinimapButton:Show("MemeSounds")


-- Combat EVENT HANDLER --
local eventListenerFrame = CreateFrame("Frame", "WarlockEventListenerFrame", UIParent)
local function eventHandler(self, event, ...)
    local _, eventType = CombatLogGetCurrentEventInfo()
    if MyAddonDB.randomDeathSoundStatus == true then
        if eventType and eventType == "PARTY_KILL" then
            playRandomSound()
        end
    end
end

eventListenerFrame:SetScript("OnEvent", eventHandler)
eventListenerFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
-- Combat EVENT HANDLER --






local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "MemeSounds" then
        LoadDatabase()

        if mainFrame and mainFrame.killSoundsCheck then
            mainFrame.killSoundsCheck:SetChecked(MyAddonDB.randomDeathSoundStatus)
        end

        if mainFrame and mainFrame.danceMusicCheck then
            mainFrame.danceMusicCheck:SetChecked(MyAddonDB.brainrotDanceMusic)
        end

        if mainFrame and mainFrame.logoutMusicCheck then
            mainFrame.logoutMusicCheck:SetChecked(MyAddonDB.logoutMusic)
        end

        print("Meme sounds Loaded")

        self:UnregisterEvent("ADDON_LOADED")
    end
end)

local isDancing = false
local currentSongHandle


local function startDanceMusic()
    if not isDancing then
        isDancing = true
        currentSongHandle = playRandomSong()
    end
end

local function stopDanceMusic()
    if isDancing then
        isDancing = false
        StopSound(currentSongHandle, 1000)
    end
end

local danceFrame = CreateFrame("Frame")
danceFrame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
danceFrame:SetScript("OnEvent", function(self, event, msg, playerName)
    if MyAddonDB.brainrotDanceMusic == true then
        if msg:lower():find("dance") and playerName == UnitName("player") then
            startDanceMusic()
        end
    end
end)

local stopFrame = CreateFrame("Frame")
stopFrame:RegisterEvent("PLAYER_STARTED_MOVING")
stopFrame:SetScript("OnEvent", function(self, event, unit)
    stopDanceMusic()
end)

local logoutSoundFrame = CreateFrame("Frame")
logoutSoundFrame:RegisterEvent("PLAYER_CAMPING")
logoutSoundFrame:RegisterEvent("PLAYER_QUITING")
logoutSoundFrame:RegisterEvent("PLAYER_STARTED_MOVING")
local loggingOut

logoutSoundFrame:SetScript("OnEvent", function(self, event)
    if MyAddonDB.logoutMusic then
        if event == "PLAYER_CAMPING" then
            loggingOut = true
            _, currentSongHandle = PlaySoundFile("Interface\\AddOns\\MemeSounds\\songs\\outro.mp3", "Master")
        elseif event == "PLAYER_QUITING" then
            loggingOut = true
            _, currentSongHandle = PlaySoundFile("Interface\\AddOns\\MemeSounds\\songs\\outro.mp3", "Master")
        elseif event == "PLAYER_STARTED_MOVING" and loggingOut then
            loggingOut = false
            StopSound(currentSongHandle, 1000)
        end
    end
end)

--[[
local enterCombatFrame = CreateFrame("Frame")
enterCombatFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
enterCombatFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")


enterCombatFrame:SetScript("OnEvent", function(event)
    print(event)
    if event == "PLAYER_ENTER_COMBAT" then
        PlaySoundFile("Interface\\AddOns\\MemeSounds\\sounds\\fuck.mp3")
    elseif event == "PLAYER_LEAVE_COMBAT" then
        PlaySoundFile("Interface\\AddOns\\MemeSounds\\sounds\\success.mp3")
    end
end) ]]
