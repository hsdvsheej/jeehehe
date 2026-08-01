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

