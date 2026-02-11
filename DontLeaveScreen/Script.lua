local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")

local screen = script:WaitForChild("DontLeaveScreen")
local frame = screen:WaitForChild("Frame")
local button = frame:WaitForChild("TextButton")
local text = frame:WaitForChild("TextLabel")

GuiService.MenuOpened:Connect(function()
 button.Rotation = 0
 button.Transparency = 0
 frame.Transparency = 0
 text.TextTransparency = 0
 screen.Enabled = true
 print("MenuOpened")
end)

button.MouseEnter:Connect(function()
 TweenService:Create(button,
  TweenInfo.new(.1),
  {Rotation = 15}
 ):Play()
end)

button.MouseLeave:Connect(function()
 TweenService:Create(button,
  TweenInfo.new(.1),
  {Rotation = 0}
 ):Play()
end)

button.MouseButton1Click:Connect(function()
 TweenService:Create(frame,
  TweenInfo.new(.2),
  {Transparency = 1}
 ):Play()

 TweenService:Create(button,
  TweenInfo.new(.2),
  {Transparency = 1}
 ):Play()

 TweenService:Create(text,
  TweenInfo.new(.2),
  {TextTransparency = 1}
 ):Play()

 task.wait(.2)
 screen.Enabled = false
end)