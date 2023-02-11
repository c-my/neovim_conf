local lsp_status = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
        return "" .. "" .. " LSP"
    else
        return ""
    end
end

return {{
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {
                left = "",
                right = ""
            },
            section_separators = {
                left = "",
                right = ""
            },
            disabled_filetypes = {"lazy"},
            always_divide_middle = true,
            globalstatus = true
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", "diff", "diagnostics"},
            lualine_c = {{
                "filetype",
                icon_only = true,
                separator = "",
                padding = {
                    left = 1,
                    right = 0
                },
                icon = {
                    align = "right"
                }
            }, "filename"},
            lualine_x = {"searchcount", lsp_status, "encoding", "fileformat", "filetype"},
            lualine_y = {"progress"},
            lualine_z = {"location"}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {"nvim-tree", "symbols-outline", "toggleterm"}
    }
}}

