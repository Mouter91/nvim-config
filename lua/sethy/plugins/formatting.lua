
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                cpp = { "clang_format" },
                c = { "clang_format" },
                h = { "clang_format" },
                ["hxx"] = { "clang_format" },
                ["hpp"] = { "clang_format" },
            },
        })

        -- Optional keymap for formatting
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file (C++)" })
    end,
}
