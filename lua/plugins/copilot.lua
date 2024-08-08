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
    "github/copilot.lua",
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
