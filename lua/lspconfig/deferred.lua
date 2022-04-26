local M = {}

M.should_defer = true

local deferred_configs = {}

function M.defer(config)
  assert(M.should_defer, "defer() was called when it wasn't expected.")
  table.insert(deferred_configs, config)
end

function M.flush()
  local configs = require 'lspconfig.configs'
  M.should_defer = false
  for _, config in pairs(deferred_configs) do
    configs[config.name].setup(config)
  end
  deferred_configs = {}
end

return M
