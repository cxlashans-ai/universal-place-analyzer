-- ═════════════════════════════════════════════════════════════
-- UNIVERSAL PLACE ANALYZER v3 - SIMPLIFIED VERSION
-- Простое меню с анимированной кнопкой
-- ═════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаем главный GUI контейнер
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "UniversalAnalyzer"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

print("✅ GUI контейнер создан!")

-- ═════════════════════════════════════════════════════════════
-- КОНФИГУРАЦИЯ
-- ═════════════════════════════════════════════════════════════

local CONFIG = {
	COLOR_PRIMARY = Color3.fromRGB(0, 150, 255),
	COLOR_SECONDARY = Color3.fromRGB(30, 30, 40),
	COLOR_ACCENT = Color3.fromRGB(0, 200, 150),
	COLOR_TEXT = Color3.fromRGB(255, 255, 255),
}

-- ═════════════════════════════════════════════════════════════
-- СОЗДАНИЕ ГЛАВНОГО МЕНЮ
-- ═════════════════════════════════════════════════════════════

local function createMenu()
	-- Основное меню
	local mainMenu = Instance.new("Frame")
	mainMenu.Name = "MainMenu"
	mainMenu.Size = UDim2.new(0, 400, 0, 300)
	mainMenu.Position = UDim2.new(0.5, -200, 0.5, -150)
	mainMenu.BackgroundColor3 = CONFIG.COLOR_SECONDARY
	mainMenu.BorderSizePixel = 0
	mainMenu.Parent = screenGui
	
	-- Закругленные углы
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 15)
	corner.Parent = mainMenu
	
	-- Заголовок
	local header = Instance.new("Frame")
	header.Name = "Header"
	header.Size = UDim2.new(1, 0, 0, 80)
	header.Position = UDim2.new(0, 0, 0, 0)
	header.BackgroundColor3 = CONFIG.COLOR_PRIMARY
	header.BorderSizePixel = 0
	header.Parent = mainMenu
	
	local headerCorner = Instance.new("UICorner")
	headerCorner.CornerRadius = UDim.new(0, 15)
	headerCorner.Parent = header
	
	local title = Instance.new("TextLabel")
	title.Name = "Title"
	title.Size = UDim2.new(1, 0, 1, 0)
	title.BackgroundTransparency = 1
	title.Text = "╔════════════════════╗\n║  ANALYZER v3       ║\n║  " .. os.date("%H:%M:%S") .. "          ║\n╚════════════════════╝"
	title.TextColor3 = CONFIG.COLOR_TEXT
	title.TextSize = 11
	title.Font = Enum.Font.GothamBold
	title.TextWrapped = true
	title.Parent = header
	
	-- Контейнер для кнопок
	local buttonsContainer = Instance.new("Frame")
	buttonsContainer.Name = "ButtonsContainer"
	buttonsContainer.Size = UDim2.new(1, -40, 0, 150)
	buttonsContainer.Position = UDim2.new(0, 20, 0, 100)
	buttonsContainer.BackgroundTransparency = 1
	buttonsContainer.BorderSizePixel = 0
	buttonsContainer.Parent = mainMenu
	
	-- ТЕСТОВАЯ КНОПКА С АНИМАЦИЕЙ
	local testButton = Instance.new("TextButton")
	testButton.Name = "TestButton"
	testButton.Size = UDim2.new(0, 200, 0, 60)
	testButton.Position = UDim2.new(0.5, -100, 0.5, -30)
	testButton.BackgroundColor3 = CONFIG.COLOR_ACCENT
	testButton.TextColor3 = CONFIG.COLOR_TEXT
	testButton.Font = Enum.Font.GothamBold
	testButton.TextSize = 16
	testButton.Text = "🎮 ТЕСТ"
	testButton.BorderSizePixel = 0
	testButton.Parent = buttonsContainer
	
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 10)
	buttonCorner.Parent = testButton
	
	-- АНИМАЦИЯ НАЖАТИЯ
	testButton.MouseButton1Down:Connect(function()
		-- Уменьшение при нажатии
		testButton:TweenSize(
			UDim2.new(0, 180, 0, 55),
			Enum.EasingDirection.In,
			Enum.EasingStyle.Quad,
			0.1,
			true
		)
		testButton:TweenPosition(
			UDim2.new(0.5, -90, 0.5, -27.5),
			Enum.EasingDirection.In,
			Enum.EasingStyle.Quad,
			0.1,
			true
		)
		testButton.BackgroundColor3 = Color3.fromRGB(0, 150, 100)\n	end)\n	\n	-- Анимация отпускания\n	testButton.MouseButton1Up:Connect(function()\n		testButton:TweenSize(\n			UDim2.new(0, 200, 0, 60),\n			Enum.EasingDirection.Out,\n			Enum.EasingStyle.Bounce,\n			0.3,\n			true\n		)\n		testButton:TweenPosition(\n			UDim2.new(0.5, -100, 0.5, -30),\n			Enum.EasingDirection.Out,\n			Enum.EasingStyle.Bounce,\n			0.3,\n			true\n		)\n		testButton.BackgroundColor3 = CONFIG.COLOR_ACCENT\n	end)\n	\n	-- Эффект наведения мыши\n\ttestButton.MouseEnter:Connect(function()\n\t\ttestButton.BackgroundColor3 = Color3.fromRGB(0, 220, 180)\n\t\ttestButton.TextSize = 18\n\tend)\n\t\n\ttestButton.MouseLeave:Connect(function()\n\t\ttestButton.BackgroundColor3 = CONFIG.COLOR_ACCENT\n\t\ttestButton.TextSize = 16\n\tend)\n\t\n\treturn mainMenu\nend\n\n-- ═════════════════════════════════════════════════════════════\n-- УПРАВЛЕНИЕ МЕНЮ\n-- ═════════════════════════════════════════════════════════════\n\nlocal currentMenu = nil\n\nlocal function toggleMenu()\n\tif currentMenu then\n\t\tcurrentMenu:Destroy()\n\t\tcurrentMenu = nil\n\t\tprint(\"❌ Меню закрыто\")\n\telse\n\t\tcurrentMenu = createMenu()\n\t\tprint(\"✅ Меню открыто\")\n\tend\nend\n\n-- Горячая клавиша F9 для открытия/закрытия меню\nUserInputService.InputBegan:Connect(function(input, gameProcessed)\n\tif gameProcessed then return end\n\tif input.KeyCode == Enum.KeyCode.F9 then\n\t\ttoggleMenu()\n\tend\nend)\n\n-- ═════════════════════════════════════════════════════════════\n-- ИНИЦИАЛИЗАЦИЯ\n-- ═════════════════════════════════════════════════════════════\n\nprint(\"═══════════════════════════════════════════════════\")\nprint(\"🚀 UNIVERSAL PLACE ANALYZER v3 - ЗАПУЩЕН\")\nprint(\"═══════════════════════════════════════════════════\")\nprint(\"⌨️  Нажми F9 чтобы открыть/закрыть меню\")\nprint(\"═══════════════════════════════════════════════════\")\n