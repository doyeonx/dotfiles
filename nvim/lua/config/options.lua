local g = vim.g
local o = vim.o
local opt = vim.opt
local fn = vim.fn

o.termguicolors = true
o.encoding = "utf-8"
o.history = 1000                 -- remember more commands and search history
o.undolevels = 1000              -- use many muchos levels of undo
o.title = true                   -- change the terminal's title
o.backup = false                 -- no backup file
o.swapfile = false               -- don't write .swp files
o.undofile = true                -- default `undodir = ~/.local/share/nvim/undo/`
o.wrap = true                   -- don't wrap lines
o.tabstop = 4                    -- a tab is four spaces
o.shiftwidth = o.tabstop         -- number of spaces to use for autoindenting
o.shiftround = true              -- use multiple of shiftwidth when indenting with '<' and '>'
o.expandtab = true               -- expand tab to count tabstop n° of spaces
o.backspace = "indent,eol,start" -- allow backspacing over everything in insert mode
o.autoindent = true
o.copyindent = true              -- copy the previous indentation on autoindenting
o.number = true                  -- always show line numbers
o.relativenumber = true
o.showmatch = true               -- show matching parenthesis with a quick jump
o.ignorecase = true              -- ignore case when searching with / or ?
o.smartcase = true               -- ignore case if search pattern is all lowercase, case-sensitive otherwise
o.smarttab = true                -- insert tabs on the start of a line according to shiftwidth, not tabstop
o.hlsearch = true                -- highlight search terms
o.incsearch = true               -- show search matches as you type
-- o.clipboard = "unnamed"       -- send yanks to system clipboard (buggy with v-block)
o.showbreak = "↪ "
o.splitbelow = true
o.splitright = true
o.foldenable = false