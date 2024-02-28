local set = function(key, value)
  vim.api.nvim_set_option_value(key, value, { scope = 'global' })
end

set('expandtab', true)
set('smartindent', true)
set('tabstop', 2)
set('shiftwidth', 2)

set('breakindent', true)
set('breakindentopt', 'shift:2,sbr')

return nil
