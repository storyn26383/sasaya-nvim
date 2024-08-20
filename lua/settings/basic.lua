-- basic settings
vim.opt.backspace = { 'indent', 'eol', 'start' }        -- allow backspacing over everything in insert mode
vim.opt.history = 1000                                  -- keep 1000 lines of command line history
vim.opt.undolevels = 100                                -- set number of undo levels
vim.opt.autoread = true                                 -- auto read when file is changed from outside
vim.opt.hidden = true                                   -- switch buffers without saving
vim.opt.splitright = true                               -- always open vertical split window on the right side
vim.opt.splitbelow = true                               -- always open horizontal split window below
vim.opt.startofline = false                             -- do not reset cursor to beginning of line on some commands
vim.opt.switchbuf = 'useopen'                           -- use an existing buffer when switching buffers
vim.opt.scrolloff = 4                                   -- start scrolling when 4 lines away from margins
vim.opt.exrc = true                                     -- allows for per-project configuration files
vim.opt.mouse = ''                                      -- disable mouse actions

-- performance settings
vim.opt.ttyfast = true                                  -- send more chars while redrawing
vim.opt.lazyredraw = true                               -- screen is not redrawn when executing macros
vim.opt.timeoutlen = 1000                               -- to wait after a key code sequence to complete
vim.opt.ttimeoutlen = 0                                 -- to wait for a key code sequence to complete
vim.opt.updatetime = 300                                -- to wait for trigger CursorHold event

-- visual settings
vim.opt.shortmess:append('I')                           -- remove intro message
vim.opt.ruler = true                                    -- show the cursor position all the time
vim.opt.wrap = true                                     -- wrap lines
vim.opt.linebreak = true                                -- wrap lines at convenient points
vim.opt.list = false                                    -- disable showing invisible characters
vim.opt.cursorline = true                               -- highlight the current line
vim.opt.cursorcolumn = false                            -- do not highlight the current column
vim.opt.showmatch = true                                -- briefly jump to the matching bracket
vim.opt.number = true                                   -- show line numbers
vim.opt.numberwidth = 4                                 -- width of the line number column
vim.opt.relativenumber = false                          -- show relative line numbers
vim.opt.signcolumn = 'yes'                              -- always show the sign column
vim.opt.title = true                                    -- show title in terminal
vim.opt.showcmd = true                                  -- show incomplete commands
vim.opt.showmode = false                                -- do not show mode (e.g., -- INSERT --)
vim.opt.showtabline = 2                                 -- always show tab line (the very top line)
vim.opt.laststatus = 2                                  -- always show status line (the very bottom line)
vim.opt.synmaxcol = 512                                 -- maximum column for syntax highlight
vim.opt.diffopt:append('vertical')                      -- show vertical diff by default

-- auto completion settings
vim.opt.wildmode = { 'list', 'full' }                   -- make tab completion for files/buffers act like bash
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- set completion options

-- folding settings
vim.opt.foldenable = true                               -- enable folding
vim.opt.foldmethod = 'indent'                           -- fold based on indentation
vim.opt.foldlevel = 100                                 -- open most folds by default

-- search settings
vim.opt.hlsearch = true                                 -- highlight matches of last search
vim.opt.incsearch = true                                -- show matches as search pattern is typed
vim.opt.ignorecase = true                               -- ignore case in search patterns
vim.opt.smartcase = true                                -- override ignorecase if pattern has uppercase letters

-- indent settings
vim.opt.autoindent = true                               -- maintain indent of current line
vim.opt.copyindent = true                               -- copy the previous indentation on autoindenting
vim.opt.smarttab = true                                 -- insert tabs on the start of a line according to shiftwidth
vim.opt.expandtab = true                                -- convert tabs to spaces
vim.opt.softtabstop = 2                                 -- number of spaces that <Tab> counts for
vim.opt.shiftwidth = 2                                  -- number of spaces to use for each step of (auto)indent
vim.opt.tabstop = 2                                     -- number of spaces that <Tab> in the file counts for

-- disable sound on errors
vim.opt.visualbell = true                               -- use visual bell instead of beeping
vim.opt.errorbells = false                              -- do not ring the bell for errors
vim.opt.timeout = true                                  -- enable timeout
vim.opt.timeoutlen = 500                                -- timeout length in milliseconds

-- file settings
vim.opt.bomb = false                                    -- no BOM (Byte Order Mark)
vim.opt.viminfo = ''                                    -- disable .viminfo file
vim.opt.backup = false                                  -- no *~ backup files
vim.opt.swapfile = false                                -- disable swap file
vim.opt.writebackup = false                             -- disable writing backup file
vim.opt.encoding = 'utf-8'                              -- set internal character encoding
vim.opt.fileencoding = 'utf-8'                          -- set file encoding
vim.scriptencoding = 'utf-8'                            -- set script file encoding
vim.opt.wildignore:append {
  '*.o', '*.obj', '*.pyc',                              -- ignore object files
  '*.png', '*.jpg', '*.gif', '*.ico',                   -- ignore image files
  '*.swf', '*.fla',                                     -- ignore flash files
  '*.mp3', '*.mp4', '*.avi', '*.mkv',                   -- ignore media files
  '*.git*', '*.hg*', '*.svn*',                          -- ignore version control directories
  '*.DS_Store', 'log/**', 'tmp/**'                      -- ignore specific patterns
}
