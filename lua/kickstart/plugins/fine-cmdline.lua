return {
	"VonHeikemen/fine-cmdline.nvim",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	config = function()
		local fineline = require("fine-cmdline")
		local fn = fineline.fn

		fineline.setup({
			hooks = {
				set_keymaps = function(imap, _feedkeys)
					-- Restore default keybindings...
					-- Except for `<Tab>`, that's what everyone uses to autocomplete
					imap("<Esc>", "<esc>")
					imap("<C-c>", fn.close)

					imap("<C-P>", fn.up_search_history)
					imap("<C-N>", fn.down_search_history)
				end,
			},
		})
		vim.api.nvim_set_keymap("n", ":", "<cmd>FineCmdline<CR>", { noremap = true })
	end,
}
