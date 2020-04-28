Hate = {
  CareerAllowed = false
}

function Hate.Init()
  RegisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  RegisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
end

function Hate.Enable()
  Hate.CareerAllowed = Hate.isCareerAllowed()
  if not Hate.CareerAllowed then return end
  Hate.ShowHateWindow()
  RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.Update")
  Hate.Update()
end

function Hate.ShowHateWindow()
  CreateWindow("HateWindow", true)
  LayoutEditor.RegisterWindow("HateWindow", L"Hate", L"Hate", true, true, true, nil)
end

function Hate.Update()
  if not Hate.CareerAllowed then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  local Stage1 = math.floor(Resource / 25)
  local Stage2 = math.floor(Resource / 30)

  LabelSetText("HateWindowStage1", towstring(Stage1))
  LabelSetText("HateWindowStage2", towstring(Stage2))
end

function Hate.Shutdown()
  UnregisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  UnregisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
  if not Hate.CareerAllowed then return end
  UnregisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.Update")
end

function Hate.isCareerAllowed()
  if GameData.Player.career.line == GameData.CareerLine.BLACKGUARD or GameData.Player.career.line == GameData.CareerLine.IRON_BREAKER then
    return true
  else
    return false
  end
end
