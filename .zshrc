# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export NIX_PATH=~/nixos-configs/configuration.nix
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
fz() {
     cd "$(find /home/baby/workflow -type d -not -path "*/node_modules/*" -not -path "*/.git/*" | fzf)"
}
bindkey  -s '^f' 'echo tejas'
bindkey -s -- '^t' '/home/tejes/sessionnizer.sh'
export FZF_DEFAULT_OPTS="
        --color=border:#44415a,header:#3e8fb0,gutter:#232136
        --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
        --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
# source $ZSH/oh-my-zsh.sh
# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# On-demand rehash
zshcache_time="$(date +%s%N)"
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8
autoload -Uz add-zsh-hook
rehash_precmd() {
    if [[ -a /var/cache/zsh/pacman ]]; then
        local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
        if (( zshcache_time < paccache_time )); then
            rehash
            zshcache_time="$paccache_time"
        fi
    fi
}
add-zsh-hook -Uz precmd rehash_precmd
#neovide alias
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
# alias c ="cd $(find * -type d | fzf)"
alias nvi='WINIT_UNIX_BACKEND=x11 neovide --multigrid'
alias x='tmux'
alias tx='tmuxifier'
alias hinata='nvim'
# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias tt="tt -showwpm -notheme -bold"
#npm 
alias  nr='npm run dev'
alias  ni='npm i'
nid() {
    npm install "$1" --save-dev
}
# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'
# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add '
alias gc='git commit -m'
alias gch="git checkout "
alias gp='git push origin master'
alias obsi='./Obsidian-1.3.4.AppImage'
alias mydocker='docker build -t mydocker . && docker run --cap-add="SYS_ADMIN" mydocker'
#pywagh
# Alternative (blocks terminal for 0-3ms)
# To add support for TTYs this line can be optionally added.
#end
export PATH=$PATH:/home/tejes/.spicetify
# fm6000 -f ~/animi_asci/naruto.txt -c red   &&
# neofetch
# ./text.sh
#
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
cd
eval "$(starship init zsh)"
eval "$(tmuxifier init -)"
# bun completions
[ -s "/home/tejes/.bun/_bun" ] && source "/home/tejes/.bun/_bun"
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:/home/baby/.spicetify

export ghp_PjcjTjxQCo4vH3Q3Ed9mX7sc31Qbp33dwj

preexec() {
    echo -ne '\e[5 q'  # Change to blinking bar while command is running
}

precmd() {
    echo -ne '\e[1 q'  # Change back to block when command completes
}
new_note() {
    local notes_dir="/home/baby/obsi-vault/quicky/"
    
    # Prompt for title
    echo -n "Enter note title: "
    read title
    
    if [[ -n "$title" ]]; then
        # Convert spaces to underscores using tr and make lowercase
        local filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
        
        # Add timestamp and extension
        local filepath="$notes_dir/$(date +%Y-%m-%d)_${filename}.md"
        
        # Create directory if it doesn't exist
        mkdir -p "$notes_dir"
        
        # Create file with YAML frontmatter
        cat > "$filepath" << EOL
---
title: $title
date: $(date +"%Y-%m-%d %H:%M:%S")
---

EOL
        
        # Open in editor
        $EDITOR "$filepath"
    else
        echo "No title provided"
    fi
}



search_notes() {
    local notes_dir="/home/baby/obsi-vault/"  # Change this to your notes directory
    local selected_file=$(fd . "$notes_dir" | fzf --preview 'bat --style=numbers --color=always {}')
    
    if [[ -n $selected_file ]]; then
        $EDITOR "$selected_file"
    fi
}



# search_tags() {
#  local notes_dir="/home/baby/obsi-vault"
#    local raw_tags=$(rg -U "tags:.*\n.*- .*" "$notes_dir")
#    echo "$raw_tags"  # Debug line
#    
#    local selected_tag=$(echo "$raw_tags" | \
#        grep "^.*- " | \
#        sed 's/.*- //' | \
#        sort -u | \
#        fzf --prompt="Select tag: ")
#    
#    if [[ -n "$selected_tag" ]]; then
#        local selected_file=$(rg -U -l "tags:.*\n.*- ${selected_tag}" "$notes_dir" | \
#            fzf --preview 'bat --style=numbers --color=always {}')
#        
#        [[ -n "$selected_file" ]] && $EDITOR "$selected_file"
#    fi}


# alias st='search_tags'
alias te='search_notes'
alias nn='new_note'
s() {
    echo $PWD
    echo "-------------"
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo "$(git branch --show-current)"
    fi
}


