local autocmd = vim.api.nvim_create_autocmd

autocmd({"BufRead", "BufNewFile"}, {
    pattern = "Jenkinsfile",
    command = "set filetype=groovy",
})
