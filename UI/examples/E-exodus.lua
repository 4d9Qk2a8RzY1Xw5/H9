local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4d9Qk2a8RzY1Xw5/H9/main/UI/exodus.lua", true))()
local Flags = Library.Flags
local Window = Library:Window({
   Text = "test lib"
})

Library:Notification({
           Text = "skid fn",
           Duration = 5
       })

Window:Toggle({
   Text = "toggle",
   Callback = function(value)
        print(value)
   end
})

Window:Dropdown({
   Text = "dropdown",
   List = {"1", "2", "3"},
   Callback = function(bool)
       print(bool)
   end
})

Window:Slider({
   Text = "test slider",
   Default = 10,
   Minimum = 1,
   Maximum = 50,
   Postfix = " tests",
   Callback = function(value)
       print(value)
   end
})

Window:Button({
   Text = "esex?",
   Callback = function(bool)
print(bool)
   end
})

Label = Window:Label({
   Text = "nigga label",
   Color = Color3.fromRGB(214, 0, 214)
})

Window:Keybind({
   Text = "toggle lib",
   Default = Enum.KeyCode.F4,
   Callback = function()
       Library:Toggle()
   end
})
