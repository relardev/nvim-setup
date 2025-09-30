-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "q:", ":q<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>qw", ":wq<CR>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<leader>c", ":on<cr>:vsp<cr>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>'", ":nohlsearch<cr>")
vim.keymap.set("n", "<leader>nt", ":tabnew<cr>")

vim.keymap.set("n", "<leader>dj", ":%!jq .<cr>")

vim.keymap.set("v", "<leader>fj", ":!fixjson --indent 2<cr>")
vim.keymap.set("n", "<leader>fj", ":%!fixjson --indent 2<cr>")

vim.keymap.set("v", "<leader>fJ", ":!fixjson | jf<cr>")
vim.keymap.set("n", "<leader>fJ", ":%!fixjson | jf<cr>")

vim.keymap.set("v", "<leader>fn", ":s/\\\\n/\\r/g<cr>")
vim.keymap.set("n", "<leader>fn", ":%s/\\\\n/\\r/g<cr>")

local json_to_paths_format_command =
	[[jq -r 'paths(scalars) as $p | "\($p | join(".")): \((getpath($p) | tostring))"' | awk '{gsub(/\[[0-9]+\]\./, "."); print}']]

-- Normal mode mapping (whole buffer)
vim.keymap.set(
	"n",
	"<leader>fp",
	string.format(":%%!%s<CR>", json_to_paths_format_command),
	{ noremap = true, silent = true }
)

-- Visual mode mapping (selected text only)
vim.keymap.set(
	"v",
	"<leader>fp",
	string.format(":!%s<CR>", json_to_paths_format_command),
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>j", ":cnext<cr>")
vim.keymap.set("n", "<leader>k", ":cprev<cr>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap("v", "<leader>dc", ":g!/^  --data-raw/d<cr>0df'%ld$%:%!jq .<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":g!/^  --data-raw/d<cr>0df'%ld$%:%!jq .<cr>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>de",
	'0y/"{<cr>:g!/^<c-r>0/d<cr>0d/"{<cr>x$x%:%s/\\\\\\\\\\\\"/\\\\\\\\"/g<cr>:s/\\\\"/"/g<cr>:%!jq .<cr>',
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>dm",
	":%s/https:\\/\\/metrics-dev.grupawp.pl\\/cdp\\/v2\\//http:\\/\\/localhost:8080\\/api\\/v1\\//<cr>o  -H 'Authorization: Bearer test' \\<esc>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>lw", ":!wsl -fix %<cr>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>tq", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
		end
	end
	if qf_exists == true then
		vim.cmd("cclose")
		return
	end
	if not vim.tbl_isempty(vim.fn.getqflist()) then
		vim.cmd("copen")
	end
end, { silent = true, noremap = true })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<c-f>", ":!tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>lc", "<cmd>cexpr []<CR>")

-- Make help open to the right and close with "q"
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_window_right", {}),
	pattern = { "*.txt" },
	callback = function(opts)
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
			vim.keymap.set("n", "q", ":bd<cr>", { buffer = opts.buf })
		end
	end,
})
vim.api.nvim_set_keymap("n", "<c-e>", "<Nop>", { noremap = true, silent = true })

-- Copy the current buffer's file path to the system clipboard
vim.keymap.set("n", "<leader>lp", function()
	-- Get the full path of the current buffer
	local path = vim.fn.expand("%:p")
	-- Copy the path to the system clipboard
	vim.fn.setreg("+", path)
	-- Optional: Notify the user
	vim.notify("Copied path: " .. path, vim.log.levels.INFO)
end, { desc = "Copy current buffer file path" })

-- Map a key to copy the current buffer's file path and line number to the clipboard
vim.keymap.set("n", "<leader>ll", function()
	-- Get the full path of the current buffer
	local path = vim.fn.expand("%:p")
	-- Get the current line number
	local line = vim.fn.line(".")
	-- Combine path and line number
	local file_line = path .. ":" .. line
	-- Copy to the system clipboard
	vim.fn.setreg("+", file_line)
	-- Optional: Notify the user
	vim.notify("Copied: " .. file_line, vim.log.levels.INFO)
end, { desc = "Copy current buffer file path with line number" })

vim.keymap.set("n", "<leader>or", function()
	local cmd = { "./build_hot_reload.sh" }
	local output = {}
	local notify = vim.notify or print
	vim.fn.jobstart(cmd, {
		on_stdout = function(_, data)
			if data then
				for _, line in ipairs(data) do
					table.insert(output, line)
				end
			end
		end,
		on_stderr = function(_, data)
			if data then
				for _, line in ipairs(data) do
					table.insert(output, line)
				end
			end
		end,
		on_exit = function(_, code, _)
			if code == 0 then
				notify("Hot reload build succeeded ✅", vim.log.levels.INFO)
			else
				notify("Hot reload build failed ❌\n" .. table.concat(output, "\n"), vim.log.levels.ERROR)
			end
		end,
		stdout_buffered = true,
		stderr_buffered = true,
	})
end, { desc = "Run hot reload build script" })
-- vim: ts=2 sts=2 sw=2 et
