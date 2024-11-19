return {
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      -- 调用 pretty-fold 的 setup 方法，配置插件
      require("pretty-fold").setup({
        sections = {
          left = { "content" },
          right = { " ", "number_of_folded_lines", ": ", "percentage" },
        },
        fill_char = "•",
        remove_fold_markers = true,
      })

      -- 定义 FoldUnfold 功能
      local function fold_unfold()
        local foldlevel = vim.fn.foldlevel(vim.fn.line("."))
        if foldlevel == 0 then
          vim.cmd('echo "current fold level is zero!"')
        else
          local foldclosed = vim.fn.foldclosed(vim.fn.line("."))
          if foldclosed == -1 then
            vim.cmd('normal! za') -- 折叠/展开当前行
          else
            vim.cmd('normal! zA') -- 展开所有嵌套折叠
          end
        end
      end

      -- 注册 FoldUnfold 命令
      vim.api.nvim_create_user_command("FoldUnfold", fold_unfold, {})

      -- 设置按键映射
      vim.keymap.set("n", "<CR>", ":FoldUnfold<CR>", { noremap = true, silent = true })
    end,
  },
}
