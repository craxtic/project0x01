No beautiful/cool ui design is needeed, just make the application works first.

## Tasks #1
- [x] setup project. data, domain, presentation directory. an extra 'core' for utils, configs, etc.
- [x] read/write from/to local storage, use SharedPreferences.
- [x] implement function for settings system, hasSeenWelcome(), seenWelcome(), 
set and get functions for theme, fontsize and language. 
- [x] create a Dictionary to store words in both khmer and english language, implement a proper structure
- [ ] create a theme extension for custom colors to design the ui. 
- [ ] prepare a color palette for the app, simple first, no fancy is needed.



## Tasks #2, welcome page
- [x] create a welcome page, three buttons. two for toggling theme and language, another one is for 'continue' button.
- [x] the theme and language button should trigger the app to rebuild, in order to make changes instantly. (loading new theme or language instantly)
- [x] continue button will display a second page, next Task.
there should title

## Task #3, favorite topics page
this page is shown after the 'continue' is clicked.
- [x] the theme and language buttons still remains the same.
- [x] create a list of selectable topics (buttons maybe).
- [x] any selected topics, will be written to the config file.
- [x] create two buttons,'back' (takes to the welcome page) and 'get started' (takes to the main app).  

## Task #4, 
- [x] handle first run, the welcome and favorite topics page will only be 
shown once for new users. use the config to track this. 
- [x] automatically initialize default settings. use system thememode, and khmer langauge as default.

  
## Task #5
- [x] fix: the thememode toggle button does not work on the first click
- [ ] add custom font family, style and size (next time)
- [x] refactor the code, make changes 

     
## Task #6
- [x] switch from SharedPreferences to Hive (a better one)



## tasks #6
- [x] get system theme mode and use it as default thememode, must set directly to light or dark 
