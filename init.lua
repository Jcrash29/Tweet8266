require("tweet");

print("HEllO world")

lighton=0
pin=4
gpio.mode(pin,gpio.OUTPUT)

enduser_setup.start(
  function()
    print("Connected to wifi as:" .. wifi.sta.getip())
    dofile('eus_params.lua')
    print("Twitter Key: " .. twitter_key)
    setAPIKey(twitter_key)
    sendTweet("Welcome to Tweet8266 bot")
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end
);

print("GOT HERE");

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
