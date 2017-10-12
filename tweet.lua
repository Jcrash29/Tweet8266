-- Origional Author: 2015 ok1cdj

thingtweetAPIKey = ""

function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str    
end

function sendTweet(str)
   print("Sending tweet...")
   conn=net.createConnection(net.TCP, 0) 
   conn:on("receive", function(conn, payload) print(payload) end) 
   conn:connect(80,'184.106.153.149') 
   conn:send("GET /apps/thingtweet/1/statuses/update?key="..thingtweetAPIKey.."&status="..urlencode(str).." HTTP/1.1\r\n") 
   conn:send("Host: api.thingspeak.com\r\n") 
   conn:send("Accept: */*\r\n") 
   conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
   conn:send("\r\n")
   conn:on("disconnection", function(conn)
      print("Got disconnection...")
   end)
end

function setAPIKey(str)
   thingtweetAPIKey = str
end
