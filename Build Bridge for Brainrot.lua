local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Build Bridge for Brainrot",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Build Bridge for Brainrot",
	LoadingSubtitle = "by Pixel Core",
	ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
	Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.
})

local pl = game:GetService("Players")
local lp = pl.LocalPlayer
local rS = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local gpl = workspace:WaitForChild(lp.Name)

local bases = workspace.Bases
local hmrp = gpl:WaitForChild("HumanoidRootPart")

local myBase = nil
local baseSpawn = nil

local function getBase()
	for _, base in ipairs(bases:GetChildren()) do
		-- Wir prüfen, ob das Attribut "Owner" dem Namen des LocalPlayers entspricht
		if base:GetAttribute("Owner") == lp.Name then
			myBase = base
			baseSpawn = base:FindFirstChild("Spawn")

			print("Base gefunden: " .. base.Name)
			return base -- Gibt die Base zurück, falls du sie direkt in einer Variable brauchst
		end
	end
	warn("Keine Base für " .. lp.Name .. " gefunden!")
	return nil
end

getBase()

local Spawn = baseSpawn.CFrame + Vector3.new(0, 3, 0)
local CZ = CFrame.new(-128, 4, -50, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local EZ = CFrame.new(-128, 4, 172, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local GZ = CFrame.new(-128, 4, 844, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local LZ = CFrame.new(-128, 4, 304, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local MZ = CFrame.new(-128, 4, 457, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local OZ = CFrame.new(-128, 4, 1099, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local RZ = CFrame.new(-128, 4, 55, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)
local SZ = CFrame.new(-128, 4, 634, 1, 0, 0, 0, 1, 0, 0, 0, 1) + Vector3.new(0, 3, 0)

local Get = Window:CreateTab("Get", "plus")
local Upgrade = Window:CreateTab("Upgrade", "arrow-big-up-dash")
local Teleport = Window:CreateTab("Teleport", "map-pin")

local GetWood = Get:CreateButton({
	Name = "Get Wood",
	Callback = function()
		local args = {
			"4",
			1,
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TreeEvent"):FireServer(unpack(args))
	end,
})

local isSpamming = false -- Status-Variable

local SpamGetWood = Get:CreateToggle({
	Name = "Spam Get Wood",
	CurrentValue = false,
	Flag = "SGW",
	Callback = function(Value)
		isSpamming = Value -- Setzt den Status auf true oder false

		if Value then
			task.spawn(function()
				while isSpamming do
					local args = { "4", 1 }
					game:GetService("ReplicatedStorage")
						:WaitForChild("Remotes")
						:WaitForChild("TreeEvent")
						:FireServer(unpack(args))
					task.wait(0.1)
				end
			end)
		end
	end,
})

local ShopUpgradeSection = Upgrade:CreateSection("Shop Upgrades")

local ShopSelect = "Capacity"

local UpgradeShop = Upgrade:CreateDropdown({
	Name = "Shop Upgrade",
	Options = { "Storage", "Damage", "Carry" },
	CurrentOption = { "Storage" },
	MultipleOptions = false,
	Flag = "Dropdown1",
	Callback = function(Options)
		-- Da MultipleOptions false ist, nehmen wir das erste Element der Tabelle
		local Selection = Options[1]

		if Selection == "Storage" then
			ShopSelect = "Capacity"
		elseif Selection == "Damage" then
			ShopSelect = "Damage"
		elseif Selection == "Carry" then -- Nutze elseif statt else
			ShopSelect = "Carry"
		end

		print("Ausgewähltes Upgrade: " .. tostring(ShopSelect)) -- Debugging
	end,
})

local UpgradeShopExec = Upgrade:CreateButton({
	Name = "Upgrade Selected",
	Callback = function()
		local args = {
			ShopSelect,
			1,
		}
		game:GetService("ReplicatedStorage")
			:WaitForChild("Remotes")
			:WaitForChild("BuyUpgradeEvent")
			:FireServer(unpack(args))
	end,
})

local IsSpammingUpgrade = false

local SpamUSE = Upgrade:CreateToggle({
	Name = "Spam Shop Upgrade",
	CurrentValue = false,
	Flag = "SSW",
	Callback = function(Value)
		IsSpammingUpgrade = Value -- Setzt den Status auf true oder false

		if Value then
			task.spawn(function()
				while IsSpammingUpgrade do
					local args = {
						ShopSelect,
						1,
					}
					game:GetService("ReplicatedStorage")
						:WaitForChild("Remotes")
						:WaitForChild("BuyUpgradeEvent")
						:FireServer(unpack(args))
					task.wait(0.1)
				end
			end)
		end
	end,
})

local BaseUpgradeSection = Upgrade:CreateSection("Base Upgrades")

local UpgradeBase = Upgrade:CreateButton({
	Name = "Upgrade Base",
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BaseUpgradeEvent"):FireServer()
	end,
})

local IsSpammingUpgradeBase = false

local SpamBU = Upgrade:CreateToggle({
	Name = "Spam Base Upgrade",
	CurrentValue = false,
	Flag = "SSW",
	Callback = function(Value)
		IsSpammingUpgradeBase = Value -- Setzt den Status auf true oder false

		if Value then
			task.spawn(function()
				while IsSpammingUpgradeBase do
					game:GetService("ReplicatedStorage")
						:WaitForChild("Remotes")
						:WaitForChild("BaseUpgradeEvent")
						:FireServer()
					task.wait(0.1)
				end
			end)
		end
	end,
})

local BrainrotUpgradeSection = Upgrade:CreateSection("Brainrot Upgrades")

local SelectedSlot = 1

local BrainrotSlotInput = Upgrade:CreateInput({
	Name = "Slot to Upgrade",
	CurrentValue = "",
	PlaceholderText = "Input the Slot you want to upgrade",
	RemoveTextAfterFocusLost = false,
	Flag = "Input1",
	Callback = function(Text)
		SelectedSlot = tonumber(Text)
	end,
})

local BrainrotUE = Upgrade:CreateButton({
   Name = "Upgrade Selected Slot",
   Callback = function()
        local args = {
	        SelectedSlot
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeBrainrotEvent"):FireServer(unpack(args))
   end,
})

isSpammingBUE = false

local spamBUE = Upgrade:CreateToggle({
    Name = "Spam Brainrot Upgrade",
    CurrentValue = false,
    Flag = "SBU",
    Callback = function(Value)
        local IsSpammingBUE = Value -- Setzt den Status auf true oder false

        if Value then
            task.spawn(function()
                while IsSpammingBUE do
                    local args = {
	                    SelectedSlot
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeBrainrotEvent"):FireServer(unpack(args))
                    task.wait(0.1)
                end
            end)
        end
    end,
})

local TeleportSpawn = Teleport:CreateButton({
	Name = "Teleport to Spawn",
	Callback = function()
		hmrp.CFrame = Spawn
	end,
})

local TeleportC = Teleport:CreateButton({
	Name = "Teleport to Common Area",
	Callback = function()
		hmrp.CFrame = CZ
	end,
})

local TeleportR = Teleport:CreateButton({
	Name = "Teleport to Rare Area",
	Callback = function()
		hmrp.CFrame = RZ
	end,
})

local TeleportE = Teleport:CreateButton({
	Name = "Teleport to Epic Area",
	Callback = function()
		hmrp.CFrame = EZ
	end,
})

local TeleportL = Teleport:CreateButton({
	Name = "Teleport to Legendary Area",
	Callback = function()
		hmrp.CFrame = LZ
	end,
})

local TeleportM = Teleport:CreateButton({
	Name = "Teleport to Mythic Area",
	Callback = function()
		hmrp.CFrame = MZ
	end,
})

local TeleportS = Teleport:CreateButton({
	Name = "Teleport to Secret Area",
	Callback = function()
		hmrp.CFrame = SZ
	end,
})

local TeleportG = Teleport:CreateButton({
	Name = "Teleport to God Area",
	Callback = function()
		hmrp.CFrame = GZ
	end,
})

local TeleportO = Teleport:CreateButton({
	Name = "Teleport to OG Area",
	Callback = function()
		hmrp.CFrame = OZ
	end,
})

local ExitG = Get:CreateButton({
	Name = "Exit Menu",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local ExitU = Upgrade:CreateButton({
	Name = "Exit Menu",
	Callback = function()
		Rayfield:Destroy()
	end,
})
local ExitT = Teleport:CreateButton({
	Name = "Exit Menu",
	Callback = function()
		Rayfield:Destroy()
	end,
})
