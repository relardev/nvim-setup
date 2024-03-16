vim.cmd("iabbrev ret return")

local go_group = vim.api.nvim_create_augroup("go", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.go", command = "iabbrev fn func", group = go_group })

local lua_group = vim.api.nvim_create_augroup("lua", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.lua", command = "iabbrev fn function", group = lua_group })
