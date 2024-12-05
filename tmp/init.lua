require("plugins") -- this should be on top for the configurations depends on packer
require("whichkey")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.cursorline = true

-- empty setup using defaults
require("nvim-tree").setup()

-- key mapping
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- shortcut for insert/visual to normal
map('i', 'jk', '<Esc>')
map('v', 'jk', '<Esc>')

-- shortcut for git hunk preview
map('n', '<Leader>hp', '<Plug>(GitGutterPreviewHunk)')

-- set git hunk color
vim.cmd[[
	highlight GitGutterAdd guifg=#009900 ctermfg=Green
	highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
	highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
	highlight clear SignColumn
]]

-- set floating window color
vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})

-- jump to the last position
vim.api.nvim_create_autocmd(
    {'BufReadPost'},{
    pattern = {'*'},
    callback = function()
        local ft = vim.opt_local.filetype:get()
        -- don't apply to git messages
        if (ft:match('commit') or ft:match('rebase')) then
            return
        end
        -- get position of last saved edit
        local markpos = vim.api.nvim_buf_get_mark(0,'"')
        local line = markpos[1]
        local col = markpos[2]
        -- if in range, go there
        if (line > 1) and (line <= vim.api.nvim_buf_line_count(0)) then
            vim.api.nvim_win_set_cursor(0,{line,col})
        end
    end
})
