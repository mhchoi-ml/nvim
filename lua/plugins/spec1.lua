return {
	{
		"folke/which-key.nvim",
		lazy = false
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true
	},
	
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true
		end,
		opts = {},
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "tree"}
		}
	},

	{
		"airblade/vim-gitgutter",
		lazy = false,
		keys = {
			{ "<leader>hp", "<Plug>(GitGutterPreviewHunk)", desc = "git preview"}
		},
		init = function()
			-- set git hunk color
			vim.cmd[[
				highlight GitGutterAdd    guifg=#009900 ctermfg=Green
				highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
				highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
				highlight clear SignColumn
			]]
			-- set floating window color
			vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
			vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})
		end,
	},

	{
		'nvim-lualine/lualine.nvim',
		--dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup{
				options = {
					theme = 'gruvbox',
			    		icons_enabled = false,
		    		},
		    		tabline = {
			  		lualine_z = {
			    			{
			      			'datetime',
			      			-- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
			      			style = '%H:%M'
			    			}
			  		}
				}
			}
	    end,
	}
}
