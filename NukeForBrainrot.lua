-- =============================================================================
-- RAYFIELD SETTINGS
-- =============================================================================
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local toggleUIKeybind = Enum.KeyCode.K

local Window = Rayfield:CreateWindow({
    Name = "Nuke For Brainrot Freeware",
    Icon = 0,
    LoadingTitle = "Nuke For Brainrot Freeware",
    LoadingSubtitle = "by Pixel Core",
    ShowText = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = toggleUIKeybind,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Big Hub",
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true,
    },
})

-- =============================================================================
-- TAB AND SECTION CREATION
-- =============================================================================
local TPTab = Window:CreateTab("TP", "rewind")
local FarmTab = Window:CreateTab("Farm", "rewind")
local AutoFarmTab = Window:CreateTab("Auto Farm", "rewind")
local SettingsTab = Window:CreateTab("Settings", "rewind")
local InfoTab = Window:CreateTab("Info", "rewind")

local TPSection = TPTab:CreateSection("Teleports")
local FarmSection = FarmTab:CreateSection("Farms")
local AtofarmSection = AutoFarmTab:CreateSection("Auto Farm")
local SettingsSection = SettingsTab:CreateSection("Settings")
local InfoSection = InfoTab:CreateSection("Info")

-- =============================================================================
-- VARIABLES & GLOBALS
-- =============================================================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")

local lp = Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()
local hmrp = character:WaitForChild("HumanoidRootPart")

lp.CharacterAdded:Connect(function(newChar)
    character = newChar
    hmrp = character:WaitForChild("HumanoidRootPart")
end)

local gameArea = workspace:WaitForChild("GameArea")
local basesFolder = gameArea:WaitForChild("Bases")
local worldBrainrotsFolder = workspace:WaitForChild("WorldBrainrots")
local modifiedPackages = ReplicatedStorage:WaitForChild("ModifiedPackages")
local packetFolder = modifiedPackages:WaitForChild("Packet")
local remoteEvent = packetFolder:WaitForChild("RemoteEvent")

-- Loop-Schalter & Delay-Variablen
getgenv().FarmActive12 = false
getgenv().ClaimMoneyDelay = 0.01

getgenv().WorldBrainrotFarm = false
getgenv().HoldDuration = 0.05
getgenv().FilterMaxLevel = 145
getgenv().SelectedNamesTable = {"All"}
getgenv().SelectedModifiersTable = {"All"}

getgenv().AutoUpgradeAllLoop = false
getgenv().UpgradeAllDelay = 0.05

getgenv().AutoUpgradeSingleLoop = false
getgenv().UpgradeSingleDelay = 0.01

local startPos = hmrp.CFrame
local NameDropdown
local ModifierDropdown

-- =============================================================================
-- HELPER FUNCTIONS
-- =============================================================================
local function getMyBase()
    for _, base in ipairs(basesFolder:GetChildren()) do
        local playerInfo = base:FindFirstChild("PlayerInfo")
        if playerInfo then
            local billboard = playerInfo:FindFirstChildOfClass("BillboardGui")
            local textLabel = billboard and billboard:FindFirstChildOfClass("TextLabel")
            if textLabel and textLabel.Text == lp.Name then
                return base
            end
        end
    end
    return nil
end

local function toLower(str)
    if str == nil then return nil end
    return string.lower(tostring(str))
end

local function formatWithSpaces(str)
    if not str or str == "All" or str == "None" or str == "_1x1x1x1" then return str end
    return str:gsub("(%u)", " %1"):gsub("^%s+", "")
end

local function passesLevelFilter(brLevel)
    return (tonumber(brLevel) or 0) <= (tonumber(getgenv().FilterMaxLevel) or 145)
end

local function passesNameFilter(brType, currentNames)
    local loweredType = toLower(brType or "")
    for _, name in ipairs(currentNames) do
        local cleanName = name:gsub("%s+", "")
        local loweredName = toLower(cleanName)
        if loweredName == "all" or loweredName == loweredType then return true end
    end
    return false
end

local function passesModifierFilter(rawModifier, brType, currentModifiers)
    local loweredModifier = toLower(rawModifier)
    local loweredType = toLower(brType or "")
    for _, mod in ipairs(currentModifiers) do
        if toLower(mod) == "all" then return true end
    end
    for _, mod in ipairs(currentModifiers) do
        local cleanMod = mod:gsub("%s+", "")
        local loweredSelected = toLower(cleanMod)
        if loweredSelected ~= "all" then
            if loweredSelected == "none" then
                if loweredModifier == nil or loweredModifier == "" then return true end
            else
                if loweredModifier ~= nil and string.find(loweredModifier, loweredSelected) then
                    return true
                elseif string.find(loweredType, loweredSelected) then
                    return true
                end
            end
        end
    end
    return false
end

local function interactWithBrainrot(brPosition)
    if not hmrp then return end
    hmrp.CFrame = CFrame.new(brPosition) + Vector3.new(0, 3, 0)
    task.wait(0.005)
    remoteEvent:FireServer(unpack({ buffer.fromstring("s") }))
    task.wait(0.005)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(getgenv().HoldDuration or 0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.005)
    remoteEvent:FireServer(unpack({ buffer.fromstring("t") }))
    task.wait(0.01)
end

local function refreshBrainrotLists()
    local foundNames = {}
    local foundModifiers = {}
    local nameCheck = {}
    local modCheck = {}

    for _, brainrot in ipairs(worldBrainrotsFolder:GetChildren()) do
        if brainrot:IsA("Configuration") then
            local brType = brainrot:GetAttribute("Type")
            local brModifier = brainrot:GetAttribute("Modifiers")
            if brType and brType ~= "" and not nameCheck[brType] then
                nameCheck[brType] = true
                table.insert(foundNames, brType)
            end
            if brModifier and brModifier ~= "" then
                for mod in string.gmatch(brModifier, "([^,%s]+)") do
                    if not modCheck[mod] then
                        modCheck[mod] = true
                        table.insert(foundModifiers, mod)
                    end
                end
            end
        end
    end

    table.sort(foundNames, function(a, b) return a:lower() < b:lower() end)
    table.sort(foundModifiers, function(a, b) return a:lower() < b:lower() end)

    local uiNames = { "All" }
    local uiModifiers = { "All", "None" }
    for _, name in ipairs(foundNames) do table.insert(uiNames, formatWithSpaces(name)) end
    for _, mod in ipairs(foundModifiers) do table.insert(uiModifiers, formatWithSpaces(mod)) end

    if NameDropdown then NameDropdown:Refresh(uiNames, {"All"}) end
    if ModifierDropdown then ModifierDropdown:Refresh(uiModifiers, {"All"}) end
end

local function formatTextZuZahl(text)
    local sauber = string.gsub(text, "[%s,]", "") 
    local suffix = string.sub(sauber, -1):upper()
    local zahlTeil = tonumber(string.sub(sauber, 1, -2))
    if not zahlTeil then return tonumber(sauber) or 0 end
    local mult = {["K"]=10^3, ["M"]=10^6, ["B"]=10^9, ["T"]=10^12}
    return mult[suffix] and (zahlTeil * mult[suffix]) or (tonumber(sauber) or 0)
end

local function performUpgradeClick(upgradeButton)
    pcall(function()
        local connections = getconnections(upgradeButton.MouseButton1Click)
        local downConnections = getconnections(upgradeButton.MouseButton1Down)
        for _, conn in pairs(connections) do conn:Fire() end
        for _, conn in pairs(downConnections) do conn:Fire() end
    end)
    pcall(function()
        VirtualUser:Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(0.001)
        VirtualUser:Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    pcall(function()
        if upgradeButton.Activated then
            for _, conn in pairs(getconnections(upgradeButton.Activated)) do conn:Fire() end
        end
    end)
end

local function checkCostAndUpgrade(model)
    local displayStand = model:FindFirstChild("DisplayStand")
    local attachment = displayStand and displayStand:FindFirstChild("BrainrotAttachment")
    if not attachment or #attachment:GetChildren() == 0 then return end

    local upgradePart = model:FindFirstChild("UpgradePart")
    if not upgradePart then return end

    local surfaceGui = upgradePart:FindFirstChildOfClass("SurfaceGui")
    if not surfaceGui then return end

    local isMaxLevel = false
    for _, child in ipairs(surfaceGui:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            local rawText = tostring(child.Text)
            local cleanedText = string.upper(string.gsub(rawText, "%s+", ""))
            if string.find(cleanedText, "MAX") then
                isMaxLevel = true
                break
            end
        end
    end

    if isMaxLevel then return end

    local upgradeButton = surfaceGui:FindFirstChild("UpgradeButton", true) or surfaceGui:FindFirstChildOfClass("TextButton", true)
    if upgradeButton then
        performUpgradeClick(upgradeButton)
    end
end

-- =============================================================================
-- UI EXECUTIONS (BUTTONS, TOGGLES, SLIDERS)
-- =============================================================================

-- ----------- TP TAB -----------
TPTab:CreateButton({
    Name = "Teleport to Base",
    Callback = function()
        local baseCoordinates = {
            ["Base1"] = CFrame.new(-125.173607, 30.7489052, -2261.1438, 0.99984771, 0, -0.0174528137, 0, 1, 0, 0.0174528137, 0, 0.99984771),
            ["Base2"] = CFrame.new(-75.3132858, 30.7489052, -2261.68652, 0.99984771, -1.32206095e-08, 0.0174519829, 1.51724002e-08, 1, -1.11705369e-07, -0.0174519829, 1.11953142e-07, 0.99984771),
            ["Base3"] = CFrame.new(-25.4007492, 30.7489052, -2261.69873, 0.999961913, -2.11016253e-08, -0.00872673281, 2.11154774e-08, 1, 1.49526325e-09, 0.00872673281, -1.67947545e-09, 0.999961913),
            ["Base4"] = CFrame.new(25.2018948, 30.7489052, -2261.08032, 0.999961913, 3.0767783e-08, -0.00872675236, -3.13284829e-08, 1, -6.41143245e-08, 0.00872675236, 6.43852758e-08, 0.999961913),
            ["Base5"] = CFrame.new(74.7877502, 30.7489052, -2262.02197, 0.999961913, 1.59538693e-08, -0.00872691348, -1.5782943e-08, 1, 1.96549621e-08, 0.00872691348, -1.95164773e-08, 0.999961913)
        }
        
        local myBase = nil
        for _, base in ipairs(basesFolder:GetChildren()) do
            local playerInfo = base:FindFirstChild("PlayerInfo")
            if playerInfo then
                local billboard = playerInfo:FindFirstChildOfClass("BillboardGui")
                local textLabel = billboard and billboard:FindFirstChildOfClass("TextLabel")
                if textLabel and textLabel.Text == lp.Name then
                    myBase = base
                    local myBaseCFrame = baseCoordinates[base.Name]
                    if myBaseCFrame then
                        hmrp.CFrame = myBaseCFrame
                    end
                    break
                end
            end
        end
        task.wait(0.1)
        remoteEvent:FireServer(unpack({ buffer.fromstring("t") }))
    end,
})

TPTab:CreateButton({
    Name = "Teleport to Best Level",
    Callback = function()
        local levelPowerRequirements = {[1]=0, [2]=10, [3]=100, [4]=1000, [5]=10000, [6]=100000, [7]=10^6, [8]=10 * 10^6, [9]=100 * 10^6, [10]=10^9, [11]=10 * 10^9, [12]=100 * 10^9, [13]=10^12}
        local allLevelCoordinates = {[1]=CFrame.new(-25, 27, -2045.12598), [2]=CFrame.new(-25, 27, -1891.37598), [3]=CFrame.new(-25, 27, -1695.12598), [4]=CFrame.new(-25, 27, -1465.12598), [5]=CFrame.new(-25, 27, -1200.12598), [6]=CFrame.new(-25, 27, -870.125977), [7]=CFrame.new(-25, 27, -470.125977), [8]=CFrame.new(-25, 27, -70.1259766), [9]=CFrame.new(-25, 27, 329.874023), [10]=CFrame.new(-25, 27, 754.874023), [11]=CFrame.new(-25, 27, 1263.12402), [12]=CFrame.new(-25, 27, 1829.55396), [13]=CFrame.new(-25, 27, 2396.55396)}
        
        local pg = lp:WaitForChild("PlayerGui")
        local label = pg:FindFirstChild("CollectedText", true)
        if not label then return end
        
        local meinePower = formatTextZuZahl(label.Text)
        local gefundenesLevel = 1
        for i = 13, 1, -1 do
            if meinePower >= levelPowerRequirements[i] then
                gefundenesLevel = i
                break
            end
        end
        remoteEvent:FireServer(unpack({ buffer.fromstring("s") }))
        hmrp.CFrame = allLevelCoordinates[gefundenesLevel] + Vector3.new(0, 3, 0)
    end,
})

-- ----------- FARM TAB -----------
FarmTab:CreateButton({
    Name = "Farm Uranium Once",
    Callback = function()
        local startPosition = hmrp.CFrame
        local cameraFolder = workspace:FindFirstChild("Camera")
        if not cameraFolder then return end

        for _, model in ipairs(cameraFolder:GetChildren()) do
            if model.Name:lower() == "uranium" then
                local circle = model:FindFirstChild("Circle")
                if circle then
                    local prompt = circle:FindFirstChildOfClass("ProximityPrompt")
                    if prompt then
                        hmrp.CFrame = circle.CFrame
                        task.wait(0.1)
                        if fireproximityprompt then fireproximityprompt(prompt) end
                        task.wait(0.05)
                    end
                end
            end
        end
        task.wait(0.2)
        hmrp.CFrame = startPosition
    end,
})

FarmTab:CreateButton({
    Name = "Claim Money Once (Stands)",
    Callback = function()
        local originalPos = hmrp.CFrame
        local myBase = getMyBase()
        if not myBase then return end
        local brainrotFolder = myBase:FindFirstChild("BrainrotStands")
        if not brainrotFolder then return end

        for i = 1, 4 do
            local floor = brainrotFolder:FindFirstChild("Floor" .. i)
            if floor then
                for _, model in ipairs(floor:GetChildren()) do
                    if model.Name == "BrainrotStand" then
                        local displayStand = model:FindFirstChild("DisplayStand")
                        local attachment = displayStand and displayStand:FindFirstChild("BrainrotAttachment")
                        if attachment and #attachment:GetChildren() > 0 then
                            local collectButton = model:FindFirstChild("CollectButton")
                            local buttonPart = collectButton and (collectButton:FindFirstChild("Button") or collectButton:FindFirstChildOfClass("MeshPart"))
                            if buttonPart then
                                hmrp.CFrame = buttonPart.CFrame
                                task.wait(0.005)
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.05)
        hmrp.CFrame = originalPos
    end,
})

-- ----------- AUTO FARM TAB -----------

-- Auto Farm Settings Section
local ACMSS = AutoFarmTab:CreateSlider({
    Name = "Auto Claim Money Speed (Delay)",
    Range = {0, 0.5}, Increment = 0.01, Suffix = "sek", CurrentValue = 0.01, Flag = "ClaimMoneyDelaySlider",
    Callback = function(Value)
        local realValue = Value
        if type(Value) == "table" then realValue = Value[1] end
        getgenv().ClaimMoneyDelay = tonumber(realValue) or 0.01
    end
})

local USAS = AutoFarmTab:CreateSlider({
    Name = "Upgrade Speed All Stands (Delay)",
    Range = {0, 1}, Increment = 0.05, Suffix = "sek", CurrentValue = 0.05, Flag = "UpgradeAllDelaySlider",
    Callback = function(Value)
        local realValue = Value
        if type(Value) == "table" then realValue = Value[1] end
        getgenv().UpgradeAllDelay = tonumber(realValue) or 0.05
    end
})

local USSS = AutoFarmTab:CreateSlider({
    Name = "Upgrade Speed Single Stand (Delay)",
    Range = {0, 0.5}, Increment = 0.01, Suffix = "sek", CurrentValue = 0.01, Flag = "UpgradeSingleDelaySlider",
    Callback = function(Value)
        local realValue = Value
        if type(Value) == "table" then realValue = Value[1] end
        getgenv().UpgradeSingleDelay = tonumber(realValue) or 0.01
    end
})

local WFMLF = AutoFarmTab:CreateSlider({
    Name = "World Farm Max Level Filter (0 - 145)",
    Range = {0, 145}, Increment = 1, Suffix = "Level", CurrentValue = 145, Flag = "WorldFarmMaxLevel",
    Callback = function(Value)
        local realValue = Value
        if type(Value) == "table" then realValue = Value[1] end
        getgenv().FilterMaxLevel = tonumber(realValue) or 145
    end
})

local DropdownBrainrot = AutoFarmTab:CreateDropdown({
    Name = "Select Brainrot Names", Options = {"All"}, CurrentOption = {"All"}, MultipleOptions = true, Flag = "BrainrotNameDropdown",
    Callback = function(Options) getgenv().SelectedNamesTable = Options or {"All"} end
})

local DropdownModifier = AutoFarmTab:CreateDropdown({
    Name = "Select Modifiers / Tiers", Options = {"All", "None"}, CurrentOption = {"All"}, MultipleOptions = true, Flag = "ModifierDropdown",
    Callback = function(Options) getgenv().SelectedModifiersTable = Options or {"All"} end
})

AutoFarmTab:CreateButton({
    Name = "🔄 Refresh World-Farm Dropdowns & Live-Scan",
    Callback = function() refreshBrainrotLists() end
})

-- Auto Farm Toggles Section
AutoFarmTab:CreateToggle({
    Name = "Auto Claim Money (Stands Loop)",
    CurrentValue = false, Flag = "ClaimMoneyToggle",
    Callback = function(Value)
        getgenv().FarmActive12 = Value
        if Value then
            if hmrp then startPos = hmrp.CFrame end
            task.spawn(function()
                while getgenv().FarmActive12 do
                    local myBase = getMyBase()
                    if myBase then
                        local brainrotFolder = myBase:FindFirstChild("BrainrotStands")
                        if brainrotFolder then
                            for i = 1, 4 do
                                local floor = brainrotFolder:FindFirstChild("Floor" .. i)
                                if floor then
                                    for _, model in ipairs(floor:GetChildren()) do
                                        if not getgenv().FarmActive12 then break end
                                        if model.Name == "BrainrotStand" then
                                            local display = model:FindFirstChild("DisplayStand")
                                            local attach = display and display:FindFirstChild("BrainrotAttachment")
                                            if attach and #attach:GetChildren() > 0 then
                                                local btn = model:FindFirstChild("CollectButton")
                                                local part = btn and (btn:FindFirstChild("Button") or btn:FindFirstChildOfClass("MeshPart"))
                                                if part then
                                                    hmrp.CFrame = part.CFrame
                                                    task.wait(getgenv().ClaimMoneyDelay or 0.01)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
                if hmrp and startPos then hmrp.CFrame = startPos end
            end)
        else
            if hmrp and startPos then hmrp.CFrame = startPos end
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Start World Brainrot Farm (Matteo)",
    CurrentValue = false, Flag = "WorldFarmToggle",
    Callback = function(Value)
        getgenv().WorldBrainrotFarm = Value
        if Value then
            if hmrp then startPos = hmrp.CFrame end
            task.spawn(function()
                while getgenv().WorldBrainrotFarm do
                    if not lp.Character then task.wait(0.1) continue end
                    hmrp = lp.Character:FindFirstChild("HumanoidRootPart")
                    if not hmrp or not worldBrainrotsFolder then task.wait(0.1) continue end

                    local currentNames = getgenv().SelectedNamesTable
                    local currentModifiers = getgenv().SelectedModifiersTable
                    if #currentNames == 0 then currentNames = {"All"} end
                    if #currentModifiers == 0 then currentModifiers = {"All"} end

                    for _, brainrot in ipairs(worldBrainrotsFolder:GetChildren()) do
                        if not getgenv().WorldBrainrotFarm then break end
                        if brainrot:IsA("Configuration") then
                            local brPosition = brainrot:GetAttribute("Position")
                            local brType = brainrot:GetAttribute("Type")
                            local brModifier = brainrot:GetAttribute("Modifiers")
                            local brLevel = brainrot:GetAttribute("Level")

                            if typeof(brPosition) == "Vector3" then
                                if passesLevelFilter(brLevel) and passesNameFilter(brType, currentNames) and passesModifierFilter(brModifier, brType, currentModifiers) then
                                    interactWithBrainrot(brPosition)
                                end
                            end
                        end
                    end
                    task.wait(0.01) -- Keine Slider-Verlangsamung hier um Abstürze zu verhindern
                end
                if hmrp and startPos then hmrp.CFrame = startPos end
            end)
        else
            if hmrp and startPos then hmrp.CFrame = startPos end
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Auto Upgrade ALL Stands (Cost Check)",
    CurrentValue = false, Flag = "UpgradeAllToggle",
    Callback = function(Value)
        getgenv().AutoUpgradeAllLoop = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoUpgradeAllLoop do
                    local myBase = getMyBase()
                    if myBase then 
                        local brainrotFolder = myBase:FindFirstChild("BrainrotStands")
                        if brainrotFolder then
                            for i = 1, 4 do
                                if not getgenv().AutoUpgradeAllLoop then break end
                                local floor = brainrotFolder:FindFirstChild("Floor" .. i)
                                if floor then
                                    for _, model in ipairs(floor:GetChildren()) do
                                        if not getgenv().AutoUpgradeAllLoop then break end
                                        if model.Name == "BrainrotStand" then
                                            checkCostAndUpgrade(model)
                                            task.wait(getgenv().UpgradeAllDelay or 0.05)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

AutoFarmTab:CreateToggle({
    Name = "Auto Upgrade Floor 1 - Stand 1 (Teleport)",
    CurrentValue = false, Flag = "UpgradeSingleToggle",
    Callback = function(Value)
        getgenv().AutoUpgradeSingleLoop = Value
        if Value then
            task.spawn(function()
                local hasTeleported = false
                while getgenv().AutoUpgradeSingleLoop do
                    local myBase = getMyBase()
                    if myBase then 
                        local brainrotFolder = myBase:FindFirstChild("BrainrotStands")
                        if brainrotFolder then
                            local floor = brainrotFolder:FindFirstChild("Floor1")
                            if floor then
                                local firstStand = nil
                                for _, model in ipairs(floor:GetChildren()) do
                                    if model.Name == "BrainrotStand" then
                                        firstStand = model
                                        break
                                    end
                                end

                                if firstStand then
                                    if not hasTeleported and hmrp and firstStand:FindFirstChild("UpgradePart") then
                                        local targetPart = firstStand:FindFirstChild("UpgradePart")
                                        hmrp.CFrame = targetPart.CFrame * CFrame.new(0, 3, 4)
                                        hasTeleported = true
                                    end

                                    if getgenv().AutoUpgradeSingleLoop then
                                        checkCostAndUpgrade(firstStand)
                                    end
                                end
                            end
                        end
                    end
                    task.wait(getgenv().UpgradeSingleDelay or 0.01)
                end
            end)
        end
    end
})

-- ----------- SETTINGS TAB -----------
SettingsTab:CreateKeybind({
    Name = "Toggle UI Keybind",
    CurrentKeybind = "K", -- Change this from 'toggleUIKeybind' to a string "K"
    HoldToToggle = false,
    Flag = "UIKeybind",
    Callback = function(Keybind)
        Rayfield:SetToggleKeybind(Keybind)
    end,
})

-- ----------- INFO TAB -----------
InfoTab:CreateParagraph({Title = "Credits", Content = "Made by Pixel Core\nPremium Utilities integrated into one Interface."})

-- Automatischer Erst-Scan nach dem Laden für Dropdowns
task.spawn(function()
    task.wait(1)
    refreshBrainrotLists()
end)
