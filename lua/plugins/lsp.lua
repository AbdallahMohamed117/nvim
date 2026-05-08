return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttachKeymaps", { clear = true }),
      callback = function(event)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Goto definition")
        map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostic float")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      end,
    })

    require("lspconfig")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("sqlls")
    vim.lsp.enable("pylsp")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("clangd")
  end,
}
