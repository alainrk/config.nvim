-- Set leader to space character (space is the default for lazy.nvim)
-- vim.g.mapleader = " "

-- Save with leader-s and ctrl-s
vim.keymap.set({ "n" }, "<Leader>s", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- Copy/Paste from/to the system clipboard
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>p", [["+p]])

-- Remap "kj" to ESC
vim.keymap.set({ "i", "v" }, "kj", "<Esc>")

-- Make j and k move to the next row (displayed line), not actual file line
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Move keeping the center of the screen
vim.keymap.set({ "n", "v" }, "J", "5gjzz")
vim.keymap.set({ "n", "v" }, "K", "5gkzz")

-- Move to beginning/end of line
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Select the entire file
vim.keymap.set({ "n", "v" }, "<leader>va", "ggVG", { desc = "Select the entire file" })

-- Duplicate current line commenting it
vim.keymap.set("n", "yc", "yy<cmd>normal gcc<CR>p", { desc = "Duplicate current line commenting it" })

-- Move selected lines with shift+j or shift+k
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Disables search highlighting by double-pressing the Escape key in any mode
vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>")

-- Keep search results at the center of screen
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")

-- Remap 'copy all to the clipboard'
vim.keymap.set("n", "<Leader>ya", ":%y+<Enter>", { desc = "Copy the entire file to clipboard" })

-- Remove all whitespaces at the end of the lines in the whole file
vim.keymap.set("n", "<Leader>ll", ":%s/\\s\\+$//e<Enter>", { desc = "Remove trailing whitespaces" })

-- Set search back to smartcase (useful after search and replace)
vim.keymap.set(
  "n",
  "<Leader>i",
  ":set smartcase<Enter>",
  { desc = "Set search to smartcase, useful after search and replace" }
)

-- Note: Set ":set [ic|noic]" before the command to search for ignore/preserve case
-- After having yanked some text, run this to start find replace with confirmation
vim.keymap.set(
  "n",
  "<Leader>fd",
  ':set noic<Enter>:%s/<C-r>"//gc<Left><Left><Left>',
  { desc = "Start find-replace with yanked text" }
)

-- Copy contents of default register to system clipboard (e.g. when wrongly yanking into default)
vim.keymap.set("n", "<Leader>yy", function()
  local default_reg = vim.fn.getreg('"')
  vim.fn.setreg("+", default_reg)
end, { noremap = true, silent = true, desc = "Copy default register to clipboard" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "[e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "[q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- See diagnostic when out of screen
vim.keymap.set("n", "<leader>dd", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Toggle diagnostic panel" })

-- Navigate quicklist faster (when doing a search or gr [go to refs], press C-q to add results in the quickfix list)
vim.keymap.set("n", "<C-j>", ":cnext<CR>zz")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zz")

-- Faster surround with quotes (need mini.surround plugin)
vim.keymap.set("x", "sq", "c''<ESC>P", { desc = "Surround selection with single quotes" })
vim.keymap.set("x", "sd", 'c""<ESC>P', { desc = "Surround selection with double quotes" })

-- Toggle conceal level 0 or 2 (replacement of text, e.g. for Obsidian/Markdown)
vim.keymap.set("n", "<Leader>co", function()
  if vim.opt.conceallevel:get() == 0 then
    vim.opt.conceallevel = 2
  else
    vim.opt.conceallevel = 0
  end
end, { desc = "Toggle conceal level" })

-----------------------------------------------------------------------------------
-- Languages specific stuff
-----------------------------------------------------------------------------------

-- C: Switch between current (header/source) file
vim.keymap.set("n", "<Leader>oc", function()
  -- If currently on the .c file, go to the .h file
  if vim.fn.expand("%:e") == "c" then
    vim.cmd("e %:r.h")
  -- If currently on the .h file, go to the .c file
  elseif vim.fn.expand("%:e") == "h" then
    vim.cmd("e %:r.c")
  end
end, { desc = "Switch to C header/source file" })

-----------------------------------------------------------------------------------
-- Plugin specific stuff
-----------------------------------------------------------------------------------

-- Codeium: Accept suggestion
-- vim.keymap.set("i", "<C-l>", function()
--   return vim.fn["codeium#Accept"]()
-- end, { expr = true, silent = true, desc = "Accept codeium suggestion" })

-- Neotree: Instead of opening it, focus it
vim.keymap.set("n", "<Leader>n", function()
  vim.cmd("Neotree toggle")
end, { desc = "Toggle Neotree" })
-- Neotree: Close panel
vim.keymap.set("n", "<Leader>e", function()
  vim.cmd("Neotree focus")
end, { desc = "Focus Neotree" })

-- Undotree: Toggle panel
vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<CR>")

-- Harpoon: These lines are required for the setup
local harpoon = require("harpoon")
harpoon:setup()
vim.keymap.set("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<C-h>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon menu" })
vim.keymap.set("n", "<C-D>", function()
  harpoon:list():prev()
end, { desc = "Go to previous Harpoon file" })
vim.keymap.set("n", "<C-C>", function()
  harpoon:list():next()
end, { desc = "Go to next Harpoon file" })
--- TODO: I want to have a loop behaviour when reaching the end of the list
