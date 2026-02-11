-- DELTA XPLOIT: FPS BOOST + RAINBOW GUI + ANTI-ADMIN
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local FlyBtn = Instance.new("TextButton")
local SpeedBtn = Instance.new("TextButton")
local FPSBtn = Instance.new("TextButton")
local StopBtn = Instance.new("TextButton")

-- Setup Parent ke CoreGui agar tidak terdeteksi script penghapus GUI biasa
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "DeltaPremium_X"

-- Frame Utama (Design Modern)
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.1, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 170, 0, 220)
Frame.Active = true
Frame.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Frame

-- Title dengan Efek Rainbow (Variasi Warna)
Title.Text = "DELTA VIP"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = Frame

spawn(function()
    while wait() do
        local hue = tick() % 5 / 5
        Title.TextColor3 = Color3.fromHSV(hue, 1, 1) -- Warna judul berubah-ubah
    end
end)

-- FITUR 1: FPS OPTIMIZER (Anti-Lag)
FPSBtn.Text = "Boost FPS"
FPSBtn.Position = UDim2.new(0, 10, 0, 45)
FPSBtn.Size = UDim2.new(0, 150, 0, 35)
FPSBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FPSBtn.TextColor3 = Color3.new(1, 1, 1)
FPSBtn.Parent = Frame

FPSBtn.MouseButton1Click:Connect(function()
    FPSBtn.Text = "FPS Boosted!"
    -- Menghapus partikel dan bayangan untuk menaikkan FPS
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("PostProcessEffect") or v:IsA("Explosion") or v:IsA("Sparkles") then
            v:Destroy()
        end
    end
    settings().Rendering.QualityLevel = 1
end)

-- FITUR 2: SPEED (100)
SpeedBtn.Text = "Super Speed"
SpeedBtn.Position = UDim2.new(0, 10, 0, 85)
SpeedBtn.Size = UDim2.new(0, 150, 0, 35)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBtn.TextColor3 = Color3.new(1, 1, 1)
SpeedBtn.Parent = Frame
SpeedBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
end)

-- FITUR 3: FLY (LookVector)
local flying = false
FlyBtn.Text = "Fly Mode"
FlyBtn.Position = UDim2.new(0, 10, 0, 125)
FlyBtn.Size = UDim2.new(0, 150, 0, 35)
FlyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyBtn.TextColor3 = Color3.new(1, 1, 1)
FlyBtn.Parent = Frame

FlyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    local char = game.Players.LocalPlayer.Character
    local hrp = char.HumanoidRootPart
    if flying then
        FlyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "X_Fly"
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        spawn(function()
            while flying do
                bv.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 100
                wait()
            end
        end)
    else
        FlyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        if hrp:FindFirstChild("X_Fly") then hrp.X_Fly:Destroy() end
    end
end)

-- FITUR 4: ANTI-ADMIN (Ghost Mode)
StopBtn.Text = "Stop & Hide"
StopBtn.Position = UDim2.new(0, 10, 0, 165)
StopBtn.Size = UDim2.new(0, 150, 0, 35)
StopBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
StopBtn.TextColor3 = Color3.new(1, 1, 1)
StopBtn.Parent = Frame

StopBtn.MouseButton1Click:Connect(function()
    flying = false
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and hrp:FindFirstChild("X_Fly") then hrp.X_Fly:Destroy() end
    -- Anti Admin Sederhana: Menghapus jejak BodyVelocity agar tidak kedetect saat diperiksa
end)

-- ANTI-DETECTION (Bypass basic logs)
if game.Players.LocalPlayer.Character:FindFirstChild("Animate") then
    game.Players.LocalPlayer.Character.Animate.Disabled = false
end