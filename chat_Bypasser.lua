-- Enable Secure Mode if needed
getgenv().SecureMode = true

-- Load ArrayField Library
local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()

-- Create a Window with Key System
local Window = ArrayField:CreateWindow({
   Name = "My Advanced GUI",
   LoadingTitle = "Loading My Advanced GUI",
   LoadingSubtitle = "by YourName",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MyAdvancedGUI", -- Custom folder for saving configurations
      FileName = "MyAdvancedGUIConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true, -- Enable Key System
   KeySettings = {
      Title = "My Advanced GUI Key System",
      Subtitle = "Enter Key to Access",
      Note = "Contact the developer for the key.",
      FileName = "MyAdvancedGUIKey", -- Unique key file name
      SaveKey = true, -- Save the key for the user
      GrabKeyFromSite = false, -- Don't grab key from a site
      Actions = {
         [1] = {
            Text = 'Click here to copy the key link <--',
            OnPress = function()
               print('Key link copied!')
            end,
         }
      },
      Key = {"MySecretKey123"} -- List of valid keys
   }
})

-- Create Tabs
local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image ID
local RacismTab = Window:CreateTab("Racism", 4483362458)
local AntiLGBTab = Window:CreateTab("Anti-LGBT", 4483362458)
local SexTab = Window:CreateTab("Sex", 4483362458)
local OthersTab = Window:CreateTab("Others", 4483362458)

-- Main Tab
local MainSection = MainTab:CreateSection("Welcome to My Advanced GUI", false)

local MainButton = MainTab:CreateButton({
   Name = "Click Me",
   Interact = 'Click',
   Callback = function()
      print("Main button clicked!")
      ArrayField:Notify({
         Title = "Notification",
         Content = "You clicked the Main button!",
         Duration = 5,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = "Okay!",
               Callback = function()
                  print("User acknowledged the notification.")
               end
            },
         },
      })
   end,
})

local MainToggle = MainTab:CreateToggle({
   Name = "Enable Main Feature",
   CurrentValue = false,
   Flag = "MainToggle1", -- Unique flag for configuration saving
   Callback = function(Value)
      print("Main Toggle state:", Value)
   end,
})

-- Racism Tab
local RacismSection = RacismTab:CreateSection("Racism Settings", false)

local RacismButton = RacismTab:CreateButton({
   Name = "Activate Racism Mode",
   Interact = 'Click',
   Callback = function()
      print("Racism mode activated!")
      ArrayField:Notify({
         Title = "Racism Mode",
         Content = "Racism mode has been activated!",
         Duration = 5,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = "Okay!",
               Callback = function()
                  print("User acknowledged the notification.")
               end
            },
         },
      })
   end,
})

local RacismSlider = RacismTab:CreateSlider({
   Name = "Racism Intensity",
   Range = {0, 100},
   Increment = 5,
   Suffix = "%",
   CurrentValue = 50,
   Flag = "RacismSlider1", -- Unique flag for configuration saving
   Callback = function(Value)
      print("Racism Intensity:", Value)
   end,
})

-- Anti-LGBT Tab
local AntiLGBTSection = AntiLGBTab:CreateSection("Anti-LGBT Settings", false)

local AntiLGBTButton = AntiLGBTab:CreateButton({
   Name = "Activate Anti-LGBT Mode",
   Interact = 'Click',
   Callback = function()
      print("Anti-LGBT mode activated!")
      ArrayField:Notify({
         Title = "Anti-LGBT Mode",
         Content = "Anti-LGBT mode has been activated!",
         Duration = 5,
         Image = 4483362458,
         Actions = {
            Ignore = {
               Name = "Okay!",
               Callback = function()
                  print("User acknowledged the notification.")
               end
            },
         },
      })
   end,
})

local AntiLGBTColorPicker = AntiLGBTab:CreateColorPicker({
    Name = "Anti-LGBT Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "AntiLGBTColor1", -- Unique flag for configuration saving
    Callback = function(Value)
        print("Anti-LGBT Color:", Value)
    end
})

-- Sex Tab
local SexSection = SexTab:CreateSection("Sex Settings", false)

local SexToggle = SexTab:CreateToggle({
   Name = "Enable Sex Mode",
   CurrentValue = false,
   Flag = "SexToggle1", -- Unique flag for configuration saving
   Callback = function(Value)
      print("Sex Mode state:", Value)
   end,
})

local SexDropdown = SexTab:CreateDropdown({
   Name = "Select Preference",
   Options = {"Option 1", "Option 2", "Option 3"},
   CurrentOption = "Option 1",
   MultiSelection = false,
   Flag = "SexDropdown1", -- Unique flag for configuration saving
   Callback = function(Option)
      print("Selected Preference:", Option)
   end,
})

-- Others Tab
local OthersSection = OthersTab:CreateSection("Miscellaneous Settings", false)

local OthersLabel = OthersTab:CreateLabel("This is the Others Tab")

local OthersInput = OthersTab:CreateInput({
   Name = "Enter Text",
   PlaceholderText = "Type something...",
   NumbersOnly = false,
   CharacterLimit = 20,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      print("Input Text:", Text)
   end,
})

-- Load Configuration (place at the end of your script)
ArrayField:LoadConfiguration()
