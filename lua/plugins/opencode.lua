return {
    {
        "nickjvandyke/opencode.nvim",
        version = "*", -- Latest stable release
        dependencies = {
            {
                -- `snacks.nvim` integration is recommended, but optional
                ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
                "folke/snacks.nvim",
                optional = true,
                opts = {
                    input = {}, -- Enhances `ask()`
                    picker = { -- Enhances `select()`
                        actions = {
                            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
                        },
                        win = {
                            input = {
                                keys = {
                                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                                },
                            },
                        },
                    },
                },
            },
        },
        config = function()
            ---@type opencode.Opts
            vim.g.opencode_opts = {
                -- Your configuration, if any; goto definition on the type or field for details
            }


            vim.o.autoread = true -- Required for `opts.events.reload`

            vim.keymap.set({ "n", "x" }, "<leader>oa", function() 
                require("opencode").ask("@this: ", { submit = true }) 
            end, { desc = "OpenCode: Ask regarding this" })

            -- Select Action
            vim.keymap.set({ "n", "x" }, "<leader>os", function() 
                require("opencode").select() 
            end, { desc = "OpenCode: Select action" })

            -- Toggle UI
            vim.keymap.set("n", "<leader>oo", function() 
                require("opencode").toggle() 
            end, { desc = "OpenCode: Toggle UI" })

            -- Native Operators (The 'go' style, but mapped to <leader>o)
            -- Use <leader>o followed by a motion (e.g., <leader>oip for inner paragraph)
            vim.keymap.set({ "n", "x" }, "<leader>or", function() 
                return require("opencode").operator("@this ") 
            end, { desc = "OpenCode: Add range context", expr = true })

            -- Add Line specifically
            vim.keymap.set("n", "<leader>ol", function() 
                return require("opencode").operator("@this ") .. "_" 
            end, { desc = "OpenCode: Add line context", expr = true })

            -- Scrolling the OpenCode window remotely
            vim.keymap.set("n", "<leader>ok", function() 
                require("opencode").command("session.half.page.up") 
            end, { desc = "OpenCode: Scroll up" })

            -- Note: 'j' and 'k' are used for navigation feel
            vim.keymap.set("n", "<leader>oj", function() 
                require("opencode").command("session.half.page.down") 
            end, { desc = "OpenCode: Scroll down" })
        end,
    }
}
