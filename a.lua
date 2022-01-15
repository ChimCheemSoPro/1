repeat wait() until game:IsLoaded()
while true do wait()
	if game.Players.LocalPlayer then
		wait(3)
		break
	end
end
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
    v.Function()
end
_G.Farmbounty = true
function tweento(cfgo)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - cfgo.Position).Magnitude/300, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = cfgo})
        tween:Play()
    end)
    if not tween then return err end
end
function tp(cfgo)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cfgo
end
function godmode()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        _G.Change = true
        repeat wait()
            tweento(CFrame.new(2174.94873, 28.7312393, -6728.83154))
        until (Vector3.new(2174.94873, 28.7312393, -6728.83154)-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 10
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
        if game:GetService("Workspace").Enemies:FindFirstChild("Marine Commodore [Lv. 1700]") then
            repeat wait()
                tweento(game:GetService("Workspace").Enemies["Marine Commodore [Lv. 1700]"].HumanoidRootPart.CFrame * CFrame.new(0,0,-5))
            until game.Players.LocalPlayer.Character.Humanoid.Health < 0
        else
            Teleport()
        end
        _G.Change = false
    end
end
spawn(function()
    while wait(.1) do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    _G.SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)
function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA("Seat") then
        v:Destroy()
    end
end

Method = CFrame.new(0,0,5)
Methodu = 1
spawn(function()
    while wait() do
        if Methodu == 1 then
            Method = CFrame.new(0,0,-5)
            Methodu = 2
        elseif Methodu == 2 then
            Method = CFrame.new(0,5,0)
            Methodu = 3
        elseif Methodu == 3 then
            Method = CFrame.new(0,-5,0)
            Methodu = 4
        elseif Methodu == 4 then
            Method = CFrame.new(0,0,5)
            Methodu = 1
        end
    end
end)
_G.NameRandom = nil
_G.Change = false
spawn(function()
    while _G.Farmbounty do wait()
        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health <= 0 and _G.Change == false then
            for i, v in pairs(game:GetService("Players"):GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= _G.NameRandom then
                    local char = v.Character
                    if char then
                        local humanoid = char:FindFirstChild('Humanoid')
                        if humanoid then
                            repeat wait()
                                EquipWeapon(_G.SelectToolWeaponGun)
                                _G.NameRandom = v.Name
                                tp(game.Players:FindFirstChild(_G.NameRandom).Character.HumanoidRootPart.CFrame * Method)
                                game:GetService'VirtualUser':CaptureController()
				                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until _G.Farmbounty == false or not v.Character or v.Character.Humanoid.Health <= 0 or _G.Change == true or not v.Character:FindFirstChild("HumanoidRootPart") or game.Players.LocalPlayer.Character.Humanoid.Health > 0 or not game.Players:FindFirstChild(_G.NameRandom)
                        end
                    end
                end
            end
        elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            repeat wait() until game.Players.LocalPlayer.Character.Humanoid.Health > 50
            godmode()
        end
    end
end)
spawn(function()
    while wait(15) do
        if game.Players[_G.NameRandom].Character.Humanoid.Health == game.Players[_G.NameRandom].Character.Humanoid.MaxHealth then
            _G.Change = true
            wait()
            _G.Change = false
        else
            wait(8)
            _G.Change = true
            wait()
            _G.Change = false
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
            local p=game.Players.LocalPlayer;
                    local oldcframe;
                    local holdingfoil=false;
                    p.Character.Humanoid:SetStateEnabled(15,false);
                    p.Character.Humanoid:SetStateEnabled(16,false);
                    -- p.Character.Humanoid:SetStateEnabled(18,false);
                    p.CharacterRemoving:Connect(function()
                        if (p.Character) then
                            local t=p.Character:FindFirstChild("Torso")
                            if (t ~= nil) then oldcframe=t.CFrame end
                            if (p.Character:findFirstChild("Foil")) then holdingfoil=true end
                        end
                    end)
                    p.CharacterAdded:Connect(function()
                        while p.Character==nil do wait() end
                        while p.Character.Parent==nil do wait() end
                        local h=p.Character:WaitForChild("Humanoid")
                        local rp=p.Character:WaitForChild("HumanoidRootPart")
                        --[[ created by static / "Des" ]]
                        if (h ~= nil and rp ~= nil) then
                            h:SetStateEnabled(15,false);
                            h:SetStateEnabled(16,false);
                            -- h:SetStateEnabled(18,false);
                            if (holdingfoil) then
                                holdingfoil=false
                                local foil=p.Backpack:FindFirstChild("Foil")
                                if (foil ~= nil) then
                                    foil.Parent=p.Character
                                end
                            end
                        end
                    end)
                end
        end
    end
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.Farmbounty then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

spawn(function()
    while wait(.1) do
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
            if v:IsA("Tool") then
                if v:FindFirstChild("RemoteFunctionShoot") then 
                    _G.SelectToolWeaponGun = v.Name
                end
            end
        end
    end
end)

spawn(function()
    local mousee = game:GetService('Players').LocalPlayer:GetMouse()
    mousee.Button1Down:Connect(function()
        if _G.Farmbounty and game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectToolWeaponGun).RemoteFunctionShoot then
            local args = {
                [1] = game:GetService("Players"):FindFirstChild(_G.NameRandom).Character.HumanoidRootPart.Position,
                [2] = game:GetService("Players"):FindFirstChild(_G.NameRandom).Character.Head
            }
            game:GetService("Players").LocalPlayer.Character[_G.SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(unpack(args))
        end
    end)
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            if game.Players.LocalPlayer.Character.Humanoid.Health > 0 and game.Players.LocalPlayer.Character.Humanoid.Health < 100 then
                _G.Change = true
                wait(1)
                game.Players.LocalPlayer.Character.Head:Destroy()
                wait(5)
                _G.Change = false
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            wait(120)
            _G.hopbounty = true
            _G.Farmbounty = false
        end
    end
end)

local PlaceID = game.PlaceId
						local AllIDs = {}
						local foundAnything = ""
						local actualHour = os.date("!*t").hour
						local Deleted = false
						function TPReturner()
							local Site;
							if foundAnything == "" then
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
							else
								Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
							end
							local ID = ""
							if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
								foundAnything = Site.nextPageCursor
							end
							local num = 0;
							for i,v in pairs(Site.data) do
								local Possible = true
								ID = tostring(v.id)
								if tonumber(v.maxPlayers) > tonumber(v.playing) then
									for _,Existing in pairs(AllIDs) do
										if num ~= 0 then
											if ID == tostring(Existing) then
												Possible = false
											end
										else
											if tonumber(actualHour) ~= tonumber(Existing) then
												local delFile = pcall(function()
													-- delfile("NotSameServers.json")
													AllIDs = {}
													table.insert(AllIDs, actualHour)
												end)
											end
										end
										num = num + 1
									end
									if Possible == true then
										table.insert(AllIDs, ID)
										wait()
										pcall(function()
											-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
											wait()
											game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
										end)
										wait(2)
									end
								end
							end
						end
						function Teleport()
							while wait() do
								pcall(function()
									TPReturner()
									if foundAnything ~= "" then
										TPReturner()
									end
								end)
							end
						end

spawn(function()
    while wait() do
        if _G.hopbounty then
            if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.InCombat.Visible == false then
                syn.queue_on_teleport("repeat wait() until game:IsLoaded() wait(7) loadstring(game:HttpGet'https://chvn--vn--vn--vn.000webhostapp.com/bounty.lua')()")
                Teleport()
            end
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            game.Players.LocalPlayer.Name = ""
            game.Players.LocalPlayer.DisplayName = ""
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Farmbounty then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.PvpDisabled.Visible == true then
                    local args = {
                        [1] = "EnablePvp"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if _G.Farmbounty then
            if _G.NameRandom ~= nil then
                if not game:GetService("Workspace").Characters:FindFirstChild(_G.NameRandom) then
                    _G.Change = true
                    wait()
                    _G.Change = false
                end
            end
        end
    end
end)
