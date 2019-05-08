require("tweet");


lighton=0
pin=4
gpio.mode(pin,gpio.OUTPUT)

enduser_setup.start(
  function()
    print("Connected to wifi as:" .. wifi.sta.getip())
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end
);

local mytimer = tmr.create()
mytimer:register(2000, tmr.ALARM_AUTO, function ()    
    if lighton==0 then
        lighton=1
        gpio.write(pin,gpio.HIGH)
    else
        lighton=0
         gpio.write(pin,gpio.LOW)
    end
end)
mytimer:start()
