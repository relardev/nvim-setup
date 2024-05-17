return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			keymaps = {
				["<C-h>"] = false,
			},
			view_options = {
				show_hidden = false,
			},
		})

		vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
	end,
}
