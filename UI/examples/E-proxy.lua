local coreGui = game:GetService("CoreGui")
local objectName = "H9SF"
local object = coreGui:FindFirstChild(objectName)

if object then
    object:Destroy()
end

local UserInputService = game:GetService("UserInputService");

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4d9Qk2a8RzY1Xw5/H9/main/UI/proxy.lua"))()
local Window = Library:CreateWindow({
	Size = UDim2.fromOffset(570, 370),
	Transparency = 0,
	Blurring = false,
})

local Themes = {
	Dark = {
		Primary = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(35, 35, 35),
		Component = Color3.fromRGB(40, 40, 40),
		Interactables = Color3.fromRGB(45, 45, 45),

		--// Text:
		Tab = Color3.fromRGB(200, 200, 200),
		Title = Color3.fromRGB(240,240,240),
		Description = Color3.fromRGB(200,200,200),

		--// Outlines:
		Shadow = Color3.fromRGB(0, 0, 0),
		Outline = Color3.fromRGB(40, 40, 40),

		--// Image:
		Icon = Color3.fromRGB(220, 220, 220),
	},
}

--// Set the default theme
Window:SetTheme(Themes.Dark)

--// Sections
Window:AddTabSection({
	Name = "Main",
	Order = 1,
})

Window:AddTabSection({
	Name = "Settings",
	Order = 2,
})

--// Tab [MAIN]

local Main = Window:AddTab({
	Title = "Components",
	Section = "Main",
	Icon = "rbxassetid://11963373994"
})

Window:AddSection({ Name = "Non Interactable", Tab = Main }) 


Window:AddParagraph({
	Title = "Paragraph",
	Description = "Insert any important text here.",
	Tab = Main
}) 

Window:AddSection({ Name = "Interactable", Tab = Main }) 

Window:AddButton({
	Title = "Button",
	Description = "I wonder what this does",
	Tab = Main,
	Callback = function() 
		Window:Notify({
			Title = "hi",
			Description = "i'm a notification", 
			Duration = 5
		})
	end,
}) 

Window:AddSlider({
	Title = "Slider",
	Description = "Sliding",
	Tab = Main,
	MaxValue = 100,
	Callback = function(Amount) 
		warn(Amount);
	end,
}) 

Window:AddToggle({
	Title = "Toggle",
	Description = "Switching",
	Tab = Main,
	Callback = function(Boolean) 
		warn(Boolean);
	end,
}) 

Window:AddInput({
	Title = "Input",
	Description = "Typing",
	Tab = Main,
	Callback = function(Text) 
		warn(Text);
	end,
}) 


Window:AddDropdown({
	Title = "Dropdown",
	Description = "Selecting",
	Tab = Main,
	Options = {
		["An Option"] = "hi",
		["And another"] = "hi",
		["Another"] = "hi",
	},
	Callback = function(Number) 
		warn(Number);
	end,
}) 

local UserInputService = game:GetService("UserInputService")
local keyToBind = nil

local function updateKeybind(InputObject)
    keyToBind = InputObject.KeyCode
end

local function onInputBegan(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == keyToBind then
        print("test press")
    end
end

Window:AddKeybind({
    Title = "Keybind",
    Description = "Binding",
    Tab = Main,
    Callback = updateKeybind,
})

UserInputService.InputBegan:Connect(onInputBegan)


--// Tab [SETTINGS]
local Keybind = nil
local Settings = Window:AddTab({
	Title = "Settings",
	Section = "Settings",
	Icon = "rbxassetid://11293977610",
})

local keyToToggle = nil

local function updateTogKey(InputObject)
    keyToToggle = InputObject.KeyCode
end

local function onToggleBegan(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == keyToToggle then
        game.CoreGui.H9SF:GetChildren()[4].Visible = not game.CoreGui.H9SF:GetChildren()[4].Visible
    end
end

Window:AddKeybind({
    Title = "Toggle UI",
    Description = "Set Toggle Button",
    Tab = Settings,
    Callback = updateTogKey,
})

UserInputService.InputBegan:Connect(onToggleBegan)

Window:AddSlider({
	Title = "UI Transparency",
	Description = "Set the transparency of the UI",
	Tab = Settings,
	AllowDecimals = true,
	MaxValue = 0.10,
	Callback = function(Amount) 
		Window:SetSetting("Transparency", Amount)
	end,
}) 


Window:Notify({
	Title = "u got mail fn",
	Description = "text here", 
	Duration = 4
})

local targetColors = {
    Color3.fromRGB(153, 155, 255),
    Color3.fromRGB(83, 115, 255),
    Color3.fromRGB(255, 189, 68)
}
local replacementColor = Color3.fromRGB(88, 101, 242)
local targetFont = Font.new("rbxassetid://16658221428", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

local function updateAndDestroy(instance)
    if instance:IsA("GuiObject") then
        for _, color in ipairs(targetColors) do
            if instance:IsA("ImageLabel") or instance:IsA("ImageButton") then
                if instance.ImageColor3 == color then
                    instance.ImageColor3 = replacementColor
                end
            elseif instance.BackgroundColor3 == color then
                instance.BackgroundColor3 = replacementColor
            end
        end
        
        if (instance.Name == "Close" or instance.Name == "Maximize") and instance.Parent and instance.Parent.Name == "Buttons" then
            instance:Destroy()
        end

        if (instance:IsA("UICorner") or instance:IsA("UIStroke")) and instance.Parent and (instance.Parent.Name == "Main" or instance.Parent.Parent and instance.Parent.Parent.Name == "Main") then
            instance:Destroy()
        end
        
        if instance:IsA("TextLabel") or instance:IsA("TextButton") or instance:IsA("TextBox") then
            instance.FontFace = targetFont
        end
    end
    
    for _, child in ipairs(instance:GetChildren()) do
        updateAndDestroy(child)
    end
end

local targetParent = game.CoreGui:FindFirstChild("H9SF")
if targetParent then
    game.CoreGui.H9SF:GetChildren()[4].UICorner:Destroy()
    game.CoreGui.H9SF:GetChildren()[4].UIStroke:Destroy()
    game.CoreGui.H9SF:GetChildren()[4].Position = UDim2.new(0.5, -394, 0.5, 149)

    updateAndDestroy(targetParent)
else
    warn("H9SF not found in CoreGui.")
end
