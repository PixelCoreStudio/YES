-- 1. RAYFIELD CONFIGURATION
getgenv().SecureMode = true 
getgenv().RAYFIELD_ASSET_ID = 71610839412678

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Variables
local foundIDs = {}
local manualID = ""
local isSpammingManual = false
local selectedPlayers = {} 
local isSpammingPlayer = false

-- Config Variables (Defaults)
local notificationsEnabled = true
local actionNotificationsEnabled = true
local autoSearchEnabled = false

-- ==========================================
-- DIE UNIVERSELLE KERN-FUNKTION
-- ==========================================
local function fireUniversal(targetPlayer, id)
    if not id or id == "" then return end
    local targetID = tonumber(id)
    if not targetID then return end
    
    MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, targetID, true)

    if targetPlayer then
        pcall(function()
            LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Troll"):WaitForChild("Troll"):WaitForChild("TrollBtn"):WaitForChild("LocalScript"):WaitForChild("RemoteEvent"):FireServer(targetPlayer.Name)
        end)
    end
end

-- ==========================================
-- SCAN FUNCTION (Deep Scan)
-- ==========================================
local function runDeepScan()
    task.spawn(function()
        for _, v in pairs(game:GetDescendants()) do
            pcall(function()
                if v:IsA("NumberValue") or v:IsA("IntValue") or v:IsA("StringValue") then
                    local name = v.Name:lower()
                    if name:find("id") or name:find("pass") or name:find("product") then
                        local id = tonumber(v.Value)
                        if _G.handleNewID then _G.handleNewID(id, Enum.InfoType.Product) end
                    end
                end
            end)
        end
    end)
end

local Window = Rayfield:CreateWindow({
    Name = "Universal Fake Purchase Tool",
    Icon = 0,
    LoadingTitle = "Pixel Core Loader",
    LoadingSubtitle = "Configuration Saving Enabled",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Universal Fake Purchase Tool by Pixel Core", 
        FileName = "Settings Data and more"
    },
    KeySystem = false,
})

-- TABS
local FinderTab = Window:CreateTab("Finder", "eye")
local ActionsTab = Window:CreateTab("Actions", "play")
local PlayerTab = Window:CreateTab("Players", "users")
local SettingsTab = Window:CreateTab("Settings", "settings")

-- 1. FINDER LOGIC
_G.handleNewID = function(id, infoType)
    if not id or foundIDs[id] then return end
    
    local itemName = "Unknown"
    local itemEmoji = (infoType == Enum.InfoType.GamePass) and "🎫" or "🛒"
    
    pcall(function()
        local info = MarketplaceService:GetProductInfo(id, infoType)
        itemName = info.Name
    end)

    if itemName == "Unknown" or itemName == "" then return end
    foundIDs[id] = true

    FinderTab:CreateButton({
       Name = itemEmoji .. " " .. itemName .. " [" .. tostring(id) .. "]",
       Callback = function()
           setclipboard(tostring(id))
           if actionNotificationsEnabled then
               Rayfield:Notify({Title = "Copied!", Content = "ID copied to clipboard", Duration = 2})
           end
       end,
    })

    ActionsTab:CreateButton({
        Name = itemName,
        Callback = function()
            manualID = tostring(id)
            task.spawn(function()
                if #selectedPlayers > 0 then
                    for _, name in pairs(selectedPlayers) do
                        local target = Players:FindFirstChild(name)
                        if target then fireUniversal(target, id) end
                    end
                else
                    for _, v in pairs(Players:GetPlayers()) do
                        if v == LocalPlayer then continue end
                        fireUniversal(v, id)
                        task.wait(0.05)
                    end
                end
            end)
        end,
    })

    if notificationsEnabled then
        Rayfield:Notify({Title = itemEmoji .. " Action Found", Content = "Added " .. itemName, Duration = 6.5})
    end
end

FinderTab:CreateButton({
   Name = "🔍 Scan Game for Assets (Search)",
   Callback = function()
       Rayfield:Notify({Title = "Scanning...", Content = "Searching...", Duration = 3})
       runDeepScan()
   end,
})

FinderTab:CreateLabel("If the search finds nothing, this game likely uses server-side checks or has no exploitable purchase IDs.")
FinderTab:CreateSection("Found Results")

-- 2. ACTIONS TAB
ActionsTab:CreateInput({
   Name = "Manual Target ID",
   PlaceholderText = "Paste ID here...",
   Callback = function(Text) manualID = Text end,
})

ActionsTab:CreateButton({
   Name = "Send Signal to Server (Manual ID)",
   Callback = function()
       if manualID ~= "" then
           fireUniversal(nil, manualID) 
           if actionNotificationsEnabled then
               Rayfield:Notify({Title = "Sent", Content = "Signal fired for ID: " .. manualID, Duration = 2})
           end
       end
   end,
})

ActionsTab:CreateToggle({
   Name = "Spam Manual ID Signal",
   CurrentValue = false,
   Callback = function(Value)
       isSpammingManual = Value
       if Value then
           task.spawn(function()
               while isSpammingManual do
                   fireUniversal(nil, manualID)
                   task.wait(0.1)
               end
           end)
       end
   end,
})

ActionsTab:CreateSection("Dynamic Shortcuts")

-- 3. PLAYER TAB
local PlayerDropdown = PlayerTab:CreateDropdown({
   Name = "Select Target Players",
   Options = {"Searching..."}, 
   CurrentOption = {},
   MultipleOptions = true, 
   Flag = "SelectedPlayers",
   Callback = function(Options) selectedPlayers = Options end,
})

local function refreshPlayerList()
    local pList = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then table.insert(pList, v.Name) end
    end
    pcall(function() PlayerDropdown:Refresh(#pList > 0 and pList or {"No players found"}, true) end)
end

PlayerTab:CreateButton({ Name = "Refresh List", Callback = refreshPlayerList })

PlayerTab:CreateButton({
   Name = "Execute Once (Targeted)",
   Callback = function()
       for _, name in pairs(selectedPlayers) do
           local target = Players:FindFirstChild(name)
           if target then fireUniversal(target, manualID) end
       end
   end,
})

PlayerTab:CreateToggle({
   Name = "Spam Targeted Players",
   CurrentValue = false,
   Callback = function(Value)
       isSpammingPlayer = Value
       if Value then
           task.spawn(function()
               while isSpammingPlayer do
                   for _, name in pairs(selectedPlayers) do
                       if not isSpammingPlayer then break end
                       local target = Players:FindFirstChild(name)
                       if target then fireUniversal(target, manualID) end
                   end
                   task.wait(0.1)
               end
           end)
       end
   end,
})

PlayerTab:CreateLabel("⚠️ Execution for others is not guaranteed and carries a risk of bans due to game security.")

-- 4. SETTINGS TAB
SettingsTab:CreateSection("Saveable Settings")

SettingsTab:CreateToggle({
   Name = "Auto Search on Startup",
   CurrentValue = false,
   Flag = "AutoSearch", 
   Callback = function(Value) 
       autoSearchEnabled = Value 
   end,
})

SettingsTab:CreateToggle({
   Name = "ID Found Notifications",
   CurrentValue = true,
   Flag = "IdNotifs", 
   Callback = function(Value) 
       notificationsEnabled = Value 
   end,
})

SettingsTab:CreateToggle({
   Name = "Action Notifications",
   CurrentValue = true,
   Flag = "ActionNotifs", 
   Callback = function(Value) 
       actionNotificationsEnabled = Value 
   end,
})

SettingsTab:CreateButton({Name = "Exit Menu", Callback = function() Rayfield:Destroy() end})

-- LISTENERS
Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)
task.spawn(function() task.wait(1.5) refreshPlayerList() end)

MarketplaceService.PromptPurchaseRequested:Connect(function(plr, id, infoType) if _G.handleNewID then _G.handleNewID(id, infoType) end end)
MarketplaceService.PromptProductPurchaseFinished:Connect(function(plr, id, bought) if _G.handleNewID then _G.handleNewID(id, Enum.InfoType.Product) end end)
MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(plr, id, bought) if _G.handleNewID then _G.handleNewID(id, Enum.InfoType.GamePass) end end)

-- INITIALIZE CONFIG LOADING
Rayfield:LoadConfiguration()

-- STARTUP ACTIONS
task.spawn(function()
    task.wait(3) -- Delay für Config-Load
    if autoSearchEnabled then
        Rayfield:Notify({Title = "Auto Search", Content = "Starting automatic asset scan...", Duration = 3})
        runDeepScan()
    end
end)
