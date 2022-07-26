local bufnumber = -1
local jobs = {}

vim.keymap.set('n', '<localleader>jh', ':lua set_build_buffer()<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jb', ':lua run_make_job("build")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jr', ':lua run_make_job("run")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jt', ':lua run_make_job("test")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jq', ':lua stop_jobs()<CR>', no_remap_silent)

function set_build_buffer()
  bufnumber = vim.api.nvim_get_current_buf()
  vim.cmd([[:set buftype=nofile]])
end

function append_to_buffer(data)
  vim.api.nvim_buf_set_lines(bufnumber, -1, -1, false, data)
end

function run_make_job(target)
  vim.api.nvim_buf_set_lines(bufnumber, 0, -1, false, {"make ", target})
  job = vim.fn.jobstart({"make", target}, {
    stdout_buffered = true,
    on_exit = function(_, rc)
      append_to_buffer({"Finished with rc=" .. tostring(rc)})
    end,
    on_stdout = function(_, data)
      append_to_buffer(data)
    end,
    on_stderr = function(_, data)
      append_to_buffer(data)
    end
  })
  jobs[#jobs+1] = job
end

function stop_jobs()
  for _, job in ipairs(jobs) do
    vim.fn.jobstop(job)
  end
end
