local job_ctrl = require "firvish.job_control2"

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
  job_ctrl.start_job(vim.tbl_deep_extend("force", default_opts, opts or {}))
end

return M
