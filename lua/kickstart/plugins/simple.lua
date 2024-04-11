return {
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle },
		},
	},
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>tb", "<cmd>Git blame<cr>" },
		},
	},
	{
		"yanskun/gotests.nvim",
		keys = {
			{ "<leader>gt", "<cmd>GoTests<cr>" },
			{ "<leader>ga", "<cmd>GoTestsAll<cr>" },
		},
		opts = {},
	},
	{
		"vim-test/vim-test",
		keys = {
			{ "<leader>tn", "<cmd>TestNearest<cr>" },
			{ "<leader>tt", "<cmd>TestSuite<cr>" },
		},
	},
	{ "tpope/vim-fugitive", event = "VeryLazy" },
}
-- vim: ts=2 sts=2 sw=2 et
