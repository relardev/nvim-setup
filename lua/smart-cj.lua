local function len(t)
	local n = 0

	for _ in pairs(t) do
		n = n + 1
	end
	return n
end

local function qf(operation)
	local quickfix_size = len(vim.fn.getqflist())
	if quickfix_size == 0 then
		return false
	end
	local ok, _ = pcall(vim.cmd, operation)
	return ok
end

local function next_qf()
	return qf("cnext")
end

local function prev_qf()
	return qf("cprev")
end

local function diag(move_func)
	local diag_size = len(vim.diagnostic.get(0))
	if diag_size == 0 then
		return false
	end
	move_func()
	return true
end

local function next_diag()
	return diag(vim.diagnostic.goto_next)
end

local function prev_diag()
	return diag(vim.diagnostic.goto_prev)
end

local function next_hunk()
	local gs = require("gitsigns")
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		gs.next_hunk()
	end)
end

local function prev_hunk()
	local gs = require("gitsigns")
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		gs.prev_hunk()
	end)
end

vim.keymap.set("n", "<C-j>", function()
	local funcs = { next_qf, next_diag, next_hunk }
	for _, func in pairs(funcs) do
		if func() then
			vim.cmd("normal zz")
			return
		end
	end
end)

vim.keymap.set("n", "<C-k>", function()
	local funcs = { prev_qf, prev_diag, prev_hunk }
	for _, func in pairs(funcs) do
		if func() then
			vim.cmd("normal zz")
			return
		end
	end
end)
-- vim: ts=2 sts=2 sw=2 et
