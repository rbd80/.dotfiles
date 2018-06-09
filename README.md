# Setup for the *Mac*
Need to add more automation for my laptop and reorganized the config files.  Added more documentation to 
what is installed and better package management for zsh. 

## Clone and execute

```shell
git clone https://github.com/rbd80/.dotfiles.git ~/.dotfiles
```

## Goto the directory:
```shell
cd ~/.dotfiles
```

## Run the bootstrap.sh
```shell
./bootstrap.sh
```

## Generate a Brewfile
A Brewfile lists all your Homebrew dependencies. To generate a Brewfile, just run:
```shell
brew bundle dump
```

###appreciation
Major changes inspired from [jjstrn](https://github.com/jsstrn/dotfiles)
Ref.

https://gist.github.com/derhuerst/12a1558a4b408b3b2b6e
https://github.com/robbyrussell/oh-my-zsh
https://github.com/bhilburn/powerlevel9k
http://sourabhbajaj.com/mac-setup/
https://github.com/donnemartin/dev-setup/blob/master/bootstrap.sh