# Neovim Quick Reference

Essential commands and hotkeys for daily use.

## Getting Started

First launch: `nvim` - Auto-installs plugins and language servers
Check setup: `:checkhealth`

## Core Modes

| Mode | Enter | Description |
|------|-------|-------------|
| Normal | `<Esc>` | Navigation and commands |
| Insert | `i` | Type text |
| Visual | `v` | Select text |
| Command | `:` | Run commands |

## Navigation

### Basic Movement
- `h/j/k/l` - Left/down/up/right
- `w/b` - Next/previous word
- `0/$` - Start/end of line
- `gg/G` - Start/end of file
- `{number}G` - Go to line number

### Code Navigation
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `<C-o>/<C-i>` - Jump back/forward
- `*/#` - Search word under cursor
- `f{char}` - Find character in line

## File Management

### Opening Files
- `<leader>sf` - Search files (fuzzy finder)
- `<leader>sg` - Search text in files
- `<leader>?` - Recent files
- `<leader>e` - Toggle file tree

### Buffers
- `<leader>fb` - List open buffers
- `]b/[b` - Next/previous buffer
- `<leader>bd` - Delete buffer
- `<C-6>` - Toggle between last two buffers

## Editing

### Basic Operations
- `dd` - Delete line
- `yy` - Copy line
- `p/P` - Paste after/before cursor
- `u` - Undo
- `<C-r>` - Redo
- `J` - Join lines

### Text Objects
- `ciw` - Change inside word
- `di"` - Delete inside quotes
- `va{` - Select around braces
- `ci(` - Change inside parentheses

### Indentation
- `>>` / `<<` - Indent/outdent line
- `=` - Auto-indent
- `>` / `<` - Indent/outdent selection (visual mode)

## Search and Replace

### Searching
- `/pattern` - Search forward
- `?pattern` - Search backward
- `n/N` - Next/previous match
- `<leader>sw` - Search current word in project

### Replacing
- `:%s/old/new/g` - Replace all in file
- `:'<,'>s/old/new/g` - Replace in selection

## Code Features

### Language Server (LSP)
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>gf` - Format file
- `[d/]d` - Next/previous diagnostic

### Completion
- `<C-n>/<C-p>` - Next/previous completion
- `<C-y>` or `<CR>` - Accept completion
- `<Tab>` - Next snippet placeholder

## Plugin Commands

### Telescope (Search)
- `<leader>sf` - Find files
- `<leader>sg` - Live grep
- `<leader>sb` - Buffers
- `<leader>sh` - Help tags
- `<leader>sk` - Keymaps

### Neo-tree (File Explorer)
- `<leader>e` - Toggle explorer
- In neo-tree:
  - `a` - Add file/folder
  - `d` - Delete
  - `r` - Rename
  - `H` - Toggle hidden files

### Git (Gitsigns)
- `]c/[c` - Next/previous git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk

### Terminal (ToggleTerm)
- `<C-\>` - Toggle floating terminal
- `<leader>tf` - Toggle floating terminal
- `<leader>th` - Toggle horizontal terminal
- `<leader>tv` - Toggle vertical terminal

### GitHub (Octo)
- `<leader>go` - Open Octo interface
- Browse PRs, issues, and repos from within Neovim

### REST Client
- `<leader>rr` - Run REST request
- `<leader>rl` - Run last REST request

### Database (Dadbod)
- `<leader>db` - Toggle Database UI
- `<leader>df` - Find Database Buffer
- `<leader>dr` - Rename Database Buffer

### Code Outline
- `<leader>o` - Toggle code outline

### Diagnostics (Trouble)
- `<leader>xx` - Toggle Trouble
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `<leader>xl` - Location list
- `<leader>xq` - Quickfix
- `gR` - LSP references

### Sessions (Persistence)
- `<leader>qs` - Restore session
- `<leader>ql` - Restore last session
- `<leader>qd` - Don't save current session

### Multiple Cursors
- `<C-d>` - Add cursor at next occurrence
- `<C-Down>` - Create cursor below
- `<C-Up>` - Create cursor above

### Commenting
- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment motion (e.g., `gcip` comment paragraph)
- `gcO` - Comment line above
- `gco` - Comment line below
- `gcA` - Comment at end of line

### Surround
- `sa` - Add surround (e.g., `saiw"` surround word with quotes)
- `sd` - Delete surround
- `sr` - Replace surround
- `sf` - Find surround

## Window Management

- `<C-w>s` - Split horizontal
- `<C-w>v` - Split vertical
- `<C-w>h/j/k/l` - Navigate windows
- `<C-w>q` - Close window
- `<C-w>=` - Equalize windows

## Essential Commands

### Plugin Management
- `:Lazy` - Plugin manager
- `:Mason` - Language server manager

### Diagnostics
- `:checkhealth` - System health check
- `:LspInfo` - LSP status
- `:messages` - Recent messages

### Help
- `:help {topic}` - Built-in help
- `<leader>sk` - Search keymaps
- `<leader>sh` - Search help

## Quick Workflows

### Opening a Project
```bash
cd project-directory
nvim .
```

### Basic Editing Flow
1. `<leader>sf` - Find file
2. `i` - Enter insert mode
3. Edit text
4. `<Esc>` - Return to normal mode
5. `:w` - Save file

### Code Navigation
1. `<leader>sg` - Search for function/symbol
2. `gd` - Go to definition
3. `K` - Read documentation
4. `<C-o>` - Jump back

### Git Workflow
1. Make changes
2. `]c` - Jump to next change
3. `<leader>hp` - Preview change
4. `<leader>hs` - Stage change

## Troubleshooting

### Common Issues
- LSP not working: `:LspInfo` then `:Mason` to install servers
- Slow startup: `:Lazy profile` to check plugin load times
- Completion issues: `:CmpStatus` to check sources

### Reset
```bash
# Clear cache
rm -rf ~/.cache/nvim

# Reset plugins
rm -rf ~/.local/share/nvim/lazy
nvim  # Will reinstall
```

## Key Reminders

- `<leader>` = `<Space>` 
- Press `<Space>` and wait to see available commands
- Use visual mode for operations on selections
- `:q` to quit, `:w` to save, `:wq` to save and quit
- `<C-c>` alternative to `<Esc>`