-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "c",
      "cpp",
      -- add more arguments for adding more treesitter parsers
    },
    fold = {
      enable = true,
    },
  },
}
