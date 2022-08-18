local bai={
    antohuidao=false,
   autokaojin=false,
   kuaisucs=false,
   zidonshaujy=false,
   autoty=false,
   autozhuanbei=false
}


local function notify(title,text,time)
	game.StarterGui:SetCore("SendNotification", {
		Title = title;
		Text = text;
		Icon = nil;
		Duration = time
	})
end
local function addEsp()
	for i,v in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if not v.HumanoidRootPart:FindFirstChild("eyeesspee") then
				local billboard = Instance.new("BillboardGui", v:WaitForChild("Head"))
				billboard.LightInfluence = 0
				billboard.Size = UDim2.new(40, 40, 1, 1)
				billboard.StudsOffset = Vector3.new(0, 3, 0)
				billboard.ZIndexBehavior = "Global"
				billboard.ClipsDescendants = false
				billboard.AlwaysOnTop = true
				billboard.Name = "Head"

				local billboard2 = Instance.new("BillboardGui", v:WaitForChild("HumanoidRootPart"))
				billboard2.LightInfluence = 0
				billboard2.Size = UDim2.new(3, 3, 5, 5)
				billboard2.StudsOffset = Vector3.new(0, 0, 0)
				billboard2.ZIndexBehavior = "Global"
				billboard2.ClipsDescendants = false
				billboard2.AlwaysOnTop = true
				billboard2.Name = "eyeesspee"

				local textBox = Instance.new("TextBox", billboard)
				textBox.BackgroundTransparency = 1
				textBox.ClearTextOnFocus = false
				textBox.MultiLine = true
				textBox.Size = UDim2.new(1, 1, 1, 1)
				textBox.Font = "GothamBold"
				textBox.Text = v.Name
				textBox.TextScaled = true
				textBox.TextYAlignment = "Top"
				textBox.TextColor3 = Color3.fromRGB(255, 55, 55)

				local textBox2 = Instance.new("TextBox", billboard2)
				textBox2.BackgroundTransparency = 1
				textBox2.ClearTextOnFocus = false
				textBox2.MultiLine = true
				textBox2.Size = UDim2.new(1, 1, 1, 1)
				textBox2.Font = "GothamBold"
				textBox2.Text = " "
				textBox2.BackgroundTransparency = 0.85
				textBox2.TextScaled = true
				textBox2.TextYAlignment = "Top"
				textBox2.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
			end
		end
	end
end

local function removeEsp()
	for i,v in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if v.HumanoidRootPart:FindFirstChild("eyeesspee") then
				v.HumanoidRootPart:FindFirstChild("eyeesspee"):Destroy()
				v.Head.Head:Destroy()
			end
		end
	end
end

local function walkToClosest()
	local closestCurrent = nil
	local currentMagnitude = 999999

	local myHrp = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")

	for i, v in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
		if v.Name ~= game.Players.LocalPlayer.Name then
			if v.Humanoid.Health ~= 0 then
				local theirHrp = v:FindFirstChild("HumanoidRootPart")
				if (myHrp.Position - theirHrp.Position).Magnitude < currentMagnitude then
					if theirHrp.Parent.Humanoid.Health ~= 0 then
						currentMagnitude = (myHrp.Position - theirHrp.Position).Magnitude
						closestCurrent = theirHrp
					end
				end
			end
		end
	end
    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").WalkToPoint = closestCurrent.Position

end
game:GetService("RunService").RenderStepped:connect(function()
	if bai.autoty==true then
            
        
		keypress(0x20)
end
if bai.autokaojin==true then
	walkToClosest()
end
if bai.autozhuanbei==true then
            
        
	if not game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") and not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") then
		keypress(0x31)
		keyrelease(0x31)
	end
end
end)

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/UjsFgNr3"))()
local Window = Library.CreateLib("白", "Ocean")
local Tab = Window:NewTab("主要功能")
local Section = Tab:NewSection("自动功能")
local Section1 = Tab:NewSection("其他功能")
local Section3= Tab:NewSection("玩家")
Section:NewToggle("自动挥武器", "快速挥舞你的武器", function(state)
    if state then
		
       bai.antohuidao=true
       while task.wait() do
       if bai.antohuidao==true
       then
        mouse1press()  wait(3) mouse1release()
            
        end
       end
    else
        bai.antohuidao=false
    end
end)
Section:NewToggle("自动靠近旁边的人", "快速靠近旁边的人", function(state)
    if state then
        bai.autokaojin=true
             
       
        
            
        
    else
        bai.autokaojin=false
    end
end)
Section1:NewToggle("透视", "透视所有人", function(state)
    if state then
      addEsp()
    else
removeEsp()
    end
end)
Section:NewToggle("自动重生", "快速重生", function(state)
    if state then
        bai.kuaisucs=true
        while task.wait() do
            if game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") and bai.kuaisucs==true then
                keypress(0x20)
		keyrelease(0x20)
            end
        end
    else
     bai.kuaisucs=false
    end
end)

Section:NewToggle("自动跳跃", "快速跳跃", function(state)
    if state then
      bai.autoty=true
     
        
      
    else
      bai.autoty=false
    end
end)
Section:NewToggle("自动装备", "快速装备武器", function(state)
    if state then
      bai.autozhuanbei=true
      
    else
      bai.autozhuanbei=false
    end
end)



Section3:NewTextBox("跳跃", "使你的跳跃和输入的速度一样",  function(s) 
    spawn(function()
        while task.wait() do
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = s
end
end)
end)
notify("白","自动功能全部打开即可自动刷经验",5)
