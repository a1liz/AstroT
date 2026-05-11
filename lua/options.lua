-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = '' -- disable the mouse in Nvim
vim.o.wrap = true

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.viewoptions = "cursor,slash,unix"

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
