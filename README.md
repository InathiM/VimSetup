# VimSetup

A modern, well-organized Vim configuration with sensible defaults, powerful plugins, and productivity-focused key mappings.

## Features

- **Plugin Management**: Uses [vim-plug](https://github.com/junegunn/vim-plug) for easy plugin management
- **File Navigation**: NERDTree file explorer and FZF fuzzy finder
- **Git Integration**: vim-fugitive and GitGutter for seamless Git workflow
- **Code Editing**: Auto-pairs, surround, commentary, and more
- **Syntax Highlighting**: vim-polyglot for extensive language support
- **Linting**: ALE (Asynchronous Lint Engine) for real-time linting
- **Beautiful UI**: Gruvbox, Dracula, and OneDark color schemes with Airline status line
- **Productivity**: Persistent undo, tmux integration, and intuitive key mappings

## Quick Installation

### One-liner Install

```bash
curl -fLo ~/.vimrc https://raw.githubusercontent.com/InathiM/VimSetup/main/.vimrc && vim +PlugInstall +qall
```

### Manual Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/InathiM/VimSetup.git
   ```

2. **Copy the configuration:**
   ```bash
   cp VimSetup/.vimrc ~/.vimrc
   ```

3. **Install plugins:**
   Open Vim and run:
   ```vim
   :PlugInstall
   ```

## Key Mappings

The leader key is set to `<Space>`.

### General

| Key | Action |
|-----|--------|
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>x` | Save and quit |
| `<Space>Q` | Quit all without saving |
| `<Space>/` | Clear search highlight |
| `jk` or `kj` | Exit insert mode |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Navigate between splits |
| `Ctrl+Arrow` | Resize splits |
| `Tab` | Next buffer |
| `Shift+Tab` | Previous buffer |
| `<Space>bd` | Delete buffer |

### File Explorer (NERDTree)

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle NERDTree |
| `<Space>nf` | Find current file in NERDTree |

### Fuzzy Finder (FZF)

| Key | Action |
|-----|--------|
| `Ctrl+p` | Find files |
| `<Space>ff` | Find files |
| `<Space>fg` | Find git files |
| `<Space>fb` | Find buffers |
| `<Space>fr` | Ripgrep search |
| `<Space>fh` | File history |

### Git

| Key | Action |
|-----|--------|
| `<Space>gs` | Git status |
| `<Space>gd` | Git diff split |
| `<Space>gc` | Git commit |
| `<Space>gp` | Git push |
| `<Space>gb` | Git blame |
| `]h` / `[h` | Next/previous git hunk |
| `<Space>hp` | Preview hunk |
| `<Space>hs` | Stage hunk |
| `<Space>hu` | Undo hunk |

### Linting (ALE)

| Key | Action |
|-----|--------|
| `]e` / `[e` | Next/previous error |
| `<Space>af` | Auto-fix |

### Code Editing

| Key | Action |
|-----|--------|
| `Alt+j/k` | Move line up/down |
| `<` / `>` (visual) | Indent and stay in visual mode |
| `Y` | Yank to end of line |
| `<Space>d` | Delete without copying |
| `<Space>p` | Paste without losing register |

### Misc

| Key | Action |
|-----|--------|
| `<Space>u` | Toggle undo tree |
| `<Space>ve` | Edit vimrc |
| `<Space>vs` | Source vimrc |

## Included Plugins

### File Navigation
- **[NERDTree](https://github.com/preservim/nerdtree)** - File system explorer
- **[fzf.vim](https://github.com/junegunn/fzf.vim)** - Fuzzy file finder

### Git Integration
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** - Git wrapper
- **[vim-gitgutter](https://github.com/airblade/vim-gitgutter)** - Git diff in gutter

### Code Editing
- **[vim-surround](https://github.com/tpope/vim-surround)** - Surround text objects
- **[vim-commentary](https://github.com/tpope/vim-commentary)** - Easy commenting (`gcc`)
- **[auto-pairs](https://github.com/jiangmiao/auto-pairs)** - Auto-close brackets
- **[vim-repeat](https://github.com/tpope/vim-repeat)** - Repeat plugin commands

### Syntax & Linting
- **[vim-polyglot](https://github.com/sheerun/vim-polyglot)** - Language pack
- **[ALE](https://github.com/dense-analysis/ale)** - Asynchronous linting

### UI
- **[vim-airline](https://github.com/vim-airline/vim-airline)** - Status line
- **[gruvbox](https://github.com/morhetz/gruvbox)** - Color scheme
- **[dracula](https://github.com/dracula/vim)** - Color scheme
- **[onedark](https://github.com/joshdick/onedark.vim)** - Color scheme
- **[undotree](https://github.com/mbbill/undotree)** - Undo history visualizer

### Integration
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless tmux navigation

## Customization

### Changing Color Scheme

Edit `.vimrc` and modify the colorscheme section:

```vim
" Uncomment your preferred color scheme
silent! colorscheme gruvbox
" silent! colorscheme dracula
" silent! colorscheme onedark
```

### Adding New Plugins

Add plugins between `call plug#begin()` and `call plug#end()`:

```vim
Plug 'author/plugin-name'
```

Then run `:PlugInstall` in Vim.

### File-type Specific Settings

The configuration includes sensible defaults for common file types:
- **Web files** (HTML, CSS, JS, TS): 2-space indentation
- **Python**: 4-space indentation, 88-char column guide
- **Go**: Tab indentation
- **Markdown**: Word wrap and spell check enabled

## Requirements

- Vim 8.0+ (with `+clipboard` for system clipboard support)
- [curl](https://curl.se/) (for auto-installing vim-plug)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (optional, for `:Rg` command)
- [fzf](https://github.com/junegunn/fzf) (installed automatically by vim-plug)
- A [Nerd Font](https://www.nerdfonts.com/) (optional, for better icons)

## Updating Plugins

Run in Vim:
```vim
:PlugUpdate
```

To upgrade vim-plug itself:
```vim
:PlugUpgrade
```

## Uninstall

Remove the configuration:
```bash
rm ~/.vimrc
rm -rf ~/.vim/plugged
rm -rf ~/.vim/undodir
```

## License

MIT License - Feel free to use and modify as you wish.
