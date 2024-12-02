local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabFrame = Instance.new("Frame")
local Input = Instance.new("TextBox")
local Convert = Instance.new("TextButton")
local InsultsFrame = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton") -- Added Close Button

-- Add Close Button
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
CloseButton.Position = UDim2.new(0.93, 0, 0.02, 0)
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.BorderSizePixel = 0

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 4)
CloseButtonCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Updated Insults with Categories
local insults = {
    
    -- General Insults
    {"You are the human embodiment of a mistake.", "General"},
    {"Your existence is a tragedy, not a story.", "General"},
    {"You are a waste of space and oxygen.", "General"},
    {"4.", "General"},
    {"5.", "General"},
    {"6.", "General"},
    {"7.", "General"},
    {"8.", "General"},

    -- Racism Insults
    {"1.", "Racism"},
    {"2.", "Racism"},
    {"3.", "Racism"},
    {"4.", "Racism"},
    {"5.", "Racism"},
    {"6.", "Racism"},
    {"7.", "Racism"},
    {"8.", "Racism"},

    -- Homophobic Insults
    {"You're so scared of being wrong, you can't face the truth.", "Homophobic"},
    {"2.", "Homophobic"},
    {"3.", "Homophobic"},
    {"4.", "Homophobic"},
    {"5.", "Homophobic"},
    {"6.", "Homophobic"},
    {"7.", "Homophobic"},
    {"8.", "Homophobic"},

    -- Sex Insults
    {"Your sex appeal is equal to a wet mop.", "Sex"},
    {"The only thing you’re good at is being a disappointment.", "Sex"},
    {"Your existence is a testament to failure and mediocrity.", "Sex"},
    {"4.", "Sex"},
    {"5.", "Sex"},
    {"6.", "Sex"},
    {"7.", "Sex"},
    {"8.", "Sex"},

    -- Other Insults
    {"You’re like a cloud. When you disappear, it’s a good day.", "Other"},
    {"2.", "Other"},
    {"3.", "Other"},
    {"4.", "Other"},
    {"5.", "Other"},
    {"6.", "Other"},
    {"7.", "Other"},
    {"8.", "Other"},
}



-- Blacklisted words
local blacklistedWords = {
    "lmao"
    -- Add more words here
}

-- Function to create popup
local function showPopup(word)
    local popup = Instance.new("Frame")
    popup.Name = "Popup"
    popup.Parent = ScreenGui
    popup.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    popup.Position = UDim2.new(0.5, -150, 0.8, 0)
    popup.Size = UDim2.new(0, 300, 0, 60)
    popup.BorderSizePixel = 0
    
    local UICornerPopup = Instance.new("UICorner")
    UICornerPopup.CornerRadius = UDim.new(0, 8)
    UICornerPopup.Parent = popup
    
    local popupText = Instance.new("TextLabel")
    popupText.Parent = popup
    popupText.BackgroundTransparency = 1
    popupText.Position = UDim2.new(0, 0, 0, 0)
    popupText.Size = UDim2.new(1, 0, 1, 0)
    popupText.Font = Enum.Font.GothamBold
    popupText.Text = "This doesn't bypass: " .. word
    popupText.TextColor3 = Color3.fromRGB(255, 255, 255)
    popupText.TextSize = 16
    
    game:GetService("Debris"):AddItem(popup, 2)
end

-- Function to check for blacklisted words
local function containsBlacklistedWord(text)
    for _, word in ipairs(blacklistedWords) do
        if string.find(string.lower(text), string.lower(word)) then
            return word
        end
    end
    return nil
end

-- GUI Setup
ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0.02, 0)
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Chat Bypasser"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

-- Tab Frame
TabFrame.Parent = MainFrame
TabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TabFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
TabFrame.Size = UDim2.new(0.9, 0, 0.07, 0)
TabFrame.BorderSizePixel = 0

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 8)
TabCorner.Parent = TabFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabFrame
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0.02, 0)

-- Function to create tabs
local function createTab(name)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.BackgroundColor3 = Color3.fromRGB(65, 65, 85)
    tab.Size = UDim2.new(0.2, 0, 1, 0)
    tab.Font = Enum.Font.Gotham
    tab.Text = name
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.TextSize = 14
    tab.BorderSizePixel = 0
    
    local TabButtonCorner = Instance.new("UICorner")
    TabButtonCorner.CornerRadius = UDim.new(0, 8)
    TabButtonCorner.Parent = tab
    
    return tab
end

-- Create tabs
local MainTab = createTab("Main")
local RacismTab = createTab("Racism")
local HomophobicTab = createTab("Homophobic")
local SexTab = createTab("Sex")
local OtherTab = createTab("Other")

Input.Parent = MainFrame
Input.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Input.Position = UDim2.new(0.1, 0, 0.2, 0)
Input.Size = UDim2.new(0.8, 0, 0.15, 0)
Input.Font = Enum.Font.Gotham
Input.PlaceholderText = "Enter text here..."
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 16
Input.BorderSizePixel = 0

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 8)
UICorner2.Parent = Input

Convert.Parent = MainFrame
Convert.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
Convert.Position = UDim2.new(0.25, 0, 0.37, 0)
Convert.Size = UDim2.new(0.5, 0, 0.1, 0)
Convert.Font = Enum.Font.GothamBold
Convert.Text = "Convert & Send"
Convert.TextColor3 = Color3.fromRGB(255, 255, 255)
Convert.TextSize = 16
Convert.BorderSizePixel = 0

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 8)
UICorner3.Parent = Convert

InsultsFrame.Parent = MainFrame
InsultsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
InsultsFrame.Position = UDim2.new(0.1, 0, 0.5, 0)
InsultsFrame.Size = UDim2.new(0.8, 0, 0.45, 0)
InsultsFrame.BorderSizePixel = 0

local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 8)
UICorner4.Parent = InsultsFrame

UIGridLayout.Parent = InsultsFrame
UIGridLayout.CellPadding = UDim2.new(0.02, 0, 0.02, 0)
UIGridLayout.CellSize = UDim2.new(0.48, 0, 0.2, 0)
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder

local charMap = {
    ["a"] = "ａ",   
    ["b"] = "ƀ",     
    ["c"] = "ꞓ",    
    ["d"] = "ď",     
    ["e"] = "е",    
    ["f"] = "ғ",     
    ["g"] = "ɡ",    
    ["h"] = "һ",    
    ["i"] = "і",   
    ["j"] = "ј",    
    ["k"] = "ꝁ",   
    ["l"] = "l",    
    ["m"] = "м",    
    ["n"] = "п",    
    ["o"] = "о",    
    ["p"] = "ρ",     
    ["q"] = "q",     
    ["r"] = "ɾ",    
    ["s"] = "ꜱ",    
    ["t"] = "t",    
    ["u"] = "ц",    
    ["v"] = "ѷ",    
    ["w"] = "w",     
    ["x"] = "ꭓ",     
    ["y"] = "ɏ",
    ["z"] = "z"    
}

local function convertText(text)
    local converted = ""
    for char in text:lower():gmatch(".") do
        converted = converted .. (charMap[char] or char)
    end
    return converted
end

local function randomsmt(msg)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local TextChatService = game:GetService("TextChatService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local chat = TextChatService.ChatInputBarConfiguration.TargetTextChannel

    local filteredMessage = game:GetService("Chat"):FilterStringForBroadcast(msg, LocalPlayer)
    local tagged = filteredMessage ~= msg

    if tagged then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Message Filtered", 
            Text = "Your message was blocked"
        })
    else
        if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
            ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
        else
            chat:SendAsync(msg)
        end
    end
end

function sendConvertedText(text)
    -- Check if the text contains blacklisted words
    local blockedWord = containsBlacklistedWord(text)
    if blockedWord then
        -- Show a popup for the blocked word and return early
        showPopup(blockedWord)
        return
    end

    -- Convert the text as needed
    local convertedText = convertText(text)

    -- Send the message using the new chat function logic
    randomsmt(convertedText)
end

function chat(message)
    -- This function is now deprecated, using randomsmt instead
    randomsmt(message)
end

-- Function to populate insults based on category
local function populateInsults(category)
    -- Clear existing insults
    for _, child in ipairs(InsultsFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Add insults for the selected category
    for _, insult in ipairs(insults) do
        if insult[2] == category then
            local button = Instance.new("TextButton")
            button.Parent = InsultsFrame
            button.BackgroundColor3 = Color3.fromRGB(65, 65, 85)
            button.BorderSizePixel = 0
            button.Font = Enum.Font.Gotham
            button.Text = insult[1]
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 12
            button.TextWrapped = true

            local UICorner5 = Instance.new("UICorner")
            UICorner5.CornerRadius = UDim.new(0, 6)
            UICorner5.Parent = button

            button.MouseButton1Click:Connect(function()
                sendConvertedText(insult[1])
            end)
        end
    end
end

-- Tab selection logic
MainTab.MouseButton1Click:Connect(function()
    populateInsults("General")
end)

RacismTab.MouseButton1Click:Connect(function()
    populateInsults("Racism")
end)

HomophobicTab.MouseButton1Click:Connect(function()
    populateInsults("Homophobic")
end)

SexTab.MouseButton1Click:Connect(function()
    populateInsults("Sex")
end)

OtherTab.MouseButton1Click:Connect(function()
    populateInsults("Other")
end)

-- Initial population of insults
populateInsults("General")

Convert.MouseButton1Click:Connect(function()
    sendConvertedText(Input.Text)
    Input.Text = ""
end)


if not game:IsLoaded() then
    game.Loaded:wait()
end

task.wait(5)

local ACL_LoadTime = tick()
local NotificationTitle = "Anthony's ACL"

local OldCoreTypeSettings = {}
local WhitelistedCoreTypes = {
    "Chat",
    "All",
    Enum.CoreGuiType.Chat,
    Enum.CoreGuiType.All
}

local OldCoreSetting = nil

local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local Notify = function(_Title, _Text , Time)
    StarterGui:SetCore("SendNotification", {Title = _Title, Text = _Text, Icon = "rbxassetid://2541869220", Duration = Time})
end

local Tween = function(Object, Time, Style, Direction, Property)
    return TweenService:Create(Object, TweenInfo.new(Time, Enum.EasingStyle[Style], Enum.EasingDirection[Direction]), Property)
end

local PlayerGui = Player:FindFirstChildWhichIsA("PlayerGui") do
    if not PlayerGui then
        local Timer = tick() + 5
        repeat task.wait() until Player:FindFirstChildWhichIsA("PlayerGui") or (tick() > Timer)
        PlayerGui = Player:FindFirstChildWhichIsA("PlayerGui") or false
        if not PlayerGui then
            return Notify(NotificationTitle, "Failed to find PlayerGui!", 10)
        end
    end
end

if getgenv().AntiChatLogger then
    return Notify(NotificationTitle, "Anti Chat & Screenshot Logger already loaded!", 15)
else
    getgenv().AntiChatLogger = true
end

local Metatable = getrawmetatable(StarterGui)
setreadonly(Metatable, false)

local MessageEvent = Instance.new("BindableEvent")

if hookmetamethod then
    local CoreHook do
        CoreHook = hookmetamethod(StarterGui, "__namecall", newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Arguments = {...}
            
            if self == StarterGui and not checkcaller() then
                if Method == "SetCoreGuiEnabled" then
                    local CoreType = Arguments[1]
                    local Enabled = Arguments[2]
                    
                    if table.find(WhitelistedCoreTypes, CoreType) and Enabled == false then -- Thanks Harun for correcting me on the second argument
                        OldCoreTypeSettings[CoreType] = Enabled
                        return
                    end
                elseif Method == "SetCore" then
                    local Core = Arguments[1]
                    local Connection = Arguments[2]
                    
                    if Core == "CoreGuiChatConnections" then
                        OldCoreSetting = Connection
                        return
                    end
                end
            end
            
            return CoreHook(self, ...)
        end))
    end

    if not getgenv().ChattedFix then
        getgenv().ChattedFix = true

        local ChattedFix do
            ChattedFix = hookmetamethod(Player, "__index", newcclosure(function(self, index)
                if self == Player and tostring(index):lower():match("chatted") and MessageEvent.Event then
                    return MessageEvent.Event
                end

                return ChattedFix(self, index)
            end))
        end

        local AnimateChattedFix = task.spawn(function()
            local ChattedSignal = false

            for _, x in next, getgc() do
                if type(x) == "function" and getfenv(x).script ~= nil and tostring(getfenv(x).script) == "Animate" then
                    if islclosure(x) then
                        local Constants = getconstants(x)

                        for _, v in next, Constants do
                            if v == "Chatted" then
                                ChattedSignal = x
                            end
                        end
                    end
                end
            end

            if ChattedSignal then
                ChattedSignal()
            end
        end)
    end
end

local EnabledChat = task.spawn(function()
    repeat
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
        task.wait()
    until StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
end)

-- Removed the entire WarningGuiThread block

-- Completely comment out the TextChatService check
--[[
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    WarningUI.Enabled = true
    Reason_1.Visible = true
    return
end
]]

local PlayerScripts = Player:WaitForChild("PlayerScripts")
local ChatMain = PlayerScripts:FindFirstChild("ChatMain", true) or false

if not ChatMain then
    local Timer = tick()
    
    repeat task.wait() until PlayerScripts:FindFirstChild("ChatMain", true) or tick() > (Timer + 3)
    ChatMain = PlayerScripts:FindFirstChild("ChatMain", true)
    
    if not ChatMain then
        -- Removed the WarningUI part
        return
    end
end

local PostMessage = require(ChatMain).MessagePosted

if not PostMessage then
    -- Removed the WarningUI part
    return
end

local OldFunctionHook; OldFunctionHook = hookfunction(PostMessage.fire, function(self, Message)
    if self == PostMessage then
        MessageEvent:Fire(Message)
        return
    end
    return OldFunctionHook(self, Message)
end)

if setfflag then
    pcall(function()
        setfflag("AbuseReportScreenshot", "False")
        setfflag("AbuseReportScreenshotPercentage", "0")
    end)
end -- To prevent roblox from taking screenshots of your client.

-- Rest of the script remains the same as the original
local Credits = task.spawn(function()
    local UserIds = {
        1414978355
    }
    
    -- ... (credits block remains unchanged)
end)

-- Removed the line that destroys WarningUI after delay

for _, x in next, OldCoreTypeSettings do
    if not x then
        StarterGui:SetCore("ChatActive", false)
    end
    StarterGui:SetCoreGuiEnabled(_, x)
end

if OldCoreSetting then
    StarterGui:SetCore("CoreGuiChatConnections", OldCoreSetting)
end

if StarterGui:GetCore("ChatActive") then
    StarterGui:SetCore("ChatActive", false)
    StarterGui:SetCore("ChatActive", true)
end

--Metatable.__namecall = CoreHook
if CoreHook then
    setmetatable(Metatable, {__namecall = CoreHook}) 
end
setreadonly(Metatable, true)
