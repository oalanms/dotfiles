local group = vim.api.nvim_create_augroup(
    "au_all_files",
    { clear = true }
)

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"dart"}, 
	callback = function()
	vim.keymap.set('n', '<F4>', ':FlutterDevices<CR>')
	vim.keymap.set('n', '<F5>', ':FlutterRun<CR>')
	vim.keymap.set('n', '<F6>', ':FlutterVSplit<CR>')
	vim.keymap.set('n', '<F7>', ':FlutterHotRestart<CR>')
	vim.keymap.set('n', '<F8>', ':FlutterQuit<CR>')
	end
	})

