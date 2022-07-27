local jobs = {}

local function append_to_quickfix(data, title)
  local lines = {}
  vim.list_extend(lines, data)

  vim.fn.setqflist({}, "a", {
      title = title or "Make",
      lines = lines,
  })
end

local function run_make_job(target)
  vim.fn.setqflist({}, 'r')
  local begin_message = "make " .. target
  print(begin_message)
  append_to_quickfix({begin_message})

  jobs[#jobs+1] = vim.fn.jobstart({"make", target}, {
    on_exit = function(_, rc)
      local end_message = "Finished with rc=" .. tostring(rc)
      print(end_message)
      append_to_quickfix({end_message}, "Make (rc=" .. tostring(rc) .. ")")
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
