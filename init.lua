require("tweet");

MAIN_LOOP_DELAY = 5
Count = 0
LED_PIN=4
pinState=1
SWITCH_PIN = 3
gpio.mode(LED_PIN,gpio.OUTPUT)
gpio.mode(SWITCH_PIN,gpio.INT)
LEDDelay = 2000
LEDState = true
loopSinceStateChange = 0
tweetReady = false

-- Helper Function
function file_exists(name)
   local f=file.open(name,"r")
   if f~=nil then file.close(f) return true else return false end
end
--End Helper Function

sntp.sync(nil, nil, nil, 1)  


if file_exists('eus_params.lua') then
    dofile('eus_params.lua')
    wifi.setmode(wifi.STATION)
    station_cfg={}
    station_cfg.ssid=wifi_ssid
    station_cfg.pwd=wifi_password
    station_cfg.save=true
    wifi.sta.config(station_cfg) 
    wifi.sta.connect()
    setAPIKey(twitter_key)
    tweetReady = true
else
    enduser_setup.start(
      function()
        print("Connected to wifi as:" .. wifi.sta.getip())
        sntp.sync(nil, nil, nil, 1)  
        dofile('eus_params.lua')
        print("Twitter Key: " .. twitter_key)
        setAPIKey(twitter_key)
        sendTweet("Welcome to Tweet8266 bot")
        tweetReady = true
        
      end,
      function(err, str)
        print("enduser_setup: Err #" .. err .. ": " .. str)
      end
    );
end

-- Main loop for running our SM
local mainLoop = tmr.create()
mainLoop:register(MAIN_LOOP_DELAY, tmr.ALARM_AUTO, function ()
    pinState = gpio.read(SWITCH_PIN)
    if pinState==1 then --deafult pinState
        LEDDelay =2000

        -- was the button held for more than 50 but less than
        if loopSinceStateChange*MAIN_LOOP_DELAY > 50 and loopSinceStateChange*MAIN_LOOP_DELAY < 4900 then
            if tweetReady then
                sendTweet(default_message)
                print("DID A THING");
            end
        end
        if loopSinceStateChange*MAIN_LOOP_DELAY > 5000 then
            wifi.sta.clearconfig()
            node.restart()
            file.remove('eus_params.lua')
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



