
--Bypasses last updated 01.01.2025

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MessageDisplay"
screenGui.Parent = playerGui

-- Frame for the message
local messageFrame = Instance.new("Frame")
messageFrame.Size = UDim2.new(0.6, 0, 0.2, 0) -- 60% width, 10% height
messageFrame.Position = UDim2.new(0.2, 0, 0, 10) -- Centered horizontally at the top
messageFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark theme
messageFrame.BorderSizePixel = 0
messageFrame.Parent = screenGui

-- Apply corner rounding
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.1, 0) -- Smooth rounded corners
corner.Parent = messageFrame

-- UI list for dynamic text handling
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.FillDirection = Enum.FillDirection.Vertical
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Center
layout.Parent = messageFrame

-- Helper function to create text labels
local function createTextLabel(text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 30)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamSemibold
    label.TextScaled = true
    label.Parent = messageFrame
end

-- Configuration: Message Content (Easily editable)
local messages = {
    "Script is currently patched",
    "do NOT use"
}

-- Display the messages dynamically
for _, messageText in ipairs(messages) do
    createTextLabel(messageText)
end

-- Auto-remove the message after 5 seconds
wait(0)
screenGui:Destroy()


--Main Start

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabFrame = Instance.new("Frame")
local Input = Instance.new("TextBox")
local Convert = Instance.new("TextButton")
local InsultsFrame = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

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

local insults = {
    
    -- General Insults
    {"I get hella pussy 24/7", "General"},
    {"youre a fucking legend bro", "General"},
    {"lets go fuck with some people", "General"},
    {"i agree, fuck off", "General"},
    {"sit the fuck down", "General"},
    {"Coming soon, only manual bypassing rn", "General"},
    {"Coming soon, only manual bypassing rn", "General"},
    {"Coming soon, only manual bypassing rn", "General"},

    -- Racism Insults
    {"Banana eating monkey", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},
    {"Coming soon, only manual bypassing rn", "Racism"},

    -- Homophobic Insults
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},
    {"Coming soon, only manual bypassing rn", "Homophobic"},

    -- Sex Insults
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},
    {"Coming soon, only manual bypassing rn", "Sex"},

    -- Other Insults
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
    {"Coming soon, only manual bypassing rn", "Other"},
}

-- Blacklisted words
local blacklistedWords = {
    "you are so fucking",
    "i hate",
    "spread",
    "let me see your butt",
    "let me see your boob",
    "let me see your tit",
    "let me see your as",
    "let me see your pan",
    "show",
    "can we",
    "hail",
    "hitle",
    "69",
    "burn all nig",
    "kys retard",
    "pull down",
    "kys"
}

-- Function to create popup
local function showPopup(word, reasonForNotBypassing)
    local popup = Instance.new("Frame")
    popup.Name = "Popup"
    popup.Parent = ScreenGui
    popup.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    popup.Position = UDim2.new(0.5, -150, 0.8, 0)
    popup.Size = UDim2.new(0, 300, 0, 100)  -- Increased height to accommodate 3 lines
    popup.BorderSizePixel = 0
    
    local UICornerPopup = Instance.new("UICorner")
    UICornerPopup.CornerRadius = UDim.new(0, 8)
    UICornerPopup.Parent = popup
    
    -- Reason Text (Flagged:)
    local reasonText = Instance.new("TextLabel")
    reasonText.Parent = popup
    reasonText.BackgroundTransparency = 1
    reasonText.Position = UDim2.new(0, 0, 0, 0)
    reasonText.Size = UDim2.new(1, 0, 0.33, 0)  -- One third of the height
    reasonText.Font = Enum.Font.GothamBold
    reasonText.Text = "Flagged:"
    reasonText.TextColor3 = Color3.fromRGB(255, 255, 255)
    reasonText.TextSize = 16
    reasonText.TextXAlignment = Enum.TextXAlignment.Center
    reasonText.TextYAlignment = Enum.TextYAlignment.Center
    
    -- Word Text
    local wordText = Instance.new("TextLabel")
    wordText.Parent = popup
    wordText.BackgroundTransparency = 1
    wordText.Position = UDim2.new(0, 0, 0.33, 0)  -- Positioned below the reasonText
    wordText.Size = UDim2.new(1, 0, 0.33, 0)  -- One third of the height
    wordText.Font = Enum.Font.GothamBold
    wordText.Text = word
    wordText.TextColor3 = Color3.fromRGB(255, 255, 255)
    wordText.TextSize = 16
    wordText.TextXAlignment = Enum.TextXAlignment.Center
    wordText.TextYAlignment = Enum.TextYAlignment.Center
    
    -- Reason for not bypassing
    local reasonForNotBypassingText = Instance.new("TextLabel")
    reasonForNotBypassingText.Parent = popup
    reasonForNotBypassingText.BackgroundTransparency = 1
    reasonForNotBypassingText.Position = UDim2.new(0, 0, 0.66, 0)  -- Positioned below the wordText
    reasonForNotBypassingText.Size = UDim2.new(1, 0, 0.33, 0)  -- One third of the height
    reasonForNotBypassingText.Font = Enum.Font.Gotham
    reasonForNotBypassingText.Text = reasonForNotBypassing or "[BETA] Anti tagging."
    reasonForNotBypassingText.TextColor3 = Color3.fromRGB(255, 255, 255)
    reasonForNotBypassingText.TextSize = 14
    reasonForNotBypassingText.TextXAlignment = Enum.TextXAlignment.Center
    reasonForNotBypassingText.TextYAlignment = Enum.TextYAlignment.Center
    
    game:GetService("Debris"):AddItem(popup, 4)
end

-- Function to tokenize text into words
local function tokenize(text)
    local words = {}
    for word in string.gmatch(string.lower(text), "%S+") do
        table.insert(words, word)
    end
    return words
end

-- Function to calculate similarity between two strings
local function stringSimilarity(str1, str2)
    str1, str2 = string.lower(str1), string.lower(str2)
    
    -- Handle letter substitutions (l3tt3r => letter)
local substitutions = {
    ['0'] = 'o', ['1'] = 'i', ['3'] = 'e', ['4'] = 'a',
    ['5'] = 's', ['7'] = 't', ['@'] = 'a', ['$'] = 's',
    ['8'] = 'b', ['9'] = 'g', ['*'] = 'x', ['&'] = 'a'
}

    for k, v in pairs(substitutions) do
        str1 = string.gsub(str1, k, v)
        str2 = string.gsub(str2, k, v)
    end
    
    -- Remove spaces and special characters for comparison
    str1 = string.gsub(str1, "[%s%p]", "")
    str2 = string.gsub(str2, "[%s%p]", "")
    
    if #str1 == 0 or #str2 == 0 then return 0 end
    
    -- Calculate Levenshtein distance
    local matrix = {}
    for i = 0, #str1 do
        matrix[i] = {[0] = i}
    end
    for j = 0, #str2 do
        matrix[0][j] = j
    end
    
    for i = 1, #str1 do
        for j = 1, #str2 do
            local cost = (string.sub(str1, i, i) == string.sub(str2, j, j)) and 0 or 1
            matrix[i][j] = math.min(
                matrix[i-1][j] + 1,
                matrix[i][j-1] + 1,
                matrix[i-1][j-1] + cost
            )
        end
    end
    
    -- Return similarity score (0 to 1)
    return 1 - (matrix[#str1][#str2] / math.max(#str1, #str2))
end

-- Function to check for blacklisted phrases intelligently
local function containsBlacklistedWord(text)
    text = string.lower(text)
    local words = tokenize(text)
    
    -- Check for exact matches first
    for _, blockedPhrase in ipairs(blacklistedWords) do
        if string.find(text, string.lower(blockedPhrase)) then
            return blockedPhrase
        end
    end
    
    -- Check for phrase similarity
    for _, blockedPhrase in ipairs(blacklistedWords) do
        local blockedWords = tokenize(blockedPhrase)
        
        -- Skip if the text has fewer words than the blocked phrase
        if #words >= #blockedWords then
            -- Check each possible sequence of words in the text
            for i = 1, #words - #blockedWords + 1 do
                local textSegment = table.concat({table.unpack(words, i, i + #blockedWords - 1)}, " ")
                
                -- Compare similarity
                if stringSimilarity(textSegment, blockedPhrase) > 0.8 then
                    return blockedPhrase
                end
            end
        end
    end
    
    -- Check for intentional letter spacing or substitutions
    local condensedText = string.gsub(text, "[%s%p]", "")
    for _, blockedPhrase in ipairs(blacklistedWords) do
        local condensedPhrase = string.gsub(string.lower(blockedPhrase), "[%s%p]", "")
        if stringSimilarity(condensedText, condensedPhrase) > 0.8 then
            return blockedPhrase
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
Title.TextColor3 = Color3.fromRGB(230, 230, 250)  -- Slightly softer white for better readability
Title.TextSize = 28  -- Increased size for more prominence
Title.TextStrokeTransparency = 0.7  -- Optional: adds a subtle text outline for depth

-- TabFrame with gradient background
TabFrame.Parent = MainFrame
TabFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 75)
TabFrame.Position = UDim2.new(0.05, 0, 0.1, 0)
TabFrame.Size = UDim2.new(0.9, 0, 0.07, 0)
TabFrame.BorderSizePixel = 0

local TabGradient = Instance.new("UIGradient")
TabGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(75, 75, 85)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 65, 75))
}
TabGradient.Parent = TabFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 12)
TabCorner.Parent = TabFrame

local TabLayout = Instance.new("UIListLayout")
TabLayout.Parent = TabFrame
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.Padding = UDim.new(0.02, 0)
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Enhanced tab creation function
local function createTab(name)
    local tab = Instance.new("TextButton")
    tab.Parent = TabFrame
    tab.BackgroundColor3 = Color3.fromRGB(85, 85, 105)  -- Brighter base color
    tab.Size = UDim2.new(0.18, 0, 0.9, 0)
    tab.Position = UDim2.new(0, 0, 0.05, 0)
    tab.Font = Enum.Font.GothamBold  -- Changed to Bold for better visibility
    tab.Text = name
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Pure white text
    tab.TextSize = 15  -- Slightly larger text
    tab.BorderSizePixel = 0
    tab.AutoButtonColor = false
    
    local TabButtonCorner = Instance.new("UICorner")
    TabButtonCorner.CornerRadius = UDim.new(0, 8)
    TabButtonCorner.Parent = tab
    
    local TabGradient = Instance.new("UIGradient")
    TabGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(95, 95, 115)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 85, 105))
    }
    TabGradient.Parent = tab
    
    -- Enhanced hover effect
    tab.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(tab, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(105, 105, 135),  -- More noticeable hover color
            TextColor3 = Color3.fromRGB(200, 230, 255)  -- Slight blue tint on hover
        }):Play()
    end)
    
    tab.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(tab, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(85, 85, 105),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    -- Enhanced click effect
    tab.MouseButton1Click:Connect(function()
        -- Size shrink effect
        local clickEffect = game:GetService("TweenService"):Create(tab, TweenInfo.new(0.1), {
            Size = UDim2.new(0.17, 0, 0.8, 0),
            BackgroundColor3 = Color3.fromRGB(115, 115, 145),  -- Brighter color on click
            TextColor3 = Color3.fromRGB(180, 220, 255)  -- Different text color on click
        })
        clickEffect:Play()
        clickEffect.Completed:Wait()
        
        -- Return to original state
        game:GetService("TweenService"):Create(tab, TweenInfo.new(0.1), {
            Size = UDim2.new(0.18, 0, 0.9, 0),
            BackgroundColor3 = Color3.fromRGB(85, 85, 105),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }):Play()
    end)
    
    return tab
end

-- Create tabs with enhanced styling
local MainTab = createTab("Main")
local RacismTab = createTab("Racism")
local HomophobicTab = createTab("Anti-LGBT")
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
Convert.BackgroundColor3 = Color3.new(0.152941, 0.207843, 0.368627)
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
    ["a"] = "ɒ",   
    ["b"] = "ƀ",     
    ["c"] = "ꞓ",    
    ["d"] = "ď",     
    ["e"] = "е",    
    ["f"] = "ꜰ",     
    ["g"] = "ɡ",    
    ["h"] = "һ",    
    ["i"] = "і",   
    ["j"] = "ј",    
    ["k"] = "ꝁ",   
    ["l"] = "l",    
    ["m"] = "м",    
    ["n"] = "п",    
    ["o"] = "ø",    
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
            showPopup(msg, "[BETA] Word blocked by filter.")
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
local NotificationTitle = "Custom ACL"

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
    return Notify(NotificationTitle, "ACL is already loaded", 15)
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
