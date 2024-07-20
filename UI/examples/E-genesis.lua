local HASH9 = game:GetService("CoreGui"):FindFirstChild("HASH9")

if HASH9 then
    HASH9:Destroy()
end

local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/4d9Qk2a8RzY1Xw5/H9/main/UI/genesis.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "discord.gg/hash9"
})

local Tab = Window:Tab({
   Text = "tab 1"
})

local Tab2 = Window:Tab({
   Text = "tab 2"
})

local Section = Tab:Section({
   Text = "sect 1"
})

Section:Check({
   Text = "toggle",
	Callback = function(bool)
    print(bool)
   end
})

Section:Dropdown({
   Text = "drops",
   List = {"1", "2", "3"},
   Callback = function(opt)
       print(opt)
   end
})

Section:Slider({
	Text = "test slider",
	Minimum = 0,
	Default = 60,
	Maximum = 100,
	Postfix = " tests",
	Incrementation = 1,
	Callback = function(n)
		print(n)
	end
 })

 local Section2 = Tab:Section({
	Text = "sect 2"
 })
 
 Section2:Button({
	Text = "press me",
	Callback = function()
		print("cum shot!")
	end
 })

 local Section3 = Tab:Section({
	Text = "sect 3",
	Side = "Right"
 })
 
 Section3:Label({
	Text = "cum?",
	Color = Color3.fromRGB(100, 190, 31)
 })

 Section3:Label({
	Text = "bitches: <font color=\"rgb(252, 15, 31)\">none</font>",
 })

Tab:Select()

local NewHASH9 = game:GetService("CoreGui"):WaitForChild("HASH9")
local UserInputService = game:GetService("UserInputService")

local function toggleHASH9()
    NewHASH9.Enabled = not NewHASH9.Enabled
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.RightAlt and not gameProcessedEvent then
        toggleHASH9()
    end
end)

NewHASH9.Main.Console:Destroy()
