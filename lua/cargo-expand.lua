local jobs = require "firvish.lib.jobs"

local M = {}

local default_opts = {
  command = "cargo",
  args = { "expand" },
  filetype = "rust",
  no_stderr = true,
  bopen = {
    headers = false,
    how = "vert pedit",
  },
}

M.expand = function(opts)
  jobs.start_job(vim.tbl_deep_extend("force", default_opts, opts or {}))
end

return M
