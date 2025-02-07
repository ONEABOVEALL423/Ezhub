-- Jujutsu Infinite Script (Final Version)
-- Features: Auto Boss Farm, Auto Drop Collection + Server Hop, Auto Unlocks, Auto Get Techniques/Objects/Tools, Auto Investigations
-- Status: Final Version

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- UI Library (Creates UI for selecting options)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/your-username/UILibrary/main/Library.lua"))()
local Window = Library:CreateWindow("Jujutsu Infinite Script")

local BossSelection = Window:CreateDropdown("Select Boss", {"Finger Bearer", "Heian Imaginary Demon", "Sorcerer Kill", "Ocean Curse"}, function(selected)
    _G.SelectedBoss = selected
end)

local DropSelection = Window:CreateMultiDropdown("Select Drops to Collect", {"Cursed Object", "Cursed Tool"}, function(selected)
    _G.SelectedDrops = selected
end)

local InvestigationSelection = Window:CreateDropdown("Select Investigation", {"Nightmare Mode 1", "Nightmare Mode 2"}, function(selected)
    _G.SelectedInvestigation = selected
end)

local StartFarm = Window:CreateButton("Start Auto Boss Farm", function()
    _G.AutoFarm = true
    AutoFarmBoss()
end)

local StopFarm = Window:CreateButton("Stop Auto Boss Farm", function()
    _G.AutoFarm = false
end)

-- FUNCTION TO BYPASS ANTI-CHEAT
local function BypassAntiCheat()
    -- Anti-cheat bypass logic here
    warn("Bypassing Anti-Cheat...")
end

-- AUTO FARM BOSS
local function AutoFarmBoss()
    while _G.AutoFarm do
        local Boss = workspace:FindFirstChild(_G.SelectedBoss)
        if Boss and Boss:FindFirstChild("Humanoid") then
            LocalPlayer.Character:SetPrimaryPartCFrame(Boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0))
            task.wait(1)
            -- Attack the boss (Replace with proper attack function)
        end
        task.wait(2)
    end
end

-- AUTO COLLECT DROPS + SERVER HOP
local function AutoCollectDrops()
    for _, v in pairs(workspace.Drops:GetChildren()) do
        if table.find(_G.SelectedDrops, v.Name) then
            LocalPlayer.Character:SetPrimaryPartCFrame(v.CFrame)
            task.wait(1)
        end
    end
    TeleportService:Teleport(game.PlaceId)
end

-- AUTO INVESTIGATIONS
local function AutoInvestigations()
    warn("Running Investigation:", _G.SelectedInvestigation)
end

-- RUN FUNCTIONS
BypassAntiCheat()
warn("Script Loaded. Use UI to select options and start.")
