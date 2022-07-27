local jobs = {}

local function append_to_quickfix(data)
  local lines = {}
  vim.list_extend(lines, data)

  vim.fn.setqflist({}, "a", {
      title = "Make",
      lines = lines,
  })
end

local function run_make_job(target)
  vim.fn.setqflist({}, 'r')
  append_to_quickfix({"make " .. target})

  jobs[#jobs+1] = vim.fn.jobstart({"make", target}, {
    on_exit = function(_, rc)
      append_to_quickfix({"Finished with rc=" .. tostring(rc)})
    end,
    on_stdout = function(_, data)
      append_to_quickfix(data)
    end,
    on_stderr = function(_, data)
      append_to_quickfix(data)
    end
  })
end

local function stop_jobs()
  for _, job in ipairs(jobs) do
    vim.fn.jobstop(job)
  end
  jobs = {}
end

local nmap = require('utils').nmap
nmap('<localleader>jb', function() run_make_job("build") end)
nmap('<localleader>jr', function() run_make_job("run") end)
nmap('<localleader>jt', function() run_make_job("test") end)
nmap('<localleader>jq', function() stop_jobs() end)

nmap('<localleader>q', ':copen<CR>')
