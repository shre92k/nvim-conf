return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local state, neo_tree = pcall(require, "neo-tree")
    if not state then
      return
    end
    neo_tree.setup({
      window = {
        mappings = {
          ["K"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
          ["ga"] = { "git_add_file" },
          ["gus"] = { "git_unstage_file" },
          ["gr"] = { "git_revert_file" }, -- add :e command after this to refresh page
          ["gc"] = { "git_commit" },
          ["gp"] = { "git_push" },
          ["gg"] = { "git_commit_and_push" },
        }
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal toggle<CR>', { desc = 'open neotree on left' })
  end,
}
