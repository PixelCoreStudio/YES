--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 40 | Scripts: 2 | Modules: 0 | Tags: 0
local G2L = {}

-- StarterGui.GeneratedUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
G2L["1"]["Name"] = [[GeneratedUI]]
G2L["1"]["ResetOnSpawn"] = false

-- StarterGui.GeneratedUI.BG
G2L["2"] = Instance.new("Frame", G2L["1"])
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["2"]["Size"] = UDim2.new(0, 650, 0, 400)
G2L["2"]["Position"] = UDim2.new(0, 460, 0, 184)
G2L["2"]["Name"] = [[BG]]

-- StarterGui.GeneratedUI.BG.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"])
G2L["3"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.UIStroke
G2L["4"] = Instance.new("UIStroke", G2L["2"])
G2L["4"]["Thickness"] = 1.2
G2L["4"]["Color"] = Color3.fromRGB(76, 55, 125)

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF
G2L["5"] = Instance.new("Frame", G2L["2"])
G2L["5"]["Size"] = UDim2.new(0, 149, 0, 400)
G2L["5"]["Name"] = [[DESIGN_STUFF]]
G2L["5"]["BackgroundTransparency"] = 1

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.SIDEBAR
G2L["6"] = Instance.new("Frame", G2L["5"])
G2L["6"]["Size"] = UDim2.new(0, 149, 0, 400)
G2L["6"]["Name"] = [[SIDEBAR]]
G2L["6"]["BackgroundTransparency"] = 1

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.SIDEBAR.SIDEBAR_PART_1
G2L["7"] = Instance.new("Frame", G2L["6"])
G2L["7"]["ZIndex"] = 3
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(34, 31, 42)
G2L["7"]["Size"] = UDim2.new(0, 149, 0, 400)
G2L["7"]["Name"] = [[SIDEBAR_PART_1]]

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.SIDEBAR.SIDEBAR_PART_1.UICorner
G2L["8"] = Instance.new("UICorner", G2L["7"])
G2L["8"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.SIDEBAR.SIDEBAR_PART_2
G2L["9"] = Instance.new("Frame", G2L["6"])
G2L["9"]["ZIndex"] = 2
G2L["9"]["BorderSizePixel"] = 0
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(34, 31, 42)
G2L["9"]["Size"] = UDim2.new(0, 72, 0, 400)
G2L["9"]["Position"] = UDim2.new(0, 77, 0, 0)
G2L["9"]["Name"] = [[SIDEBAR_PART_2]]

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.SIDEBAR.SIDEBAR_PART_2.UIStroke
G2L["a"] = Instance.new("UIStroke", G2L["9"])
G2L["a"]["Thickness"] = 1.2
G2L["a"]["Color"] = Color3.fromRGB(76, 55, 125)

-- StarterGui.GeneratedUI.BG.DESIGN_STUFF.LOGO
G2L["b"] = Instance.new("ImageLabel", G2L["5"])
G2L["b"]["ZIndex"] = 4
G2L["b"]["Image"] = [[rbxassetid://130018567483934]]
G2L["b"]["Size"] = UDim2.new(0, 116, 0, 41)
G2L["b"]["BackgroundTransparency"] = 1
G2L["b"]["Name"] = [[LOGO]]
G2L["b"]["Position"] = UDim2.new(0, 19, 0, 15)

-- StarterGui.GeneratedUI.BG.TABS_BTN
G2L["c"] = Instance.new("Frame", G2L["2"])
G2L["c"]["ZIndex"] = 5
G2L["c"]["Size"] = UDim2.new(0, 102, 0, 283)
G2L["c"]["Position"] = UDim2.new(0, 25, 0, 71)
G2L["c"]["Name"] = [[TABS_BTN]]
G2L["c"]["BackgroundTransparency"] = 1

-- StarterGui.GeneratedUI.BG.TABS_BTN.FINDER_TAB
G2L["d"] = Instance.new("TextButton", G2L["c"])
G2L["d"]["TextSize"] = 16
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(111, 87, 176)
G2L["d"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["d"]["ZIndex"] = 10
G2L["d"]["Size"] = UDim2.new(0, 100, 0, 47)
G2L["d"]["Text"] = [[Finder]]
G2L["d"]["Name"] = [[FINDER_TAB]]

-- StarterGui.GeneratedUI.BG.TABS_BTN.FINDER_TAB.UICorner
G2L["e"] = Instance.new("UICorner", G2L["d"])
G2L["e"]["CornerRadius"] = UDim.new(0, 13)

-- StarterGui.GeneratedUI.BG.TABS_BTN.ACTION_TAB
G2L["f"] = Instance.new("TextButton", G2L["c"])
G2L["f"]["TextSize"] = 16
G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(43, 39, 54)
G2L["f"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["f"]["ZIndex"] = 10
G2L["f"]["Size"] = UDim2.new(0, 100, 0, 47)
G2L["f"]["Text"] = [[Action]]
G2L["f"]["Name"] = [[ACTION_TAB]]
G2L["f"]["Position"] = UDim2.new(0, 0, 0, 59)

-- StarterGui.GeneratedUI.BG.TABS_BTN.ACTION_TAB.UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"])
G2L["10"]["CornerRadius"] = UDim.new(0, 13)

-- StarterGui.GeneratedUI.BG.TABS_BTN.PLAYER_TAB
G2L["11"] = Instance.new("TextButton", G2L["c"])
G2L["11"]["TextSize"] = 16
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(43, 39, 54)
G2L["11"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["11"]["ZIndex"] = 10
G2L["11"]["Size"] = UDim2.new(0, 100, 0, 47)
G2L["11"]["Text"] = [[Player]]
G2L["11"]["Name"] = [[PLAYER_TAB]]
G2L["11"]["Position"] = UDim2.new(0, 0, 0, 118)

-- StarterGui.GeneratedUI.BG.TABS_BTN.PLAYER_TAB.UICorner
G2L["12"] = Instance.new("UICorner", G2L["11"])
G2L["12"]["CornerRadius"] = UDim.new(0, 13)

-- StarterGui.GeneratedUI.BG.TABS_BTN.SETTINGS_TAB
G2L["13"] = Instance.new("TextButton", G2L["c"])
G2L["13"]["TextSize"] = 16
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(43, 39, 54)
G2L["13"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["13"]["ZIndex"] = 10
G2L["13"]["Size"] = UDim2.new(0, 100, 0, 47)
G2L["13"]["Text"] = [[Settings]]
G2L["13"]["Name"] = [[SETTINGS_TAB]]
G2L["13"]["Position"] = UDim2.new(0, 0, 0, 177)

-- StarterGui.GeneratedUI.BG.TABS_BTN.SETTINGS_TAB.UICorner
G2L["14"] = Instance.new("UICorner", G2L["13"])
G2L["14"]["CornerRadius"] = UDim.new(0, 13)

-- StarterGui.GeneratedUI.BG.TABS_BTN.INFO_TAB
G2L["15"] = Instance.new("TextButton", G2L["c"])
G2L["15"]["TextSize"] = 16
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(43, 39, 54)
G2L["15"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["15"]["ZIndex"] = 10
G2L["15"]["Size"] = UDim2.new(0, 100, 0, 47)
G2L["15"]["Text"] = [[Info]]
G2L["15"]["Name"] = [[INFO_TAB]]
G2L["15"]["Position"] = UDim2.new(0, 2, 0, 236)

-- StarterGui.GeneratedUI.BG.TABS_BTN.INFO_TAB.UICorner
G2L["16"] = Instance.new("UICorner", G2L["15"])
G2L["16"]["CornerRadius"] = UDim.new(0, 13)

-- StarterGui.GeneratedUI.BG.DRAG
G2L["17"] = Instance.new("LocalScript", G2L["2"])
G2L["17"]["Name"] = [[DRAG]]

-- StarterGui.GeneratedUI.BG.MENU_CONTROLL_BUTTON
G2L["18"] = Instance.new("Frame", G2L["2"])
G2L["18"]["ZIndex"] = 2
G2L["18"]["BorderSizePixel"] = 0
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["18"]["Size"] = UDim2.new(0, 50, 0, 30)
G2L["18"]["Position"] = UDim2.new(0.86923, 0, 0.0075, 0)
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["18"]["Name"] = [[MENU_CONTROLL_BUTTON]]
G2L["18"]["BackgroundTransparency"] = 1

-- StarterGui.GeneratedUI.BG.MENU_CONTROLL_BUTTON.MINIMIZY_BTN
G2L["19"] = Instance.new("TextButton", G2L["18"])
G2L["19"]["BorderSizePixel"] = 0
G2L["19"]["TextSize"] = 16
G2L["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["19"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["19"]["ZIndex"] = 2
G2L["19"]["BackgroundTransparency"] = 1
G2L["19"]["Size"] = UDim2.new(0, 20, 0, 20)
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["19"]["Text"] = [[-]]
G2L["19"]["Name"] = [[MINIMIZY_BTN]]
G2L["19"]["Position"] = UDim2.new(-0.01077, 0, 0.12, 0)

-- StarterGui.GeneratedUI.BG.MENU_CONTROLL_BUTTON.CLOSE_BTN
G2L["1a"] = Instance.new("TextButton", G2L["18"])
G2L["1a"]["BorderSizePixel"] = 0
G2L["1a"]["TextSize"] = 16
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1a"]["FontFace"] =
	Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["1a"]["ZIndex"] = 2
G2L["1a"]["BackgroundTransparency"] = 1
G2L["1a"]["Size"] = UDim2.new(0, 20, 0, 20)
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["1a"]["Text"] = [[X]]
G2L["1a"]["Name"] = [[CLOSE_BTN]]
G2L["1a"]["Position"] = UDim2.new(0.55539, 0, 0.12, 0)

-- StarterGui.GeneratedUI.BG.IsVisible
G2L["1b"] = Instance.new("BoolValue", G2L["2"])
G2L["1b"]["Name"] = [[IsVisible]]
G2L["1b"]["Value"] = true

-- StarterGui.GeneratedUI.BG.MAIN
G2L["1c"] = Instance.new("LocalScript", G2L["2"])
G2L["1c"]["Name"] = [[MAIN]]

-- StarterGui.GeneratedUI.BG.TABS
G2L["1d"] = Instance.new("Frame", G2L["2"])
G2L["1d"]["BorderSizePixel"] = 0
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["1d"]["Size"] = UDim2.new(0, 650, 0, 400)
G2L["1d"]["Position"] = UDim2.new(0.00923, 0, -0.001, 0)
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["1d"]["Name"] = [[TABS]]
G2L["1d"]["BackgroundTransparency"] = 1

-- StarterGui.GeneratedUI.BG.TABS.UICorner
G2L["1e"] = Instance.new("UICorner", G2L["1d"])
G2L["1e"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.TABS.FINDER
G2L["1f"] = Instance.new("Frame", G2L["1d"])
G2L["1f"]["BorderSizePixel"] = 0
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["1f"]["Size"] = UDim2.new(0, 650, 0, 399)
G2L["1f"]["Position"] = UDim2.new(-0.00923, 0, 0.001, 0)
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["1f"]["Name"] = [[FINDER]]

-- StarterGui.GeneratedUI.BG.TABS.FINDER.UICorner
G2L["20"] = Instance.new("UICorner", G2L["1f"])
G2L["20"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.TABS.ACTION
G2L["21"] = Instance.new("Frame", G2L["1d"])
G2L["21"]["Visible"] = false
G2L["21"]["BorderSizePixel"] = 0
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["21"]["Size"] = UDim2.new(0, 650, 0, 399)
G2L["21"]["Position"] = UDim2.new(-0.00923, 0, 0.001, 0)
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["21"]["Name"] = [[ACTION]]

-- StarterGui.GeneratedUI.BG.TABS.ACTION.UICorner
G2L["22"] = Instance.new("UICorner", G2L["21"])
G2L["22"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.TABS.PLAYER
G2L["23"] = Instance.new("Frame", G2L["1d"])
G2L["23"]["Visible"] = false
G2L["23"]["BorderSizePixel"] = 0
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["23"]["Size"] = UDim2.new(0, 650, 0, 399)
G2L["23"]["Position"] = UDim2.new(-0.00923, 0, 0.001, 0)
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["23"]["Name"] = [[PLAYER]]

-- StarterGui.GeneratedUI.BG.TABS.PLAYER.UICorner
G2L["24"] = Instance.new("UICorner", G2L["23"])
G2L["24"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.TABS.SETTINGS
G2L["25"] = Instance.new("Frame", G2L["1d"])
G2L["25"]["Visible"] = false
G2L["25"]["BorderSizePixel"] = 0
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["25"]["Size"] = UDim2.new(0, 650, 0, 399)
G2L["25"]["Position"] = UDim2.new(-0.00923, 0, 0.001, 0)
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["25"]["Name"] = [[SETTINGS]]

-- StarterGui.GeneratedUI.BG.TABS.SETTINGS.UICorner
G2L["26"] = Instance.new("UICorner", G2L["25"])
G2L["26"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.TABS.INFO
G2L["27"] = Instance.new("Frame", G2L["1d"])
G2L["27"]["Visible"] = false
G2L["27"]["BorderSizePixel"] = 0
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27)
G2L["27"]["Size"] = UDim2.new(0, 650, 0, 399)
G2L["27"]["Position"] = UDim2.new(-0.00923, 0, 0.001, 0)
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
G2L["27"]["Name"] = [[INFO]]

-- StarterGui.GeneratedUI.BG.TABS.INFO.UICorner
G2L["28"] = Instance.new("UICorner", G2L["27"])
G2L["28"]["CornerRadius"] = UDim.new(0, 50)

-- StarterGui.GeneratedUI.BG.DRAG
local function C_17()
	local script = G2L["17"]
	local UserInputService = game:GetService("UserInputService")

	local gui = script.Parent

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position =
			UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch
		then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if
			input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch
		then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
task.spawn(C_17)
-- StarterGui.GeneratedUI.BG.MAIN
local function C_1c()
	local script = G2L["1c"]
	--[[ VARIABLES ]]
	--
	local mainUI = script.Parent
	local tabsBTNS = mainUI.TABS_BTN
	local IsVisible = mainUI.IsVisible
	local uIS = game:GetService("UserInputService")

	--[[ BUTTONS ]]
	--
	local mBTN = mainUI.MENU_CONTROLL_BUTTON.MINIMIZY_BTN
	local cBTN = mainUI.MENU_CONTROLL_BUTTON.CLOSE_BTN
	local finderBTN = tabsBTNS.FINDER_TAB
	local actionBTN = tabsBTNS.ACTION_TAB
	local playerBTN = tabsBTNS.PLAYER_TAB
	local settingsBTN = tabsBTNS.SETTINGS_TAB
	local infoBTN = tabsBTNS.INFO_TAB

	--[[ TABS ]]
	--
	local finderTab = mainUI.TABS.FINDER
	local actionTab = mainUI.TABS.ACTION
	local playerTab = mainUI.TABS.PLAYER
	local settingsTab = mainUI.TABS.SETTINGS
	local infoTab = mainUI.TABS.INFO

	--[[ KEYS ]]
	--
	local uiToggleKey = Enum.KeyCode.Insert

	--[[ FUNCTIONS ]]
	--
	local function toggleUI()
		IsVisible.Value = not IsVisible.Value
	end

	--[[ INPUT ]]
	--
	uIS.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end
		if input.KeyCode == uiToggleKey then
			toggleUI()
		end
	end)

	--[[ CHANGE CHECK ]]
	--
	IsVisible.Changed:Connect(function()
		mainUI.Visible = IsVisible.Value
	end)

	--[[ BUTTONS FUNCTIONS]]
	--

	finderBTN.MouseButton1Click:Connect(function()
		finderTab.Visible = true
		actionTab.Visible = false
		playerTab.Visible = false
		settingsTab.Visible = false
		infoTab.Visible = false
		finderBTN.BackgroundColor3 = Color3.fromRGB(110, 86, 175)
		actionBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		playerBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		settingsBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		infoBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
	end)

	actionBTN.MouseButton1Click:Connect(function()
		finderTab.Visible = false
		actionTab.Visible = true
		playerTab.Visible = false
		settingsTab.Visible = false
		infoTab.Visible = false
		finderBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		actionBTN.BackgroundColor3 = Color3.fromRGB(110, 86, 175)
		playerBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		settingsBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		infoBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
	end)

	playerBTN.MouseButton1Click:Connect(function()
		finderTab.Visible = false
		actionTab.Visible = false
		playerTab.Visible = true
		settingsTab.Visible = false
		infoTab.Visible = false
		finderBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		actionBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		playerBTN.BackgroundColor3 = Color3.fromRGB(110, 86, 175)
		settingsBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		infoBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
	end)

	settingsBTN.MouseButton1Click:Connect(function()
		finderTab.Visible = false
		actionTab.Visible = false
		playerTab.Visible = false
		settingsTab.Visible = true
		infoTab.Visible = false
		finderBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		actionBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		playerBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		settingsBTN.BackgroundColor3 = Color3.fromRGB(110, 86, 175)
		infoBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
	end)

	infoBTN.MouseButton1Click:Connect(function()
		finderTab.Visible = false
		actionTab.Visible = false
		playerTab.Visible = false
		settingsTab.Visible = false
		infoTab.Visible = true
		finderBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		actionBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		playerBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		settingsBTN.BackgroundColor3 = Color3.fromRGB(42, 38, 53)
		infoBTN.BackgroundColor3 = Color3.fromRGB(110, 86, 175)
	end)

	mBTN.MouseButton1Click:Connect(function()
		toggleUI()
	end)

	cBTN.MouseButton1Click:Connect(function()
		mainUI.Parent:Remove()
	end)
end

task.spawn(C_1c)

----------------------------------------------------------------
-- FB.lua LOGIK + UI INTEGRATION (AM ENDE EINGEFÜGT)
----------------------------------------------------------------

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local foundIDs = {}
local manualID = ""
local isSpammingManual = false
local selectedPlayers = {}
local isSpammingPlayer = false

local notificationsEnabled = true
local actionNotificationsEnabled = true
local autoSearchEnabled = false

----------------------------------------------------
-- UI ERWEITERUNG FINDER TAB
----------------------------------------------------

local FinderScroll = Instance.new("ScrollingFrame")
FinderScroll.Name = "FinderScroll"
FinderScroll.Parent = G2L["1f"]
FinderScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
FinderScroll.BorderSizePixel = 0
FinderScroll.Position = UDim2.new(0, 160, 0, 20)
FinderScroll.Size = UDim2.new(0, 460, 0, 350)
FinderScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
FinderScroll.ScrollBarThickness = 4

local FinderLayout = Instance.new("UIListLayout")
FinderLayout.Parent = FinderScroll
FinderLayout.Padding = UDim.new(0, 6)

local ScanButton = Instance.new("TextButton")
ScanButton.Parent = G2L["1f"]
ScanButton.Size = UDim2.new(0, 180, 0, 40)
ScanButton.Position = UDim2.new(0, 170, 0, 350)
ScanButton.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
ScanButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanButton.Font = Enum.Font.FredokaOne
ScanButton.Text = "SCAN GAME"

----------------------------------------------------
-- ACTION TAB UI
----------------------------------------------------

local ManualBox = Instance.new("TextBox")
ManualBox.Parent = G2L["21"]
ManualBox.Size = UDim2.new(0, 300, 0, 40)
ManualBox.Position = UDim2.new(0, 170, 0, 40)
ManualBox.PlaceholderText = "Paste Product ID..."
ManualBox.Text = ""
ManualBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ManualBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Parent = G2L["21"]
ExecuteButton.Size = UDim2.new(0, 300, 0, 40)
ExecuteButton.Position = UDim2.new(0, 170, 0, 100)
ExecuteButton.Text = "EXECUTE SIGNAL"
ExecuteButton.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local SpamButton = Instance.new("TextButton")
SpamButton.Parent = G2L["21"]
SpamButton.Size = UDim2.new(0, 300, 0, 40)
SpamButton.Position = UDim2.new(0, 170, 0, 160)
SpamButton.Text = "SPAM OFF"
SpamButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpamButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local QuickActionLabel = Instance.new("TextLabel")
QuickActionLabel.Parent = G2L["21"]
QuickActionLabel.Size = UDim2.new(0, 300, 0, 30)
QuickActionLabel.Position = UDim2.new(0, 170, 0, 220)
QuickActionLabel.BackgroundTransparency = 1
QuickActionLabel.Text = "QUICK ACTIONS"
QuickActionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickActionLabel.Font = Enum.Font.FredokaOne
QuickActionLabel.TextSize = 18

local QuickActionLabel = Instance.new("TextLabel")
QuickActionLabel.Parent = G2L["21"]
QuickActionLabel.Size = UDim2.new(0, 300, 0, 30)
QuickActionLabel.Position = UDim2.new(0, 170, 0, 220)
QuickActionLabel.BackgroundTransparency = 1
QuickActionLabel.Text = "QUICK ACTIONS"
QuickActionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickActionLabel.Font = Enum.Font.FredokaOne
QuickActionLabel.TextSize = 18

local QuickActionScroll = Instance.new("ScrollingFrame")
QuickActionScroll.Parent = G2L["21"]
QuickActionScroll.Size = UDim2.new(0, 300, 0, 110)
QuickActionScroll.Position = UDim2.new(0, 170, 0, 250)
QuickActionScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
QuickActionScroll.ScrollBarThickness = 4
QuickActionScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
QuickActionScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

local QuickLayout = Instance.new("UIListLayout")
QuickLayout.Parent = QuickActionScroll
QuickLayout.Padding = UDim.new(0, 5)

----------------------------------------------------
-- PLAYER TAB UI
----------------------------------------------------

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Parent = G2L["23"]
PlayerScroll.Size = UDim2.new(0, 300, 0, 250)
PlayerScroll.Position = UDim2.new(0, 170, 0, 30)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.ScrollBarThickness = 4

local SelectedPlayersFrame = Instance.new("Frame")
SelectedPlayersFrame.Parent = G2L["23"]
SelectedPlayersFrame.Size = UDim2.new(0,120,0,250)
SelectedPlayersFrame.Position = UDim2.new(0,480,0,30)
SelectedPlayersFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
SelectedPlayersFrame.BorderSizePixel = 0

local SelectedCorner = Instance.new("UICorner")
SelectedCorner.Parent = SelectedPlayersFrame

local SelectedTitle = Instance.new("TextLabel")
SelectedTitle.Parent = SelectedPlayersFrame
SelectedTitle.Size = UDim2.new(1,0,0,30)
SelectedTitle.BackgroundTransparency = 1
SelectedTitle.Text = "SELECTED"
SelectedTitle.TextColor3 = Color3.fromRGB(255,255,255)
SelectedTitle.Font = Enum.Font.FredokaOne
SelectedTitle.TextSize = 16

local SelectedScroll = Instance.new("ScrollingFrame")
SelectedScroll.Parent = SelectedPlayersFrame
SelectedScroll.Position = UDim2.new(0,0,0,30)
SelectedScroll.Size = UDim2.new(1,0,1,-30)
SelectedScroll.BackgroundTransparency = 1
SelectedScroll.ScrollBarThickness = 3
SelectedScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SelectedScroll.CanvasSize = UDim2.new(0,0,0,0)

local SelectedLayout = Instance.new("UIListLayout")
SelectedLayout.Parent = SelectedScroll
SelectedLayout.Padding = UDim.new(0,4)

local PlayerLayout = Instance.new("UIListLayout")
PlayerLayout.Parent = PlayerScroll
PlayerLayout.Padding = UDim.new(0, 5)

local ExecuteTargetButton = Instance.new("TextButton")
ExecuteTargetButton.Parent = G2L["23"]
ExecuteTargetButton.Size = UDim2.new(0,145,0,35)
ExecuteTargetButton.Position = UDim2.new(0,325,0,300)
ExecuteTargetButton.Text = "EXECUTE TARGETED"
ExecuteTargetButton.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
ExecuteTargetButton.TextColor3 = Color3.fromRGB(255, 255, 255)

----------------------------------------------------
-- SETTINGS TAB UI
----------------------------------------------------

local AutoSearchToggle = Instance.new("TextButton")
AutoSearchToggle.Parent = G2L["25"]
AutoSearchToggle.Size = UDim2.new(0, 300, 0, 40)
AutoSearchToggle.Position = UDim2.new(0, 170, 0, 50)
AutoSearchToggle.Text = "AUTO SEARCH: OFF"
AutoSearchToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoSearchToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

----------------------------------------------------
-- INFO TAB UI
----------------------------------------------------

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Parent = G2L["27"]
InfoLabel.Size = UDim2.new(0, 400, 0, 200)
InfoLabel.Position = UDim2.new(0, 150, 0, 80)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.Font = Enum.Font.FredokaOne
InfoLabel.TextSize = 18
InfoLabel.TextWrapped = true
InfoLabel.Text =
	"Universal Fake Purchase Tool\nby Pixel Core\n\nKeybinds:\n- Insert: Toggle UI\n\nThe script works for games that use Roblox's standard purchase prompt. To use, simply find a product ID using the finder tab or input one manually, then execute the signal. You can target specific players or all players in the game.\n\nUse responsibly and have fun exploring different items and experiences in Roblox!"

----------------------------------------------------
-- CORE LOGIC
----------------------------------------------------

local function fireUniversal(targetPlayer, id)
	if not id or id == "" then
		return
	end

	local targetID = tonumber(id)

	if not targetID then
		return
	end

	MarketplaceService:SignalPromptProductPurchaseFinished(LocalPlayer.UserId, targetID, true)

	if targetPlayer then
		pcall(function()
			LocalPlayer:WaitForChild("PlayerGui")
				:WaitForChild("Troll")
				:WaitForChild("Troll")
				:WaitForChild("TrollBtn")
				:WaitForChild("LocalScript")
				:WaitForChild("RemoteEvent")
				:FireServer(targetPlayer.Name)
		end)
	end
end

----------------------------------------------------
-- SCAN FUNCTION
----------------------------------------------------

local function runDeepScan()
	task.spawn(function()
		for _, v in ipairs(game:GetDescendants()) do
			pcall(function()
				if v:IsA("IntValue") or v:IsA("NumberValue") or v:IsA("StringValue") then
					local lowerName = string.lower(v.Name)

					if
						string.find(lowerName, "id")
						or string.find(lowerName, "pass")
						or string.find(lowerName, "product")
					then
						local extractedID = tonumber(v.Value)

						if extractedID and _G.handleNewID then
							_G.handleNewID(extractedID, Enum.InfoType.Product)
						end
					end
				end
			end)
		end
	end)
end

local function addFoundButton(id, itemName)
	local Btn = Instance.new("TextButton")
	Btn.Parent = FinderScroll
	Btn.Size = UDim2.new(1, -10, 0, 35)
	Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	Btn.Font = Enum.Font.FredokaOne
	Btn.Text = itemName .. " [" .. id .. "]"

	Btn.MouseButton1Click:Connect(function()
		setclipboard(tostring(id))
	end)

	task.wait()

	FinderScroll.CanvasSize = UDim2.new(0, 0, 0, FinderLayout.AbsoluteContentSize.Y + 10)
end

_G.handleNewID = function(id, infoType)
	if not id then
		return
	end

	if foundIDs[id] then
		return
	end

	local itemName = "Unknown"

	local success, err = pcall(function()
		local info = MarketplaceService:GetProductInfo(id, infoType)

		if info and info.Name then
			itemName = info.Name
		end
	end)

	if not success then
		return
	end

	if itemName == "Unknown" then
		return
	end

	foundIDs[id] = true

	addFoundButton(id, itemName)

	if not QuickActionScroll then
		return
	end

	local QuickBtn = Instance.new("TextButton")

	QuickBtn.Parent = QuickActionScroll
	QuickBtn.Size = UDim2.new(1, -10, 0, 35)
	QuickBtn.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
	QuickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	QuickBtn.Font = Enum.Font.FredokaOne
	QuickBtn.TextSize = 15
	QuickBtn.Text = itemName .. " [" .. id .. "]"

	QuickBtn.MouseButton1Click:Connect(function()
		manualID = tostring(id)

		if ManualBox then
			ManualBox.Text = tostring(id)
		end

		task.spawn(function()
			if #selectedPlayers > 0 then
				for _, name in pairs(selectedPlayers) do
					local target = Players:FindFirstChild(name)

					if target then
						fireUniversal(target, id)
					end
				end
			else
				for _, v in pairs(Players:GetPlayers()) do
					if v ~= LocalPlayer then
						fireUniversal(v, id)
						task.wait(0.05)
					end
				end
			end
		end)
	end)

	task.wait()

	QuickActionScroll.CanvasSize = UDim2.new(0, 0, 0, QuickLayout.AbsoluteContentSize.Y + 15)
end

----------------------------------------------------
-- PLAYER LIST
----------------------------------------------------

local function refreshPlayerList()
	PlayerScroll:ClearAllChildren()

	local layout = Instance.new("UIListLayout")
	layout.Parent = PlayerScroll
	layout.Padding = UDim.new(0, 5)

	for _, v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			local PBtn = Instance.new("TextButton")
			PBtn.Parent = PlayerScroll
			PBtn.Size = UDim2.new(1, -10, 0, 35)
			PBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			PBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
			PBtn.Font = Enum.Font.FredokaOne
			PBtn.Text = v.Name
			PBtn.TextSize = 16

			PBtn.MouseButton1Click:Connect(function()
				if table.find(selectedPlayers, v.Name) then
					table.remove(selectedPlayers, table.find(selectedPlayers, v.Name))
					refreshSelectedPlayers()
					PBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				else
					table.insert(selectedPlayers, v.Name)
					refreshSelectedPlayers()
					PBtn.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
				end
			end)
		end
	end

	task.wait()

	PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
end

local function refreshSelectedPlayers()

	SelectedScroll:ClearAllChildren()

	local layout = Instance.new("UIListLayout")
	layout.Parent = SelectedScroll
	layout.Padding = UDim.new(0,4)

	for _,name in pairs(selectedPlayers) do

		local Label = Instance.new("TextLabel")

		Label.Parent = SelectedScroll
		Label.Size = UDim2.new(1,-6,0,28)
		Label.BackgroundColor3 = Color3.fromRGB(111,87,176)
		Label.TextColor3 = Color3.fromRGB(255,255,255)
		Label.Font = Enum.Font.FredokaOne
		Label.TextSize = 14
		Label.Text = name

		local Corner = Instance.new("UICorner")
		Corner.Parent = Label
	end

	task.wait()

	SelectedScroll.CanvasSize = UDim2.new(
		0,
		0,
		0,
		layout.AbsoluteContentSize.Y + 10
	)
end

PlayerScroll.ScrollBarThickness = 4

PlayerScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
PlayerScroll.ScrollingDirection = Enum.ScrollingDirection.Y
PlayerScroll.Active = true
PlayerScroll.Selectable = true

----------------------------------------------------
-- BUTTON CONNECTIONS
----------------------------------------------------

ScanButton.MouseButton1Click:Connect(function()
	runDeepScan()
end)

ManualBox.FocusLost:Connect(function()
	manualID = ManualBox.Text
end)

ExecuteButton.MouseButton1Click:Connect(function()
	fireUniversal(nil, manualID)
end)

SpamButton.MouseButton1Click:Connect(function()
	isSpammingManual = not isSpammingManual

	if isSpammingManual then
		SpamButton.Text = "SPAM ON"

		task.spawn(function()
			while isSpammingManual do
				fireUniversal(nil, manualID)
				task.wait(0.1)
			end
		end)
	else
		SpamButton.Text = "SPAM OFF"
	end
end)

ExecuteTargetButton.MouseButton1Click:Connect(function()
	for _, name in pairs(selectedPlayers) do
		local target = Players:FindFirstChild(name)

		if target then
			fireUniversal(target, manualID)
		end
	end
end)

local SpamPlayersButton = Instance.new("TextButton")
SpamPlayersButton.Parent = G2L["23"]
SpamPlayersButton.Size = UDim2.new(0,145,0,35)
SpamPlayersButton.Position = UDim2.new(0,170,0,300)
SpamPlayersButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpamPlayersButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpamPlayersButton.Font = Enum.Font.FredokaOne
SpamPlayersButton.Text = "SPAM PLAYERS OFF"

local SelectAllButton = Instance.new("TextButton")
SelectAllButton.Parent = G2L["23"]
SelectAllButton.Size = UDim2.new(0, 145, 0, 35)
SelectAllButton.Position = UDim2.new(0, 170, 0, 350)
SelectAllButton.BackgroundColor3 = Color3.fromRGB(111, 87, 176)
SelectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectAllButton.Font = Enum.Font.FredokaOne
SelectAllButton.Text = "SELECT ALL"

local DeselectAllButton = Instance.new("TextButton")
DeselectAllButton.Parent = G2L["23"]
DeselectAllButton.Size = UDim2.new(0, 145, 0, 35)
DeselectAllButton.Position = UDim2.new(0, 325, 0, 350)
DeselectAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DeselectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeselectAllButton.Font = Enum.Font.FredokaOne
DeselectAllButton.Text = "DESELECT"

AutoSearchToggle.MouseButton1Click:Connect(function()
	autoSearchEnabled = not autoSearchEnabled

	if autoSearchEnabled then
		AutoSearchToggle.Text = "AUTO SEARCH: ON"
	else
		AutoSearchToggle.Text = "AUTO SEARCH: OFF"
	end
end)

SelectAllButton.MouseButton1Click:Connect(function()
	selectedPlayers = {}

	for _, v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			table.insert(selectedPlayers, v.Name)
			refreshSelectedPlayers()
		end
	end

	refreshPlayerList()
	refreshSelectedPlayers()
end)

DeselectAllButton.MouseButton1Click:Connect(function()
	selectedPlayers = {}

	refreshPlayerList()
	refreshSelectedPlayers()
end)

SpamPlayersButton.MouseButton1Click:Connect(function()
	isSpammingPlayer = not isSpammingPlayer

	if isSpammingPlayer then
		SpamPlayersButton.Text = "SPAM PLAYERS ON"

		task.spawn(function()
			while isSpammingPlayer do
				for _, name in pairs(selectedPlayers) do
					local target = Players:FindFirstChild(name)

					if target then
						fireUniversal(target, manualID)
					end
				end

				task.wait(0.1)
			end
		end)
	else
		SpamPlayersButton.Text = "SPAM PLAYERS OFF"
	end
end)

----------------------------------------------------
-- MARKETPLACE LISTENERS
----------------------------------------------------

MarketplaceService.PromptPurchaseRequested:Connect(function(plr, id, infoType)
	if _G.handleNewID then
		_G.handleNewID(id, infoType)
	end
end)

MarketplaceService.PromptProductPurchaseFinished:Connect(function(plr, id, bought)
	if _G.handleNewID then
		_G.handleNewID(id, Enum.InfoType.Product)
	end
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(plr, id, bought)
	if _G.handleNewID then
		_G.handleNewID(id, Enum.InfoType.GamePass)
	end
end)

Players.PlayerAdded:Connect(refreshPlayerList)
Players.PlayerRemoving:Connect(refreshPlayerList)

----------------------------------------------------
-- AUTO SEARCH STARTUP
----------------------------------------------------

task.spawn(function()
	task.wait(3)

	if autoSearchEnabled then
		runDeepScan()
	end
end)

return G2L["1"], require
