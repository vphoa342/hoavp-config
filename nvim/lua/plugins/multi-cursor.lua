return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    -- Map lại phím để giống VSCode nhất có thể
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
    }
  end,
}
