-- Gui to Lua
-- Version: 3.2

-- Instances:

local UnbannableChat = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Message = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UICorner_2 = Instance.new("UICorner")
local Info = Instance.new("TextLabel")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Close = Instance.new("TextButton")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")

--Properties:

UnbannableChat.Name = "UnbannableChat"
UnbannableChat.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
UnbannableChat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = UnbannableChat
Main.BackgroundColor3 = Color3.fromRGB(197, 197, 197)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.329832494, 0, 0.451977462, 0)
Main.Size = UDim2.new(0.34010151, 0, 0.0957910046, 0)

Message.Name = "Message"
Message.Parent = Main
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0.03233831, 0, 0.469696969, 0)
Message.Size = UDim2.new(0.935323358, 0, 0.409090906, 0)
Message.ClearTextOnFocus = false
Message.Font = Enum.Font.GothamBold
Message.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
Message.PlaceholderText = "Type a message here.. (Enter or SCRLK to send)"
Message.Text = ""
Message.TextColor3 = Color3.fromRGB(0, 0, 0)
Message.TextScaled = true
Message.TextSize = 14.000
Message.TextWrapped = true

UICorner.CornerRadius = UDim.new(0.300000012, 0)
UICorner.Parent = Message

UIAspectRatioConstraint.Parent = Message
UIAspectRatioConstraint.AspectRatio = 13.926

UICorner_2.CornerRadius = UDim.new(0.300000012, 0)
UICorner_2.Parent = Main

Info.Name = "Info"
Info.Parent = Main
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.BorderColor3 = Color3.fromRGB(0, 0, 0)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(0.149253726, 0, 0.0909090936, 0)
Info.Size = UDim2.new(0.699004948, 0, 0.287878782, 0)
Info.Font = Enum.Font.GothamBold
Info.Text = "Unbannable Chat"
Info.TextColor3 = Color3.fromRGB(255, 255, 255)
Info.TextScaled = true
Info.TextSize = 14.000
Info.TextWrapped = true

UIAspectRatioConstraint_2.Parent = Info
UIAspectRatioConstraint_2.AspectRatio = 14.789

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.942786098, 0, 0.106060609, 0)
Close.Size = UDim2.new(0.0398009941, 0, 0.24242425, 0)
Close.Font = Enum.Font.GothamBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true

UIAspectRatioConstraint_3.Parent = Close

UIAspectRatioConstraint_4.Parent = Main
UIAspectRatioConstraint_4.AspectRatio = 6.091

-- Scripts:

local function MXVK_fake_script() -- Close.Close 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(MXVK_fake_script)()
local function XERKVQA_fake_script() -- Main.Chat 
	local script = Instance.new('LocalScript', Main)

	local ChatVersion = game:WaitForChild("TextChatService").ChatVersion
	
	local function PostMessage(Message)
		if ChatVersion == Enum.ChatVersion.LegacyChatService then
			
			local ChatEvent = game:WaitForChild("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
			
			ChatEvent:FireServer(Message, "All")
			
		else
			game:WaitForChild("TextChatService").TextChannels.RBXGeneral:SendAsync(Message)
		end
	end
	
	script.Parent.Active = true
	script.Parent.Draggable = true
	
	game:GetService("UserInputService").InputBegan:Connect(function(Input)
		
		if Input.KeyCode == Enum.KeyCode.Return then
			if script.Parent.Message.Focused then
				PostMessage(script.Parent.Message.Text)
			end
		end
		
	end)
	
	game:GetService("UserInputService").InputBegan:Connect(function(Input)
		
		if Input.KeyCode == Enum.KeyCode.ScrollLock then
			PostMessage(script.Parent.Message.Text)
		end
		
	end)
end
coroutine.wrap(XERKVQA_fake_script)()
