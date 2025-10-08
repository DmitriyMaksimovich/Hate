Hate = {
  CareerAllowed = false,
  ActiveUpdater = nil,
}

Hate.AllowedCareers = {
  [GameData.CareerLine.BLACKGUARD] = true,
  [GameData.CareerLine.IRON_BREAKER] = true,
  [GameData.CareerLine.BRIGHT_WIZARD] = true,
  [GameData.CareerLine.SORCERER] = true,
  [GameData.CareerLine.WITCH_HUNTER] = true,
  [GameData.CareerLine.WITCH_ELF] = true,
  [GameData.CareerLine.CHOPPA] = true,
  [GameData.CareerLine.SLAYER] = true,
  [GameData.CareerLine.DISCIPLE] = true,
  [GameData.CareerLine.WARRIOR_PRIEST] = true,
}

function Hate.Init()
  RegisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  RegisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
end

function Hate.Enable()
  Hate.CareerAllowed = Hate.isCareerAllowed()
  if not Hate.CareerAllowed then return end
  Hate.ShowHateWindow()
  
  if GameData.Player.career.line == GameData.CareerLine.DISCIPLE or GameData.Player.career.line == GameData.CareerLine.WARRIOR_PRIEST then
    RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.UpdateDoC")
    Hate.UpdateDoC()
    Hate.ActiveUpdater = "DoC"
  elseif GameData.Player.career.line == GameData.CareerLine.WITCH_HUNTER or GameData.Player.career.line == GameData.CareerLine.WITCH_ELF then
    RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.UpdateWE")
    Hate.UpdateWE()
    Hate.ActiveUpdater = "WE"
  elseif GameData.Player.career.line == GameData.CareerLine.BLACKGUARD or GameData.Player.career.line == GameData.CareerLine.IRON_BREAKER then
    RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.UpdateBG")
    Hate.UpdateBG()
    Hate.ActiveUpdater = "BG"
  elseif  GameData.Player.career.line == GameData.CareerLine.CHOPPA or GameData.Player.career.line == GameData.CareerLine.SLAYER then
    RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.UpdateChoppa")
    Hate.UpdateChoppa()
    Hate.ActiveUpdater = "Choppa"
  elseif  GameData.Player.career.line == GameData.CareerLine.SORCERER or GameData.Player.career.line == GameData.CareerLine.BRIGHT_WIZARD then
    RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.UpdateSorc")
    Hate.UpdateSorc()
    Hate.ActiveUpdater = "Sorc"
  end
end

function Hate.ShowHateWindow()
  CreateWindow("HateWindow", true)
  LayoutEditor.RegisterWindow("HateWindow", L"Hate", L"Hate", true, true, true, nil)
end

function Hate.UpdateDoC()
  if not Hate.CareerAllowed then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  if Resource <= 100 then
    LabelSetTextColor("HateWindowCounter", 200, 0, 0)
  elseif Resource > 100 and Resource < 200 then
    LabelSetTextColor("HateWindowCounter", 255, 255, 0)
  else
    LabelSetTextColor("HateWindowCounter", 255, 255, 255)
  end
end

function Hate.UpdateWE()
  if not Hate.CareerAllowed then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  if Resource == 5 then
     LabelSetTextColor("HateWindowCounter", 200, 0, 0)
  elseif Resource < 5 then
    LabelSetTextColor("HateWindowCounter", 255, 255, 255)
  end
end

function Hate.UpdateChoppa()
  if not Hate.CareerAllowed then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  if Resource >= 75 then
     LabelSetTextColor("HateWindowCounter", 200, 0, 0)
  elseif Resource < 75 and Resource >= 25 then
    LabelSetTextColor("HateWindowCounter", 255, 255, 0)
  else
    LabelSetTextColor("HateWindowCounter", 255, 255, 255)
  end
end

function Hate.UpdateSorc()
  if not Hate.CareerAllowed then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))
end

function Hate.UpdateBG()
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  if Resource == 100 then
    LabelSetTextColor("HateWindowCounter", 255, 100, 255)
  elseif Resource >= 75 then
     LabelSetTextColor("HateWindowCounter", 200, 0, 0)
  elseif Resource >= 50 then
    LabelSetTextColor("HateWindowCounter", 255, 150, 10)
  elseif Resource >= 25 then
    LabelSetTextColor("HateWindowCounter", 255, 255, 0)
  else
    LabelSetTextColor("HateWindowCounter", 255, 255, 255)
  end
end

function Hate.Shutdown()
  UnregisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  UnregisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
  if not Hate.CareerAllowed then return end

  funcName = string.format("Hate.Update%s", Hate.ActiveUpdater)
  UnregisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, funcName)
end

function Hate.isCareerAllowed()
  return Hate.AllowedCareers[GameData.Player.career.line] or false
end
