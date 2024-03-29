return {
	dir = "~/workspace/go-component-generator.nvim/",
	opts = {},
	keys = {
		{ "<leader>n", ":GoImplement<CR>", mode = "v" },
		{ "<leader>n", ":GoImplementPaste<CR>", mode = "n" },
	},
	cmd = {
		"GoImplement",
		"GoImplementPaste",
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
}
--
-- return {
-- 	"relardev/go-component-generator.nvim",
--
-- 	config = function()
-- 		require('go-component-generator').setup()
--
-- 		vim.keymap.set("v", "<leader>n", ":GoImplement<CR>")
-- 	end,
-- 	dependencies = {
-- 		{ 'nvim-lua/plenary.nvim' },
-- 	}
-- }
