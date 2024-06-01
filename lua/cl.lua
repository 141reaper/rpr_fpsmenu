RageUI.Banner(true, false)
local function ClearGraphics(ped)
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(ped)
    ClearPedWetness(ped)
    ClearPedEnvDirt(ped)
    ResetPedVisibleDamage(ped)
    ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end

local function SetLow()
    local ped = PlayerPedId()
    SetTimecycleModifier('exile1_plane')
    ClearGraphics(ped)
end


local function SetLowTexture()
    local ped = PlayerPedId()
    SetTimecycleModifier('v_janitor')
    ClearGraphics(ped)
end

local function SetNoGpu()
    local ped = PlayerPedId()
    SetTimecycleModifier('HicksbarNEW')
    ClearGraphics(ped)
end


local function ResetGraphics()
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
end


function fpsmenu()
    local fpsmenu = RageUI.CreateMenu("", "FPS Verbessern", 0, 400, "fpsmenu", "fpsmenu")
    RageUI.Visible(fpsmenu, not RageUI.Visible(fpsmenu))
    while fpsmenu do
        Wait(0)
            RageUI.IsVisible(fpsmenu, true, true, true, function()
                RageUI.ButtonWithStyle("Niedrige Einstellungen", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetLow()
                    end
                end, fpsmenu)
                RageUI.ButtonWithStyle("Niedrige Texturen", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetLowTexture()
                    end
                end, fpsmenu)
                RageUI.ButtonWithStyle("Scheiß PC (Mein Beileid)", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetNoGpu()
                    end
                end, fpsmenu)
                RageUI.ButtonWithStyle("Grafik zurücksetzen", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ResetGraphics()
                    end
                end, fpsmenu)
			end, function()
			end)
              if not RageUI.Visible(fpsmenu) and not RageUI.Visible(fpsmenuSub) then
              fpsmenu = RMenu:DeleteType("fpsmenu", true)
        end
    end
end


RegisterCommand('fpsmenu', function ()
    fpsmenu()
  end, false)