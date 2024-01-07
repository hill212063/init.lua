vim.g.netrw_liststyle = 3

vim.keymap.set('n', '<leader>e', function ()
    local relative_path = vim.fn.expand("%:h")
    local startPos, endPos = string.find(relative_path, "/")
    if startPos == 1 then
       relative_path = "."
    end
    vim.cmd [[:let @/=expand("%:t")]]
    vim.cmd("Lexplore " .. relative_path)
    if startPos > 1 then
        while startPos ~= nil do
            startPos, endPos = string.find(relative_path, "/", endPos + 1)
            vim.cmd("call netrw#Call('NetrwBrowseUpDir', 1)")
        end
        vim.cmd("call netrw#Call('NetrwBrowseUpDir', 1)")
    end
    vim.cmd(":normal n<CR>zz")
end)
