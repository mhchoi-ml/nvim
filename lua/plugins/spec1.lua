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
--		"airblade/vim-gitgutter",
--		lazy = false,
--		keys = {
--			{ "<leader>hp", "<Plug>(GitGutterPreviewHunk)", desc = "git preview"}
--		},
--		init = function()
--			-- set git hunk color
--			vim.cmd[[
--				highlight GitGutterAdd    guifg=#009900 ctermfg=Green
--				highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
--				highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
--				highlight clear SignColumn
--			]]
--			-- set floating window color
--			vim.api.nvim_set_hl(0, "FloatBorder", {bg="#3B4252", fg="#5E81AC"})
--			vim.api.nvim_set_hl(0, "NormalFloat", {bg="#3B4252"})
--		end,
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup {
				signs = {
				add          = { text = '+' },
				change       = { text = '~' },
				delete       = { text = '_' },
				topdelete    = { text = '‾' },
				changedelete = { text = '~~' },
				untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '+' },
					change       = { text = '~' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~~' },
					untracked    = { text = '┆' },
				},
				signs_staged_enable = true,
				signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
			}
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
