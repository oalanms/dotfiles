local bufnumber = -1
local build_jobs = {}
local run_jobs = {}

vim.keymap.set('n', '<localleader>jh', ':lua set_build_buffer()<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jb', ':lua start_build()<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jr', ':lua start_run()<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>js', ':lua stop_jobs()<CR>', no_remap_silent)

function set_build_buffer()
  bufnumber = vim.api.nvim_get_current_buf()
  vim.cmd([[:set buftype=nofile]])
end

function append_to_buffer(data)
  vim.api.nvim_buf_set_lines(bufnumber, -1, -1, false, data)
end

function start_build()
  vim.api.nvim_buf_set_lines(bufnumber, 0, -1, false, {"Building..."})
  job = vim.fn.jobstart({"make", "build"}, {
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
  build_jobs[#build_jobs+1] = job
end

function start_run()
  vim.api.nvim_buf_set_lines(bufnumber, 0, -1, false, {"Running..."})
  local job = vim.fn.jobstart({"make", "run"}, {
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
  run_jobs[#run_jobs+1] = job
end

function stop_jobs()
  for _, job in ipairs(build_jobs) do
    vim.fn.jobstop(job)
  end
  for _, job in ipairs(run_jobs) do
    vim.fn.jobstop(job)
  end
end
