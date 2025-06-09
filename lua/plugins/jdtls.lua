return {
    {
        "mfussenegger/nvim-jdtls",
        config = function()
            require("lspconfig").jdtls.setup({
                cmd = { "jdtls" },
                root_dir = require("jdtls.setup").find_root({ "gradlew", "mvnw", ".git" }),
                settings = { java = {} },
            })
        end,
    }
}

