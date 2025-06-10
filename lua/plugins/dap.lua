return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map("n", "<F5>", dap.continue, opts)
      map("n", "<F10>", dap.step_over, opts)
      map("n", "<F11>", dap.step_into, opts)
      map("n", "<F12>", dap.step_out, opts)
      map("n", "<leader>b", dap.toggle_breakpoint, opts)
      map("n", "<leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
      map("n", "<leader>dr", dap.repl.open, opts)
      map("n", "<leader>dl", dap.run_last, opts)
      map("n", "<leader>du", dapui.toggle, opts)

      -- Adapters
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = 8123,
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "8123",
          },
        },
      }

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch TS file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeArgs = { "--loader", "ts-node/esm" },
          runtimeExecutable = "node",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        },
      }

      dap.adapters.go = {
        type = "executable",
        command = "dlv",
        args = { "dap" },
      }
    end,
  },
}

