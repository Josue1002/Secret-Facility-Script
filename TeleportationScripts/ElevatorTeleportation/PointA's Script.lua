--elevator point A
local PointA = game.Workspace.PointA
local PointB = game.Workspace.PointB

script.Parent.Touched:Connect(function(hit)
	local Player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if Player then
		
		local CurrentlyTeleporting = Player.Character:FindFirstChild("CurrentlyTeleporting")
		if not CurrentlyTeleporting then return end
		
		if not CurrentlyTeleporting.Value then
		
			CurrentlyTeleporting.Value = true
			Player.Character.HumanoidRootPart.CFrame = PointB.CFrame + Vector3.new(0, 5, 0)
			wait(3)
			CurrentlyTeleporting.Value = false
			
			
		end
	end
end)
