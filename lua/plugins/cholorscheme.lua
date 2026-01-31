return {
    {
        'sainnhe/sonokai',
        lazy = false,
        --priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.sonokai_style = 'espresso'
            vim.g.sonokai_enable_italic = true
        --    vim.cmd.colorscheme('sonokai')
        end
    },
    {
        'datsfilipe/vesper.nvim',
        lazy = false,
  --      priority = 1000,
          config = function()
  --          vim.cmd.colorscheme('vesper')
        end
    },
    {
        "ellisonleao/gruvbox.nvim", 
        priority = 1000 , 
        config = function()
            require("gruvbox").setup({
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                transparent_mode = true,
            })
            vim.cmd.colorscheme("gruvbox")
        end,
    },
}
