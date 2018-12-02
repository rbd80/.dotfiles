#!/bin/bash
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function display {
	echo -e "\n$1\n"
}

function createDirectories {
	display '📂  Creating directories'
	sudo sh .scripts/dir.sh
}

function installApplications {
	display '🎱  Installing applications'
	sudo sh .scripts/install.sh
}

function configApps {
	display '📦  Making a few Tweaking globally'
	sudo sh .scripts/AppConfigs.sh
	sudo sh .scripts/osxprep.sh
}

function installCustom {
	display '🤔  Installing custom applications'
	sudo .scripts/install-apps.sh
}

function macOSPreferences {
	display '🔧  Tweaking macOS preferences'
	sudo sh .scripts/macos.sh
}

function loginItems {
	display '✨  Configure login items'
	sudo sh .scripts/login-items.sh
}

function stowFiles {
	display '🗄  Stowing your .files to $HOME'
	ls -d */ | xargs stow -vv
}

function applyGitIgnore {
	display '🙅  Applying ~/.gitignore globally'
	git config core.excludesfile ~/.gitignore
}

function generateSSHKey {
	display '🔑  Generating ssh key'
	sudo sh .scripts/ssh.sh
}

function scheduleCron {
	display '📅  Scheduling crontab tasks'
	crontab .scripts/cron.txt
}

function restartComputer {
	display '🖥  All done! You may need to restart your computer'
	sudo sh .scripts/restart.sh
}

function runAll {
	createDirectories
	installApplications
	installCustom
	macOSPreferences
    	configApps
	loginItems
	stowFiles
	applyGitIgnore
	generateSSHKey
	scheduleCron
	restartComputer
}

cat banner

case $1 in
	stow )
		stowFiles
		;;
	all )
		runAll
		;;
	* )
		echo -e "usage: bootstrap all	- run all commands"
		echo -e "usage: bootstrap stow	- just run the stow command"
		;;
esac
