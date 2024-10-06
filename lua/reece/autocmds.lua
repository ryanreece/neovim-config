local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufRead", "BufNewFile"}, {
    pattern = "Jenkinsfile",
    callback = function ()
        vim.bo.filetype = "groovy"
    end,
})

autocmd("FileType", {
    pattern = "markdown",
    callback = function ()
        vim.opt_local.textwidth = 79
    end,
})

autocmd("FileType", {
    pattern = "terraform",
    callback = function ()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
