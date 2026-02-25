require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.o
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

-- Expand :t to :term only when the command is exactly "t".
vim.cmd [[cnoreabbrev <expr> t ((getcmdtype() == ':' && getcmdline() ==# 't') ? 'term' : 't')]]
