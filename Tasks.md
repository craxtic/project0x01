No beautiful/cool ui design is needeed, just make the application works first.

## Tasks #1
- [ ] setup project. data, domain, presentation directory. an extra 'core' for utils, configs, etc.
- [ ] read/write from/to local storage, use SharedPreferences.
- [ ] implement function for settings system, hasSeenWelcome(), seenWelcome(), 
set and get functions for theme, fontsize and language. 
- [ ] create a Dictionary to store words in both khmer and english language, implement a proper structure
- [ ] create a theme extension for custom colors to design the ui.


## Tasks #2, welcome page
- [ ] create a welcome page, three buttons. two for toggling theme and language, another one is for 'continue' button.
- [ ] the theme and language button should trigger the app to rebuild, in order to make changes instantly.
- [ ] continue button will display a second page, next Task.

## Task #3, favorite topics page
this page is shown after the 'continue' is clicked.
- [ ] the theme and language buttons still remains the same.
- [ ] create a list of selectable topics (buttons maybe).
- [ ] any selected topics, will be written to the config file.
- [ ] create two buttons,'back' (takes to the welcome page) and 'get started' (takes to the main app).

## Task #4, 
- [ ] handle first run, the welcome and favorite topics page will only be 
shown once for new users. use the config to track this. 
- [ ] automatically initialize default settings. use system thememode, and khmer langauge as default.

  
# New tasks will be issued later.