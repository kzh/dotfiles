# Neovim - Ultimate Productivity Guide

## Motion Mastery
```
w/W b/B e/E              word forward/back/end (W/B/E: WORD boundaries)
f{char} F{char}          find char forward/back (;/, repeat/reverse)
t{char} T{char}          till char forward/back
0 ^ $ g_                 line start/first-non-blank/end/last-non-blank
{ } ( )                  paragraph/sentence navigation
% ]]  [[  ][  []         match bracket/next-prev function/section
gd gD gf gF              goto def/global-def/file/file:line
gi gv g;                 last insert/visual/edit location
`. `` `^                 last change/position/insert
'' '. '^                 mark versions
H M L                    screen top/middle/bottom
zt zz zb                 current line to top/center/bottom
<C-e> <C-y>              scroll line up/down
<C-d> <C-u>              half page down/up
<C-f> <C-b>              full page forward/back
<C-o> <C-i>              jumplist back/forward
```

## Text Objects (i=inner a=around)
```
iw aw iW aW              word/WORD
is as ip ap              sentence/paragraph
i' a' i" a" i` a`        quotes
i( a( i) a) ib ab        parentheses/block
i{ a{ i} a} iB aB        braces/Block
i[ a] i< a> it at        brackets/angle/tag
```

## Operators + Motions = Power
```
d{motion} c{motion} y{motion} v{motion}     delete/change/yank/visual
>{motion} <{motion} ={motion} gU{motion}    indent/outdent/format/uppercase
gu{motion} g~{motion} !{motion}             lowercase/togglecase/filter

Examples:
ci"      change inside quotes       gUiw     uppercase word
da{      delete around braces       >ip      indent paragraph
yit      yank inside tag           =G       format to end
ct,      change till comma         d/foo    delete to foo
```

## LSP Power Features (Space as leader)
```
gd       go to definition           K        hover docs
gr       references                 gI       implementation
<leader>rn  rename with preview     <leader>ca  code actions
<leader>D   type definition         gl       show diagnostics
[d ]d    prev/next diagnostic       <leader>q   diagnostic list

<leader>sf  find files              <leader>sg  live grep
<leader>sw  search current word     <leader>s/  grep open files
<leader><leader>  switch buffer     <leader>sh  help tags
```

## Daily Workflows

### Morning Project Start
```vim
" 1. Open project
cd ~/projects/myapp
nvim .

" 2. Restore session (if exists)
<leader>qs              " or :source Session.vim

" 3. Quick overview
<leader>e               " file tree
<leader>sg TODO         " find all TODOs
<leader>xx              " show diagnostics
```

### Code Navigation Pattern
```vim
" 1. Find file
<leader>sf              " fuzzy file search
package.json<CR>        " open file

" 2. Explore codebase
<leader>sg function     " search for function
<leader>ss              " search symbols
gd                      " go to definition
<C-o>                   " jump back

" 3. Quick edits
ci"                     " change inside quotes
.                       " repeat change
<leader>rn              " rename symbol
```

### Refactoring Workflow
```vim
" 1. Find all usages
gr                      " list references

" 2. Rename across project
<leader>rn              " inc-rename with preview

" 3. Extract variable (visual mode)
vawy                    " yank assignment
Oconst <C-r>" = <Esc>   " paste as const

" 4. Run code action
<leader>ca              " show available actions
```

### Git Integration
```vim
" Review changes
]c                      " next change
[c                      " previous change
<leader>hp              " preview hunk

" Stage changes
<leader>hs              " stage hunk
<leader>hS              " stage buffer

" Browse history
:Telescope git_commits  " commit browser
:Telescope git_status   " status with preview
```

### Debugging Session
```vim
" Set breakpoints
<leader>b               " toggle breakpoint
<leader>B               " conditional breakpoint

" Run debugger
<F5>                    " start/continue
<F10>                   " step over
<F11>                   " step into
<F12>                   " step out

" Inspect
<leader>dr              " repl
<leader>dh              " hover variable
<leader>dp              " preview variable
```

## Productivity Patterns

### Multi-file Edit
```vim
" Load files
:args **/*.tsx          " all TSX files
:args `fd -e js -e ts`  " or use fd

" Batch operations
:argdo %s/old/new/g     " replace in all
:argdo normal @a        " run macro
:bufdo w                " save all

" Review changes
:Git diff               " see all changes
:cdo update            " save quickfix files
```

### Quick Editing Tricks
```vim
" Line operations
yypVr=                  " duplicate and underline
ddp                     " swap lines
xp                      " swap characters

" Smart selection
viB                     " select inside {}
va(                     " select around ()
vit                     " select inside tags

" Multiple cursors
<C-n>                   " select word + next
c                       " change all
<Esc>                   " apply changes
```

### Search & Replace Mastery
```vim
" Project-wide replace
:Telescope live_grep    " search pattern
<C-q>                   " send to quickfix
:cdo %s//replacement/g  " replace in all

" Visual mode replace
:'<,'>s/\%Vold/new/g    " only in selection

" Complex patterns
/\v(foo|bar)            " very magic mode
:%s//baz/g              " reuse last search
```

### Window Management
```vim
" Quick splits
<C-w>v                  " vertical split
<C-w>s                  " horizontal split
<C-w>o                  " only this window

" Navigation
<C-h/j/k/l>            " seamless with tmux
<C-w>w                 " cycle windows
<C-w>r                 " rotate windows

" Resize
<C-w>=                 " equalize
<C-w>|                 " maximize width
<C-w>_                 " maximize height
```

## Power User Tips

### Registers & Macros
```vim
" System clipboard
"+y                     " yank to clipboard
"+p                     " paste from clipboard

" Macro editing
qa                      " record to a
q                       " stop recording
:let @a='...'          " edit macro
@a                      " play macro
10@a                    " play 10 times

" Special registers
"0p                     " paste last yank
".p                     " paste last edit
":p                     " paste last command
```

### Marks & Jumps
```vim
" Local marks
ma                      " set mark a
'a                      " jump to line
`a                      " jump to position

" Global marks (A-Z)
mA                      " set across files
'A                      " jump to file+line

" Special marks
''                      " previous position
'.                      " last change
'^                      " last insert
```

### Completion Mastery
```vim
<C-n>                   " next completion
<C-p>                   " previous
<C-y>                   " accept
<C-e>                   " cancel
<C-Space>               " trigger manually

" Context aware
<C-x><C-o>             " omni completion
<C-x><C-f>             " file paths
<C-x><C-l>             " whole lines
<C-x><C-]>             " tags
```

### Terminal Integration
```vim
<C-\>                   " floating terminal
:term                   " split terminal
:term://htop           " run command

" In terminal
<C-\><C-n>             " normal mode
exit                    " close terminal

" Send commands
:TermExec cmd='npm test'
```

## Custom Commands & Functions
```vim
" Add to init.lua or config
:command! CDC cd %:p:h  " cd to current file
:command! Prettier !prettier --write %
:command! JsonFormat %!jq .

" Quick macros
:nnoremap <leader>d o<Esc>k$a,<Esc>j$a<Esc>  " duplicate line with comma
```

## Performance Optimization
```vim
" Lazy loading indicators
Lazy profile            " plugin load times
:syntime on            " syntax timing
:syntime report        " show results

" Large file handling
:set syntax=off        " disable syntax
:set ft=              " clear filetype
:NoMatchParen         " disable paren matching
```

## Emergency Recovery
```vim
" Recover from swap
:recover               " recover file
:DiffOrig             " compare with saved

" Time travel
:earlier 10m          " go back 10 minutes
:later 5m             " go forward
u1 | u2               " undo tree branches

" Reset
:set all&             " reset all options
:mapclear             " clear mappings
:Lazy restore         " restore plugins
```

## Plugin Ecosystem

### Core Infrastructure

**lazy.nvim - Plugin Manager**
```vim
:Lazy               # Open plugin manager
:Lazy sync          # Update all plugins
:Lazy profile       # Performance profiling
:Lazy restore       # Restore to lock file

# Lazy loading triggers:
cmd = "Command"     # Load on command
event = "BufRead"   # Load on event
ft = "python"       # Load on filetype
keys = "<leader>f"  # Load on keymap
```

**nvim-treesitter - Syntax & More**
```vim
:TSInstall <lang>   # Install parser
:TSUpdate           # Update parsers
:TSInstallInfo      # Show installed

# Provides:
- Syntax highlighting
- Indentation
- Folding
- Text objects (function, class)
- Incremental selection
```

**Mason - Tool Management**
```vim
:Mason              # Open UI
:MasonInstall <tool> # Install LSP/DAP/linter
:MasonUpdate        # Update tools
:MasonUninstall     # Remove tool

# Auto-installs:
- Language servers
- Debuggers
- Linters
- Formatters
```

### LSP & Completion

**nvim-lspconfig**
```vim
:LspInfo            # Current LSP status
:LspRestart         # Restart servers
:LspLog             # View logs

# Configured servers:
lua_ls, ts_ls, pyright, gopls, rust_analyzer,
html, cssls, jsonls, yamlls, bashls, marksman
```

**nvim-cmp - Completion Engine**
```vim
<C-n/p>             # Navigate items
<C-y>               # Accept
<C-e>               # Cancel
<C-Space>           # Trigger
<C-d/u>             # Scroll docs

# Sources:
1. LSP (language server)
2. LuaSnip (snippets)
3. Path (file paths)
4. Buffer (current file)
5. Calc (math)
6. Emoji
```

**LuaSnip - Snippet Engine**
```vim
<Tab>               # Expand/jump forward
<S-Tab>             # Jump backward
<C-l>               # Choose option

# Supports:
- VSCode snippets
- SnipMate format
- Custom Lua snippets
```

### File & Search

**telescope.nvim - Fuzzy Finder**
```vim
<leader>sf          # Files
<leader>sg          # Live grep
<leader>sb          # Buffers
<leader>sh          # Help tags
<leader>sk          # Keymaps
<leader>sr          # Resume last
<leader>s/          # Search open files
<leader>sw          # Search word
<leader>sn          # Neovim files

# In Telescope:
<C-x/v/t>          # Open split/vsplit/tab
<C-q>              # Send to quickfix
<Tab>              # Toggle selection
<C-u/d>            # Preview scroll
```

**neo-tree.nvim - File Explorer**
```vim
<leader>e           # Toggle tree

# In neo-tree:
a                   # Add file/folder
d                   # Delete
r                   # Rename
c/p                 # Copy/paste
m                   # Move
H                   # Toggle hidden
/                   # Filter
<                   # Navigate up
>                   # Navigate in
```

### Git Integration

**gitsigns.nvim - Git Decorations**
```vim
]c [c               # Navigate hunks
<leader>hs          # Stage hunk
<leader>hr          # Reset hunk
<leader>hS          # Stage buffer
<leader>hu          # Undo stage
<leader>hp          # Preview hunk
<leader>hb          # Blame line
<leader>tb          # Toggle blame
<leader>hd          # Diff this
<leader>hD          # Diff ~
```

**octo.nvim - GitHub Integration**
```vim
:Octo pr list       # List PRs
:Octo pr create     # Create PR
:Octo issue list    # List issues
:Octo issue create  # Create issue
:Octo repo view     # View repo
```

**git-worktree.nvim**
```vim
<leader>gw          # Switch worktree
<leader>gc          # Create worktree
# Integrates with Telescope
```

### UI & Editing

**rose-pine - Theme**
```lua
variant = 'dawn'    # Light theme
dark_variant = 'main' # Dark fallback
# Integrated status line colors
# Telescope theme support
```

**mini.nvim - Swiss Army Knife**
```vim
# mini.ai - Better text objects
vii                 # Inner indent
vai                 # Around indent

# mini.surround
sa{motion}{char}    # Add surround
sd{char}            # Delete
sr{char}{new}       # Replace

# mini.statusline
# Provides the bottom status bar
```

**Comment.nvim**
```vim
gcc                 # Toggle line comment
gbc                 # Toggle block comment
gc{motion}          # Comment motion
gcip                # Comment paragraph
gcO                 # Comment above
gco                 # Comment below
gcA                 # Comment end of line
```

**vim-sleuth**
- Auto-detects indentation
- No configuration needed
- Works per buffer

### Development Tools

**nvim-dap - Debugging**
```vim
<F5>                # Continue
<F10>               # Step over
<F11>               # Step into
<F12>               # Step out
<leader>b           # Breakpoint
<leader>B           # Conditional
<leader>dr          # REPL
<leader>dl          # Run last
<leader>dh          # Hover
<leader>dp          # Preview
<leader>df          # Frames
<leader>ds          # Scopes
```

**vim-dadbod - Database**
```vim
<leader>db          # Toggle UI
<leader>du          # Execute query
# Supports: PostgreSQL, MySQL, SQLite, MongoDB
```

**rest.nvim - HTTP Client**
```vim
<leader>rr          # Run request
<leader>rl          # Run last
<leader>rp          # Preview

# In .http files:
GET https://api.example.com
Authorization: Bearer token
```

**toggleterm.nvim - Terminal**
```vim
<C-\>               # Toggle float terminal
<leader>tf          # Float terminal
<leader>th          # Horizontal terminal
<leader>tv          # Vertical terminal

# In terminal:
<C-\><C-n>         # Exit to normal mode
```

### Productivity Enhancers

**trouble.nvim - Diagnostics**
```vim
<leader>xx          # Toggle trouble
<leader>xw          # Workspace diagnostics
<leader>xd          # Document diagnostics
<leader>xl          # Location list
<leader>xq          # Quickfix list
gR                  # LSP references
```

**todo-comments.nvim**
```vim
# Highlights TODO, FIXME, NOTE, etc.
:TodoTelescope      # Search todos
:TodoTrouble        # List in trouble
]t [t               # Navigate todos
```

**persistence.nvim - Sessions**
```vim
<leader>qs          # Restore session
<leader>ql          # Restore last
<leader>qd          # Don't save current
# Auto-saves on exit
```

**inc-rename.nvim**
```vim
<leader>rn          # Rename with preview
# Shows all occurrences live
# Highlights changes
```

**symbols-outline.nvim**
```vim
<leader>o           # Toggle outline
# Shows file structure
# Navigable tree
# Auto-updates
```

### Language-Specific

**SchemaStore.nvim**
- JSON schemas for 600+ files
- Auto-completion for:
  - package.json
  - tsconfig.json
  - .eslintrc
  - docker-compose.yml

**markdown-preview.nvim**
```vim
<leader>mp          # Preview markdown
# Live updates
# Synced scrolling
```

**vim-go** (if using Go)
```vim
:GoRun              # Run current file
:GoTest             # Run tests
:GoBuild            # Build
:GoFmt              # Format
```

### Custom Plugins (lua/custom/plugins/)

**code.lua**
- Additional coding tools
- Language-specific features

**ui.lua**  
- UI enhancements
- Visual improvements

**tools.lua**
- External tool integrations
- Workflow tools

**productivity.lua**
- Efficiency plugins
- Automation tools

### Plugin Performance

**Lazy Loading Stats**
```vim
:Lazy profile       # View load times
# Most plugins <5ms
# Total startup ~80ms
```

**Key Loading Strategies**
1. **Event-based**: Load on BufRead, InsertEnter
2. **Command-based**: Load on first use
3. **Filetype-based**: Load for specific languages
4. **Key-based**: Load on keymap trigger

### Must-Know Plugin Commands

```vim
# Daily use
:Telescope find_files
:Telescope live_grep
:Mason
:Lazy sync

# Troubleshooting
:checkhealth
:LspInfo
:TSInstallInfo
:Lazy profile

# Productivity
:TodoTelescope
:Trouble
:Git blame
```

| Task | Key | Mode |
|------|-----|------|
| **Navigation** |||
| Find files | `<leader>sf` | Normal |
| Search text | `<leader>sg` | Normal |
| Go to def | `gd` | Normal |
| Jump back | `<C-o>` | Normal |
| **Editing** |||
| Change word | `ciw` | Normal |
| Delete line | `dd` | Normal |
| Repeat | `.` | Normal |
| **Selection** |||
| Inside quotes | `vi"` | Normal |
| Around braces | `va{` | Normal |
| Block select | `<C-v>` | Normal |
| **LSP** |||
| Rename | `<leader>rn` | Normal |
| Code action | `<leader>ca` | Normal/Visual |
| References | `gr` | Normal |
| **Git** |||
| Next hunk | `]c` | Normal |
| Preview | `<leader>hp` | Normal |
| Stage | `<leader>hs` | Normal |

## Productivity Rules
1. **Text objects > manual selection**
2. **Dot repeat > repetition**
3. **Telescope > :commands**
4. **Marks > scrolling**
5. **Macros > manual edits**
6. **<C-o> > getting lost**
7. **Sessions > reopening files**
8. **gd/gr > manual search**
9. **<leader>ca > manual fixes**
10. **Practice motions daily**