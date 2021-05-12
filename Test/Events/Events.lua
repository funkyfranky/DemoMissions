
local dcs=true

if dcs then

  local handler={}
  
  function handler:onEvent(event)
  
    if event and event.id==30 then
  
      local text=string.format("FF Captured event ID=%s : ", tostring(event.id))
      text=text..string.format("Initiator=%s ", event.initiator and tostring(event.initiator:getName()) or "unknown")
      text=text..string.format("Target=%s", event.target and tostring(event.target:getName()) or "unknown")
      
      trigger.action.outText(text, 60)
      env.info(text)
      
    end
    
  end
  
  world.addEventHandler(handler)
  
--else

  mhandler=EVENTHANDLER:New()
  
  mhandler:HandleEvent(EVENTS.UnitLost)
  --mhandler:HandleEvent(EVENTS.Crash)
  --mhandler:HandleEvent(EVENTS.Kill)
  
  function mhandler:OnEventUnitLost(EventData)
    local eventdata=EventData --Core.Event#EVENTDATA
    
    local text=string.format("Unit LOST %s", tostring(eventdata.IniUnitName))
    MESSAGE:New(text, 12):ToAll()
    env.info(text)
  
  end
  
  function mhandler:OnEventCrash(EventData)
    local eventdata=EventData --Core.Event#EVENTDATA
    
    local text=string.format("Unit CRASHED %s", tostring(eventdata.IniUnitName))
    MESSAGE:New(text, 12):ToAll()
    env.info(text)
  
  end
  
  function mhandler:OnEventKill(EventData)
    local eventdata=EventData --Core.Event#EVENTDATA
    
    local text=string.format("Unit %s KILLED %s", tostring(eventdata.IniUnitName), tostring(eventdata.TgtUnitName))
    MESSAGE:New(text, 12):ToAll()
    env.info(text)
  
  end
  
  
  --[[
  local a=UNIT:FindByName("Aerial-1-1")
  a:Explode(1000, 10)
  
  local b=UNIT:FindByName("Aerial-2-1")
  b:Explode(1000, 20)
  ]]
end