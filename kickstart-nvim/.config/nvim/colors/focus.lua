local hi = vim.api.nvim_set_hl

local colors = {
  keyword_prominent = 'LightBlue',
  keyword_noticeable = 'Honeydew',
  functiondef = 'Thistle',
  normal = 'NvimLightGrey2',
  documentation = 'NvimLightGrey4',
}

--- Reset to normal colors
hi(0, 'Normal', { fg = colors.normal, bg = '#222421' })
hi(0, 'Function', { fg = colors.normal })
hi(0, 'Special', { fg = colors.normal })
hi(0, 'String', { fg = colors.normal })
hi(0, 'Identifier', { fg = colors.normal })
hi(0, 'Statement', { fg = colors.normal })

-- To find the group names you can use :Inspect on your code
-- Use :Telescope highlights
-- Neovim colors (X11 rgb colors)
-- https://github.com/neovim/neovim/blob/5331f87f6145f705c73c5c23f365cecb9fbc5067/src/nvim/highlight_group.c#L2937

--- Javascript
hi(0, '@comment.documentation.javascript', { fg = colors.documentation })
hi(0, '@punctuation.delimiter.jsdoc', { fg = colors.documentation })
hi(0, '@punctuation.bracket.jsdoc', { fg = colors.documentation, bold = true })
hi(0, '@keyword.jsdoc', { fg = colors.documentation })
hi(0, '@nospell.jsdoc', { fg = colors.documentation })
hi(0, '@function.method.javascript', { fg = colors.functiondef })
hi(0, '@function.javascript', { fg = colors.functiondef })
hi(0, '@function.tsx', { fg = colors.functiondef })
hi(0, '@keyword.type.javascript', { fg = colors.keyword_noticeable })
hi(0, '@keyword.function.javascript', { fg = colors.keyword_noticeable })
hi(0, '@keyword.coroutine.javascript', { fg = colors.keyword_noticeable })
hi(0, '@lsp.typemod.class.declaration.javascript', { fg = colors.keyword_prominent })
hi(0, '@lsp.typemod.property.declaration.javascript', { fg = colors.functiondef })

--- Python
hi(0, '@function.python', { fg = colors.functiondef })
hi(0, '@function.method.python', { fg = colors.functiondef })
hi(0, '@constructor.python', { fg = colors.keyword_prominent })
hi(0, '@attribute.python', { fg = colors.functiondef })
hi(0, '@attribute.builtin.python', { fg = colors.functiondef })

--- Lua
hi(0, '@comment.documentation.lua', { fg = colors.documentation })
hi(0, '@lsp.typemod.variable.global.lua', { fg = colors.keyword_noticeable })
