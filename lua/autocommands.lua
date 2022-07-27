local augroup = vim.api.nvim_create_augroup("augroup", { clear = true })
local nmap = require("utils").nmap

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"dart"}, 
	callback = function()
	vim.keymap.set('n', '<F4>', ':FlutterDevices<CR>')
	vim.keymap.set('n', '<F5>', ':FlutterRun<CR>')
	vim.keymap.set('n', '<F6>', ':FlutterVSplit<CR>')
	vim.keymap.set('n', '<F7>', ':FlutterHotRestart<CR>')
	vim.keymap.set('n', '<F8>', ':FlutterQuit<CR>')
	end,
  group = augroup
	})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {"*"},
	callback = function()
	vim.cmd('GitGutter')
	end,
  group = augroup
	})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"cpp", "h"},
	callback = function()
	nmap('<leader>c', ':e %<.cpp<CR>')
	nmap('<leader>C', ':vnew %<.cpp<CR>')
	nmap('<leader>h', ':e %<.h<CR>')
	nmap('<leader>H', ':vnew %<.h<CR>')
	nmap('<leader>b', ':vnew %:p:h/CMakeLists.txt<CR>')
	end,
  group = augroup
	})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	pattern = {"*"},
	callback = function()
        vim.cmd([[$]])
	end,
  group = augroup
	})

