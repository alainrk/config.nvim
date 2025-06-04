return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  settings = {
    save_on_toggle = false,
    sync_on_ui_close = false,
  },
  -- NOTE: I wanted to disable these two, but it doesn't seem to work
  keys = {
    { "<C-D>", false },
    { "<C-C>", false },
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Toggle Harpoon menu" })

    vim.keymap.set("n", "<C-n>", function()
      local list = harpoon:list():display()
      local current = vim.api.nvim_buf_get_name(0)

      -- For each file in the list, check if any of them finish with current and save that index + 1
      local index = 0
      for i, str in ipairs(list) do
        if string.sub(current, -string.len(str)) == str then
          index = i
          break
        end
      end

      -- If found and it's the last one, go to the first, otherwise proceed as usual
      if index == 0 then
        harpoon:list():next()
      elseif index == harpoon:list():length() then
        harpoon:list():select(1)
      else
        harpoon:list():select(index + 1)
      end
    end, { desc = "Loop through Harpoon files" })
  end,
}
