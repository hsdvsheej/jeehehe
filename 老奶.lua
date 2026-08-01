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

