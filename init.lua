require("tweet");


lighton=0
pin=4
gpio.mode(pin,gpio.OUTPUT)

enduser_setup.start(
  function()
    print("Connected to wifi as:" .. wifi.sta.getip())
    if file.open("enduser_custom_parameters.json", "r") then
      CustomParams = file.readline()
      print(CustomParams)
      file.close()
    end
    t = sjson.decode(CustomParams)
    print(t)
    for k,v in pairs(t) do 
    print(k,v) 
    if("twitterMessage" == k) then
      Message = v
    elseif ("twitterAPI" == k) then
     Key = v
    end
    end
    setAPIKey(Key)
    sendTweet(Message)
  end,
  function(err, str)
    print("enduser_setup: Err #" .. err .. ": " .. str)
  end,
  print -- Lua print function can serve as the debug callback
);

tmr.alarm(1,2000,1,function()
    if lighton==0 then
        lighton=1
        gpio.write(pin,gpio.HIGH)
    else
        lighton=0
         gpio.write(pin,gpio.LOW)
    end
end)
