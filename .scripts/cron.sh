#!/usr/bin/env bash

echo "`date`: RUNNING: brew update"
/usr/local/bin/brew update
echo "`date`: FINISHED: brew update"

echo ""

echo "`date`: RUNNING: brew upgrade"
/usr/local/bin/brew upgrade
echo "`date`: FINISHED: brew upgrade"

echo ""

echo "`date`: RUNNING: brew cleanup"
/usr/local/bin/brew cleanup -s
echo "`date`: FINISHED: brew cleanup"

echo ""

echo "`date`: RUNNING: cask cleanup"
/usr/local/bin/brew cask cleanup
echo "`date`: FINISHED: cask cleanup"

echo ""

echo "`date`: RUNNING: doctor"
/usr/local/bin/brew doctor
echo "`date`: FINISHED: doctor"

echo ""

echo "`date`: RUNNING: missing"
/usr/local/bin/brew missing
echo "`date`: FINISHED: missing"

echo ""
# https://github.com/julienXX/terminal-notifier
echo 'All Brewed up! Enjoy a cold one! 🍺 ' | terminal-notifier
echo ""