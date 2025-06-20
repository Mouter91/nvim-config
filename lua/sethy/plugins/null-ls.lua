
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- Форматирование для C/C++
        formatting.clang_format.with({
          extra_args = { "--style=file" }, -- использует .clang-format, если есть
        }),
        -- Можешь добавить другие форматтеры здесь
        -- formatting.black, formatting.prettier и т.д.
      },

      -- Автоформат при сохранении
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}

