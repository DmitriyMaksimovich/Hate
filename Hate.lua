Hate = {}

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
  if GameData.Player.career.line ~= GameData.CareerLine.BLACKGUARD then return end
  local Resource = GetCareerResource(GameData.BuffTargetType.SELF)
  LabelSetText("HateWindowCounter", towstring(Resource))

  local Stage1 = math.floor(Resource / 25)
  local Stage2 = math.floor(Resource / 30)

  LabelSetText("HateWindowStage1", towstring(Stage1))
  LabelSetText("HateWindowStage2", towstring(Stage2))
end

function Hate.shtdwn()
  UnregisterEventHandler(SystemData.Events.ENTER_WORLD, "Hate.Enable")
  UnregisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "Hate.Enable")
  if GameData.Player.career.line ~= GameData.CareerLine.BLACKGUARD then return end
  UnregisterEventHandler(SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "Hate.Update")
end
