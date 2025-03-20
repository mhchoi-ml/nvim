return {
	{
		"folke/which-key.nvim",
		--lazy = true
		event = "VeryLazy",
		opts = {
		},
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
				on_attach = function(bufnr)
					local gitsigns = require('gitsigns')

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map('n', ']c', function()
						if vim.wo.diff then
							vim.cmd.normal({']c', bang = true})
						else
							gitsigns.nav_hunk('next')
						end
					end)

					map('n', '[c', function()
						if vim.wo.diff then
							vim.cmd.normal({'[c', bang = true})
						else
							gitsigns.nav_hunk('prev')
						end
					end)

					-- Actions
					map('n', '<leader>hs', gitsigns.stage_hunk)
					map('n', '<leader>hr', gitsigns.reset_hunk)

					map('v', '<leader>hs', function()
						gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
					end)

					map('v', '<leader>hr', function()
						gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
					end)

					map('n', '<leader>hS', gitsigns.stage_buffer)
					map('n', '<leader>hR', gitsigns.reset_buffer)
					map('n', '<leader>hp', gitsigns.preview_hunk)
					map('n', '<leader>hi', gitsigns.preview_hunk_inline)

					map('n', '<leader>hb', function()
						gitsigns.blame_line({ full = true })
					end)

					map('n', '<leader>hd', gitsigns.diffthis)

					map('n', '<leader>hD', function()
						gitsigns.diffthis('~')
					end)

					map('n', '<leader>hq', function() gitsigns.setqflist('all') end)
					map('n', '<leader>hq', gitsigns.setqflist)

					-- toggles
					map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
					map('n', '<leader>td', gitsigns.toggle_deleted)
					map('n', '<leader>tw', gitsigns.toggle_word_diff)

					-- text object
					map({'o', 'x'}, 'ih', gitsigns.select_hunk)
				end
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
