# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```sh
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
stow .
```

`stow .` creates symlinks from `~` into this repo, so changes are tracked automatically.

## Contents

### Neovim (`.config/nvim/`)
Config built on [lazy.nvim](https://github.com/folke/lazy.nvim) with the following plugins:

- **Catppuccin** — colorscheme
- **Lualine** — statusline
- **Telescope** — fuzzy finder
- **Treesitter** — syntax highlighting and indentation
- **Mason** — LSP/linter/formatter installer
- **nvim-cmp** — autocompletion
- **nvim-autopairs** — auto-close brackets
- **nvim-ts-autotag** — auto-close HTML/JSX tags
- **todo-comments** — highlight TODO/FIXME comments

### Zsh (`.zshrc`)
- **Powerlevel10k** — prompt theme
- **zsh-syntax-highlighting** — command highlighting
- **zsh-autosuggestions** — inline suggestions
- **NVM** — Node version manager
- **RVM** — Ruby version manager
- Git aliases (`gs`, `gb`, `gc`, `gl`, `push`, `pull`, `diff`)

### Other
- **1Password** (`.config/1Password/`) — SSH agent config
- **gh** (`.config/gh/`) — GitHub CLI preferences and aliases
- **git** (`.config/git/`) — global gitignore

## Dependencies

Install via [Homebrew](https://brew.sh/):

```sh
brew install stow neovim powerlevel10k zsh-syntax-highlighting zsh-autosuggestions gh
```
