-- Persistent patches for Neovim 0.12+ compatibility
-- Patches are applied once and survive lazy.nvim plugin updates

------------------------------------------------------------
-- Neovim 0.12: vim.treesitter.get_range may receive a
-- {TSNode} array (single-element table) instead of a raw
-- TSNode. Unwrap it so node:range() doesn't fail with
-- "attempt to call method 'range' (a nil value)".
------------------------------------------------------------
local _patches_applied = {}

do
  local _get_range = vim.treesitter.get_range
  vim.treesitter.get_range = function(node, source, metadata)
    if type(node) == "table" and #node > 0 and type(node[1]) == "userdata" then
      node = node[1]
    end
    if not node then
      return { 0, 0, 0, 0, 0, 0 }
    end
    return _get_range(node, source, metadata)
  end
end
