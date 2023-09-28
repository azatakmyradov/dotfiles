vim.api.nvim_set_hl(0, 'FloatBorder', {
    fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
})

-- Make the cursor line background invisible
vim.api.nvim_set_hl(0, 'CursorLineBg', {
    fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
    bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
})

vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#021629' })

-- vim.api.nvim_set_hl(0, 'StatusLineNonText', {
--     fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
--     bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
-- })

vim.api.nvim_set_hl(0, 'StatusLine', { bg ='#021629' });
vim.api.nvim_set_hl(0, 'NonText', { bg ='#021629' });
vim.api.nvim_set_hl(0, 'StatusLineNonText', { bg ='#021629' });

vim.api.nvim_set_hl(0, 'indentblanklinechar', { fg = '#021D37' })
