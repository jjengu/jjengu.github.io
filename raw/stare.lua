getgenv().Stare = true
getgenv().Update = 0.05 -- I don't suggest changing




local player = game.Players.LocalPlayer
local lastLookDirection = nil
local lookThreshold = getgenv().Update 
function findplayer()
    local nearestPlayer = nil
    local nearestDistance = math.huge
    
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (otherPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = otherPlayer
            end
        end
    end
    
    return nearestPlayer
end

function Stare()
    local nearestPlayer = findplayer()
    
    if nearestPlayer then
        local targetPosition = nearestPlayer.Character.HumanoidRootPart.Position
        local playerPosition = player.Character.HumanoidRootPart.Position
        targetPosition = Vector3.new(targetPosition.X, playerPosition.Y, targetPosition.Z) -- Set the Y position to the player's Y position

        local lookDirection = (targetPosition - playerPosition).unit

        -- Check if the direction change is significant enough
        if lastLookDirection then
            local angle = math.acos(lookDirection:Dot(lastLookDirection))
            if angle > lookThreshold then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(playerPosition, playerPosition + lookDirection)
            end
        else
            player.Character.HumanoidRootPart.CFrame = CFrame.new(playerPosition, playerPosition + lookDirection)
        end

        lastLookDirection = lookDirection
    end
end

while true do
    if getgenv().Stare == true then
        Stare()
        player.Character:WaitForChild("Humanoid").AutoRotate = false
    else
        player.Character:WaitForChild("Humanoid").AutoRotate = true
    end
    wait()
end

