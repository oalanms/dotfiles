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

function M.imap(lhs, rhs)
    set_keymap('i', lhs, rhs)
end

function M.get_quickfix_bufnr()
    local all_buffers = vim.fn.getbufinfo()
    for _, buffer in ipairs(all_buffers) do
        local buftype = vim.api.nvim_buf_get_option(buffer.bufnr, "buftype")
        if buftype == "quickfix" then
            return buffer.bufnr
        end
    end
    return -1
end

return M
