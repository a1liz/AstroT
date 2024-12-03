if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "zbirenbaum/copilot.lua",
    branch = "master",
    -- See Configuration section for rest
    -- See Commands section for default commands if you want to lazy load on them
    opts = {
      suggestion = {
        enabled = false,
        -- See Configuration section for rest
      },
    }
  }
}
