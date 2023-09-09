require('indent_blankline').setup({
    filetype_exclude = {
        'help',
        'terminal',
        'dashboard',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
    },
    buftype_exclude = {
        'terminal',
    },
})
