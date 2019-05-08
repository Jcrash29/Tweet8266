# Introduction

This code base provides firmware and an API for directly connecting an ESP8266 to the twitter API. 

# API 

Connect to Wi-Fi 
* Wi-Fi uid
* Wi-Fi password

Connect to twitter
* twitter key

Post 
 * standard message ending in newline (\n) 

PostOnGpio
* standard message to post when gpio is transitioned 

# Errors

* NotSetup - if initalizatons were incomplete 
* notConnectedToWifi 
* notConnectedToTwitter
* unrecognizedCommand

# ToDo

* Create method for storing credentials on device
* Create software for uploading credentials 


# Getting Started

## Hardware
* [ESP8266](https://www.amazon.com/gp/product/B01N98BTRH/ref=oh_aui_detailpage_o00_s00?ie=UTF8&psc=1)
* [ESP8266 to Serial board](https://www.amazon.com/gp/product/B06XHD99MZ/ref=oh_aui_detailpage_o02_s00?ie=UTF8&psc=1)


## Software

[CH341/CH340 driver](https://sparks.gogo.co.nz/ch340.html)
[NodeMCU-flasher](https://github.com/nodemcu/nodemcu-flasher/tree/master/Win64/Release)

## Programming Firmware to the board

Thanks to [Bradon for showing the proper way to connect the ESP8266](https://www.amazon.com/gp/customer-reviews/R16RKWR68SXN9W/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01J2UXXCA)

## Programming the Firmware
Using a linux system (oracle VM) build the [nodeMCU Firmware](https://github.com/nodemcu/nodemcu-firmware). Be sure to set the user_modules.h to turn on LUA_USE_MODULES_ENDUSER_SETUP. 

Copy the bin files from /bin/ folder.

Open NodeMCU-Flasher and select 'QIO' flash mode. While holding down the button we installed on the ESP8266 insert the device into your computer. Use Flash NodeMCU to program the device.

## Putting code on the board

Install [ESPlorer](https://esp8266.ru/esplorer/#download) NOTE Requires JAVA (the page has a link)

