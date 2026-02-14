-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Ctrl+F: Find and Replace (VSCode: editor.action.startFindReplaceAction)
-- Overrides default: page forward (<C-f>)
map({ "n", "v" }, "<C-f>", function()
  require("grug-far").open()
end, { desc = "Find and Replace" })

-- Ctrl+D: Change word under cursor, then press . to repeat on next occurrence
-- (VSCode: editor.action.addSelectionToNextFindMatch)
-- Overrides default: half-page down (<C-d>)
map("n", "<C-d>", "*Ncgn", { desc = "Change next occurrence" })

-- Ctrl+C: Copy to system clipboard (VSCode: clipboardCopyAction)
-- Overrides default: exit visual mode
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- Ctrl+V: Paste from system clipboard in insert mode (VSCode: clipboardPasteAction)
-- Overrides default: insert literal character
-- NOTE: Normal mode <C-v> (visual block) is preserved
map("i", "<C-v>", "<C-r>+", { desc = "Paste from clipboard" })

-- Ctrl+E: Toggle file explorer (VSCode: toggleSidebarVisibility / focusFilesExplorer)
-- Overrides default: scroll window down one line
-- File explorer keymaps (a=new, r=rename, c=copy, p=paste, d=delete) are already default in snacks explorer
map("n", "<C-e>", function()
  Snacks.explorer()
end, { desc = "Toggle Explorer" })

map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Ctrl+\ is the same physical key as Ctrl+| (Shift not distinguishable with Ctrl in terminal)
map("n", "<C-\\>", "<cmd>vsplit<cr>", { desc = "Split Vertical |" })
map("n", "<C-_>", "<cmd>split<cr>", { desc = "Split Horizontal -" }) -- Ctrl+- sends <C-_> in terminal

-- Navigate panes with Ctrl+Arrow keys (synced with tmux: prefix + Arrow)
-- NOTE: LazyVim default <C-h/j/k/l> also works and is seamless with vim-tmux-navigator
map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Pane" })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Pane" })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Pane" })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Pane" })

-- Resize panes with Ctrl+Shift+Arrow (synced with tmux: prefix + h/j/k/l)
map("n", "<C-S-Left>", "<cmd>vertical resize -5<cr>", { desc = "Resize Pane Left" })
map("n", "<C-S-Right>", "<cmd>vertical resize +5<cr>", { desc = "Resize Pane Right" })
map("n", "<C-S-Up>", "<cmd>resize +5<cr>", { desc = "Resize Pane Up" })
map("n", "<C-S-Down>", "<cmd>resize -5<cr>", { desc = "Resize Pane Down" })
