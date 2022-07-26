local jobs = {}
local cur_qf = {}

vim.keymap.set('n', '<localleader>jb', ':lua run_make_job("build")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jr', ':lua run_make_job("run")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jt', ':lua run_make_job("test")<CR>', no_remap_silent)
vim.keymap.set('n', '<localleader>jq', ':lua stop_jobs()<CR>', no_remap_silent)

function append_to_quickfix(data)
  for _, line in ipairs(data) do
    cur_qf[#cur_qf+1] = line
  end
  vim.diagnostic.fromqflist(cur_qf)
end

function run_make_job(target)
  vim.cmd("cexpr []")
  cur_qf = {}
  append_to_quickfix({"make " .. target})
  job = vim.fn.jobstart({"make", target}, {
    stdout_buffered = true,
    on_exit = function(_, rc)
      append_to_quickfix({"Finished with rc=" .. tostring(rc)})
    end,
    on_stdout = function(_, data)
      -- append_to_quickfix(data)
    end,
    on_stderr = function(_, data)
      append_to_quickfix(data)
    end
  })
  jobs[#jobs+1] = job
end

function stop_jobs()
  for _, job in ipairs(jobs) do
    vim.fn.jobstop(job)
  end
  jobs = {}
end
