# Capture

### Bukalapak sample capture script using Capybara, Selenium, and Percy library


#### Dependency Installation

First you have to install all of this library to your local environment. Source from [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#debian--ubuntu).

##### Ubuntu
```
sudo apt-get update
sudo apt-get install qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
```

##### Mac using Homebrew
```
brew update
brew install qt
```

##### Mac using Macports
```
sudo port install qt5-mac
```

#### Install Chromedriver
This repository use chromedriver as a sample selenium driver. You could install these using [this](https://christopher.su/2015/selenium-chromedriver-ubuntu/) tutorial. Tutorial provided are using Ubuntu. You could find a similar tutorial of installing chromedriver on Mac in [here](http://www.kenst.com/2015/03/installing-chromedriver-on-mac-osx/). Sorry for the inconvenience :( 


#### Running
And then run this command on project root to install project dependencies
```
bundle
```

You could use this command to run sample scenario
```
bundle exec rspec
```