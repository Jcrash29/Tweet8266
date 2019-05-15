If a new firmware build is to be used in the future here are some notes:

1. Make sure the [Pull Request End User Setup](https://github.com/nodemcu/nodemcu-firmware/pull/2493) is within the branch.
1. Make sure the following items are included in the app/include/user_modules.h: ENDUSER_SETUP, RTCTIME, SNTP.
