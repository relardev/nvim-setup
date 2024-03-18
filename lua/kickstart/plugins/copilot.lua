return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 40,
				keymap = {
					accept = "<c-e>",
					accept_word = "<c-,>",
					accept_line = "<c-.>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = true,
				toml = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
-- vim: ts=2 sts=2 sw=2 et
