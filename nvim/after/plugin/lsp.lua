local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    -- keymaps that are overriden if the current buffer has an lsp config
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) -- go to definition
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts) -- doesn't seem to handle same method with different signatures correctly
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "<leader>ee", function() vim.diagnostic.open_float(0, {scope="line"}) end, opts) -- show line error
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'lua_ls',
    'angularls',
    'cssls',
    'gopls',
    'html',
    'pyre'
})

lsp.setup()
