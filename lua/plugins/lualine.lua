local lsp_status = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
        return "" .. "" .. " LSP"
    else
        return ""
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = {
                    left = "",
                    right = "",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    {
                        "filetype",
                        icon_only = true,
                        separator = "",
                        padding = {
                            left = 1,
                            right = 0,
                        },
                    },
                    { "filename", path = 1 },
                },
                lualine_x = { "searchcount", lsp_status, "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = { { "filename", path = 1 } },
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "nvim-tree", "lazy", "symbols-outline", "toggleterm" },
        },
    },
}
