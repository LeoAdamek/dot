local dap = require('dap')

require('dapui').setup()

--vim.notify("configuring dap", vim.log.levels.INFO)

dap.adapters.lldb = {
  type = 'executable',
  name = 'lldb',
  command = '/usr/bin/lldb-dap-18'
}

local bind = vim.keymap.set

bind('n', '<F5>', function() dap.continue() end)
bind('n', '<F10>', function() dap.step_over() end)
bind('n', '<F11>', function() dap.step_into() end)
bind('n', '<F12>', function() dap.step_out() end)
bind('n', '<Leader>dn', function() dap.new() end)
bind('n', '<Leader>bb', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
bind('n', '<Leader>dc', function() dap.repl.open() end, { desc = "Open Debugger REPL" })
bind('n', '<Leader>dr', function() dap.run_last() end)
bind('n', '<Leader>dl', function()
  dap.set_breakpoit(nil, nil, vim.fn.input('Logging Point Message: '))
end,
  { desc = "Add Loggging Tracer" }
)

bind('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end,

  {desc = "View Debugger Frames"}
)

bind({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end,
  {desc = "Preview Debugger UI"}
)


bind('n', '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end,
  { desc = "Toggle Debugger Hover"}
)

bind('n', '<Leader>dd', function() require('dapui').toggle() end, { desc = "Toggle DAP UI" })

