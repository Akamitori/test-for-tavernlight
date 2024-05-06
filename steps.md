***Steps followed***

1. Downloaded forgotten server client
2. Downloaded forgotten server
3. Installed mysql
4. created a `mysql` database(forgottenserver) for the server and a new user(forgotten) for logging in
5. Set up an apache page for step 6.
6. Installed https://github.com/Znote/ZnoteAAC, in order to properly create a user for my local server
7. Built forgotten server client
8. Tried to log in but missed dat and spr files.
9. Added the 1098 dat and spr files to the client directory(https://downloads.ots.me/?dir=data/tibia-clients/dat_and_spr) in data/things for the client
10. Tried to log into the server again.
11. Only version 13.10 supported.
12. Tracked down the server setting in `definitions.h` and changed it to 10.98( the last version to be supported on OT Client).
13. Disabled 2FA in config.lua so I can easily login.
14. Tried to log in again. Apparently some sql queries were failing due to SQL collation. Fixed that.
15. Failed to log in due to faulty credentials, so I added simple cli logs for the 2 probable breakpoints.
16. Tracked down the issue to `iologindata.cpp` in the method `gameworldAuthentication`. Turns out some data was coming in corrupted.
17. Due to data corruption, I decided to hardcode the query data in `iologindata.cpp` to my test user.
18. Tried to log in again but user had `town_id` set to an non existend town so I updated the sql data.
19. Forever stuck in connecting to server(show in screen shot)

