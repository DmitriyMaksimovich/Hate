Hate = {}
--BLACKGUARD
--IRON_BREAKER

function Hate.Init()
  RegisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  RegisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
end

function Hate.Enable()
  if GameData.Player.career.line ~= GameData.CareerLine.BLACKGUARD then return end
  Hate.ShowHateWindow()
  RegisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.Update")
  Hate.Update()
end

function Hate.ShowHateWindow()
  CreateWindow("HateWindow", true)
  LayoutEditor.RegisterWindow("HateWindow", L"Hate", L"Hate", true, true, true, nil)
end

function Hate.Update()
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))
end

function Rage.shtdwn()
  UnregisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  UnregisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
  UnregisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.Update")
end
