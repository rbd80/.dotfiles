# Zsh configurations

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Use z
. /usr/local/etc/profile.d/z.sh

# Use thefuck
eval $(thefuck --alias)

# Use antigen to manage Zsh plugins
source /usr/local/share/antigen/antigen.zsh

# Load Oh My Zsh
antigen use oh-my-zsh

# Oh My Zsh plugins - https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins

# Load plugins for macOS
antigen bundle command-not-found
antigen bundle gitfast
antigen bundle osx
antigen bundle sudo
antigen bundle brew

# Load plugins for vendors
antigen bundle aws
antigen bundle docker
antigen bundle web-search


# Load plugins for JavaScript and Node.js
antigen bundle node
antigen bundle npm
antigen bundle yarn

# Load plugins for Other tools
antigen bundle sublime

# Load other plugins
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load theme
# antigen theme geometry-zsh/geometry # comment when running source ~/.zshrc to avoid hanging

# Apply changes
antigen apply

# Load theme
ZSH_THEME=geometry

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh
