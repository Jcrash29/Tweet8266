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

For the ESP8266 to Serial Board we are using it requires a cheap chinese knockoff driver CH341/CH340, drivers for multiple platforms can be found [here](http://0xcf.com/2015/03/13/chinese-arduinos-with-ch340-ch341-serial-usb-chip-on-os-x-yosemite/) (I do not know or particulalry trust the distributer of these drivers. Continue at own risk).

[Python 2.7.9 or later](https://www.python.org/)

## Connecting to the board

Thanks to [Bradon for showing the proper way to connect the ESP8266](https://www.amazon.com/gp/customer-reviews/R16RKWR68SXN9W/ref=cm_cr_dp_d_rvw_ttl?ie=UTF8&ASIN=B01J2UXXCA)

