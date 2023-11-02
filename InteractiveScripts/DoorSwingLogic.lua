local TweenService = game:GetService("TweenService")
-- Call outs on block variables 
local door = script.Parent.Door
local hinge = script.Parent.Hinge
local prompt = door.ProximityPrompt
--Index call outs for open/close door
-- mathematical rotation from open to close (Geometrically goes from 0 - 90 degree angle on door turn)
local goalOpen = {}
goalOpen.CFrame = hinge.CFrame * CFrame.Angles(0, math.rad(90), 0)

local goalClose = {}
goalClose.CFrame = hinge.CFrame * CFrame.Angles(0, 0, 0)


--Time to take for door states to change
local tweenInfo = TweenInfo.new(3)

--Middle man dictionary for logic among the opening TIME and later logic states 
local tweenOpen = TweenService:Create(hinge, tweenInfo, goalOpen)
local tweenClose = TweenService:Create(hinge, tweenInfo, goalClose)


-- Logic among player interaction
prompt.Triggered:Connect(function()
	if prompt.ActionText == "Close" then
		tweenClose:Play()
		prompt.ActionText = "Open" 
	else
		tweenOpen:Play()
		prompt.ActionText = "Close"
	end
end)