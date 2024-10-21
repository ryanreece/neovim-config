function ColorMyPencils(color)
    color = color or "tokyonight-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.cmd([[highlight ColorColumn guibg=#005885]])
end

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        ColorMyPencils("tokyonight-moon")
    end
}
