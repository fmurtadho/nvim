return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup()

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end)

			map("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end)

			-- Normal Hunk
			vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
			vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
			vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
			vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk)

			-- Visual Hunk
			vim.keymap.set("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)
			vim.keymap.set("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end)

			-- Toggle
			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted)

			--- Buffer
			vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
			vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
			vim.keymap.set("n", "<leader>hb", function()
				gitsigns.blame_line({ full = true })
			end)
			vim.keymap.set("n", "<leader>hD", gitsigns.diffthis)
			vim.keymap.set("n", "<leader>hd", function()
				gitsigns.diffthis("~")
			end)
		end,
	},
}
