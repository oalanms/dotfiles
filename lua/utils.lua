local M = {}

local function set_keymap(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true })
end

function M.nmap(lhs, rhs)
  set_keymap('n', lhs, rhs)
end

function M.vmap(lhs, rhs)
  set_keymap('v', lhs, rhs)
end

return M
