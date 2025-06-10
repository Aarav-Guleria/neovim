return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local jdtls = require("jdtls")
    local root_markers = { "gradlew", "mvnw", ".git" }
    local root_dir = require("jdtls.setup").find_root(root_markers)
    if root_dir == "" then return end

    local home = os.getenv("HOME")
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    local config = {
      cmd = { "jdtls" },
      root_dir = root_dir,
      settings = {
        java = {
          eclipse = { downloadSources = true },
          configuration = {
            updateBuildConfiguration = "interactive",
          },
          maven = { downloadSources = true },
        },
      },
      init_options = {
        workspace = workspace_folder,
      },
    }

    jdtls.start_or_attach(config)
  end,
}

