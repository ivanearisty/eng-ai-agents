# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Prefer local oh-my-zsh custom theme if present; otherwise fall back to a safe theme
ZSH_CUSTOM="$ZSH/custom"
if [ ! -f "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme" ] && [ ! -f "$ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k" ]; then
  # powerlevel10k not installed under custom; fallback to default theme to avoid warnings
  ZSH_THEME="robbyrussell"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git zsh-syntax-highlighting)

if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Install ZSH AutoSugg (only if installed)
if [ -f "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [ -n "$HOMEBREW_PREFIX" ] && [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# zsh-syntax-highlighting (installed under oh-my-zsh custom plugins)
if [ -f "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [ -n "$HOMEBREW_PREFIX" ] && [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Initialize brew (if available)
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
fi

tomp4() {
  # Check if at least one argument (input file) is given.
  if [ $# -lt 1 ]; then
    echo "Usage: tomp4 <input-file> [output-file]"
    return 1
  fi

  local input_file="$1"
  # If a second argument is given, use it; otherwise, replace the input extension with .mp4
  local output_file="${2:-${input_file%.*}.mp4}"

  # Check if the input file exists.
  if [ ! -f "$input_file" ]; then
    echo "Input file does not exist: $input_file"
    return 1
  fi

  echo "Converting '$input_file' to '$output_file'..."
  
  # Convert using ffmpeg with libx264 for video and aac for audio.
  ffmpeg -i "$input_file" -c:v libx264 -c:a aac "$output_file"

  if [ $? -eq 0 ]; then
    echo "Conversion complete."
  else
    echo "An error occurred during conversion."
    return 1
  fi
}

# Brew LS
brewls() {
  echo "=== Homebrew Cask Descriptions ==="
  brew ls --casks | xargs brew desc --eval-all

  echo ""
  echo "=== Homebrew Formulae (Leaves) Descriptions ==="
  brew leaves | xargs brew desc --eval-all
}


# pnpm
export PNPM_HOME="/Users/suape/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The next line enables shell command completion for pack (guarded)
if command -v pack >/dev/null 2>&1; then
  . "$(pack completion --shell zsh)" 2>/dev/null || true
fi

# Google Cloud SDK (only if installed under Downloads)
if [ -f "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc" ]; then
  . "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then
  . "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"
fi

if command -v thefuck >/dev/null 2>&1; then
  eval $(thefuck --alias)
fi

# Java Export (only if this macOS Homebrew path exists)
if [ -d "/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home" ]; then
  export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
  export PATH="$JAVA_HOME/bin:$PATH"
fi

# Command
if [ -d "${HOME}/WorkDir/We b0nd" ] || [ -d "${HOME}/Workdir/We B0nd" ]; then
  alias 'inject'='open -a InjectionNext --args -projectPath "${HOME}/Workdir/We B0nd"'
  alias 'cdwbf'='cd "${HOME}/WorkDir/We b0nd"'
fi
alias 'dcd'='docker-compose down -v'
alias 'dcw'='docker-compose up --build -d'
if command -v code2prompt >/dev/null 2>&1; then
  alias 'boom!'='code2prompt . --full-directory-tree -l -e "**/*.log" -e "**/npm-debug.log*" -e "**/yarn-debug.log*" -e "**/yarn-error.log*" -e "**/.idea/**" -e "**/.vscode/**" -e "**/.settings/**" -e "**/.classpath" -e "**/.project" -e "**/*.iml" -e "**/*.iws" -e "**/.DS_Store" -e "**/._*" -e "**/.Spotlight-V100/**" -e "**/.Trashes/**" -e "**/ehthumbs.db" -e "**/Thumbs.db" -e "**/*.tmp" -e "**/*.bak" -e "**/*.swp" -e "**/node_modules/**" -e "**/.next/**" -e "**/.swc/**" -e "**/.cache/**" -e "**/.env" -e "**/.env.local" -e "**/.env.development" -e "**/.env.production" -e "**/target/**" -e "**/build/**" -e "**/.gradle/**" -e "**/hs_err_pid*" -e "**/.mvn/**" -e "**/mvnw" -e "**/mvnw.cmd" -e "**/*.pdf" -e "**/*.jpg" -e "**/*.jpeg" -e "**/*.png" -e "**/*.gif" -e "**/*.svg" -e "**/*.webp" -e "**/pnpm-lock.yaml" -e "**/*.plist" -e "**/*.xcassets/**" -e "**/*.xcodeproj/**" -e "**/*.lock/**" -e "uv.lock"'
fi
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

fpath=(~/.stripe $fpath)
autoload -Uz compinit && compinit -i
