return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			insert_only = false,
			start_in_insert = true,
			mappings = {
				n = {
					["<Esc>"] = "Close",
					["<CR>"] = "Confirm",
				},
				i = {
					["<C-c>"] = "Close",
					["<CR>"] = "Confirm",
					["<Up>"] = "HistoryPrev",
					["<Down>"] = "HistoryNext",
				},
			},
		},
	},
}
