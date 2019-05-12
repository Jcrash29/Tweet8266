require("tweet");

MAIN_LOOP_DELAY = 5
Count = 0
LED_PIN=4
SWITCH_PIN = 3
gpio.mode(LED_PIN,gpio.OUTPUT)
gpio.mode(SWITCH_PIN,gpio.INT)
LEDDelay = 2000
LEDState = true
loopSinceStateChange = 0

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

local function switchTrig(level, when)
    print("Switch went " .. level)
    pinState = level
end

gpio.trig(SWITCH_PIN, "both", switchTrig)


local mainLoop = tmr.create()
mainLoop:register(MAIN_LOOP_DELAY, tmr.ALARM_AUTO, function ()
    if pinState==1 then --deafult pinState
        LEDDelay =2000

        -- was the button held for more than 50 but less than
        if loopSinceStateChange*MAIN_LOOP_DELAY > 50 and loopSinceStateChange*MAIN_LOOP_DELAY < 4900 then
        
            sendTweet(default_message)
        end
        loopSinceStateChange = 0
    else
        loopSinceStateChange = loopSinceStateChange+1

        if(loopSinceStateChange*MAIN_LOOP_DELAY) > 5000 then
            LEDDelay=300
        end
        
    end
    prevPinState = pinState

    -- Manage LED's
    Count = Count+1
    timePassed  = Count*MAIN_LOOP_DELAY
    if timePassed > LEDDelay then
        if LEDState then
            gpio.write(LED_PIN,gpio.HIGH)
        else
            gpio.write(LED_PIN,gpio.LOW)        
        end
        LEDState = not LEDState
        Count = 0
    end
end)
mainLoop:start()
