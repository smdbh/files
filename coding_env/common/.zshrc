# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="muse"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
 DISABLE_AUTO_UPDATE="true"

# Uncomment the following linlse to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
plugins=(git z zsh-syntax-highlighting   sudo zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias sbb='sudo $(fc -ln -1)'

# 
# zstyle ':completion:*' completer _expand_alias _complete _ignored

bindkey -M emacs '^[j' history-substring-search-up
bindkey -M emacs '^[k' history-substring-search-down
bindkey -M emacs "^e" _expand_alias

alias tmll="tmux ls"
alias tmat='_a(){tmux ls ; echo "input id:"; read  id; tmux attach -t $id;}; _a'
alias ll="ls -alh"
alias rm="rm -i"
alias h="cd ~"
alias lsdu="du -hl -d 1 && dff"
alias dff="df -h | grep sd "
alias cbuild="cmake -B _build && make -C _build"

alias vncc="vncserver  -geometry 1440x900"
alias wsactive="source devel/setup.zsh"

ubuntu_version=$(lsb_release -rs)

# git
alias gitnossl='export GIT_SSL_NO_VERIFY=1'

if [[ $ubuntu_version == "18.04" ]]; then
	alias gitl='git log --all --graph --pretty=tformat:"%C(auto)%h %ci  %d%s"'
else
    alias gitl='git log --all --graph --pretty=tformat:"%C(auto)%h%x09%cs  %d%s"'
fi

alias gits='git status' 
alias gitco='git checkout' 
alias gitcm='git commit ' 
alias gitpr='git pull --rebase ' 


# alias ip6="ip -o -6 addr show | awk -F ' ' '{printf \"%-20s: %s\n\", $2, $4}'"
alias ip6="ip -o -6 addr show | awk -F ' ' '{printf \"%-20s: %s\\n\", \$2, \$4}'"

# fzf
# export FZF_COMPLETION_TRIGGER="?"
export FZF_DEFAULT_COMMAND="find -type f -name \"*\""
cdf() {
	# goto target directory
	cd "$(dirname $(realpath $(fzf))  )"
}


# search notes
hint(){
	#vim +/$1  ~/myconfig/notes.md
	ag -A3 -B5  $1 ~/myconfig/notes.md
}

hintv(){
	vim +/$1  ~/myconfig/notes.md
}

# cmake
cmk(){
	cmake -B build && cmake --build build && ./build/$1
}

# config git proxy
enable_mygit_proxy () {
    # !0 for enable
    
    if [ "$1" != "" ]; then 
        git config --global http.proxy http://127.0.0.1:8889 
        echo  'enable git proxy.'
    else
        git config --global --unset http.proxy
        echo  'disable git proxy'
    fi
}


PROMPT=$'%{$PROMPT_SUCCESS_COLOR%}%]%? %{$fg[white]%}%n@%m %{$fg[cyan]%} %/$(git_prompt_info)\r\n\%#%{$reset_color%} '

# ros settings.
if [ 0 = 1 ]; then

	# mount |grep workspace > /dev/null
	# if [ $? -ne 0 ]; then
		# sudo mount -t virtiofs workspace /home/ronnie/workspaces
	# fi
	_file=/opt/ros/melodic/setup.zsh
	if [ -f $_file ]; then
		source $_file
	fi
	
fi 

# PATH=/usr/local/cuda-11.7/bin:$PATH
# export CROSS_COMPILE=arc-elf32-

# system en, not enable others
export LANG="en_US.UTF-8"
# export LANG="zh_CN.UTF-8"
# export LC_ALL="zh_CN.UTF-8"

