---@type MappingsTable
--local cmp = require "cmp"

local M = {}

M.nvterm = {
  t = {
    -- toggle in terminal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-f>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-t>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.telescope = {
  n = {
    ["ff"] = {
      function()
        require("telescope.builtin").find_files()
      end,
      "Find files",
    },
    ["fg"] = {
      function()
        require("telescope.builtin").live_grep()
      end,
      "Live grep",
    },
    ["fb"] = {
      function()
        require("telescope.builtin").live_buffers()
      end,
      "Lists open buffers in current neovim instance.",
    },
  },
}

M.dap = {
  n = {
    -- Continue debugging
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },

    -- Step over
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },

    -- Step into
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },

    -- Step out
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },

    -- Toggle breakpoint
    ["<Leader>q"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint",
    },

    -- Set breakpoint
    ["<Leader>Q"] = {
      function()
        require("dap").set_breakpoint()
      end,
      "Set breakpoint",
    },

    -- Set log point breakpoint
    ["<Leader>lp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end,
      "Set log point",
    },

    -- Open DAP REPL
    ["<Leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "Open REPL",
    },

    -- Run last debug session
    ["<Leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "Run last",
    },

    -- Open DAP UI
    ["<Leader>wo"] = {
      function()
        require("dapui").open()
      end,
      "Open DAP UI",
    },

    -- Close DAP UI
    ["<Leader>wc"] = {
      function()
        require("dapui").close()
      end,
      "Close DAP UI",
    },
  },
}

M.general = {
  t = {
    ["<ESC><ESC>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },

  -- -- luasnip mappings
  -- i = {
  -- ["<Tab><Tab>"] = cmp.mapping(function(fallback)
  --     if require("luasnip").choice_active() then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-next-choice", true, true, true), "")
  --     else
  --       fallback()
  --     end
  --   end, {
  --     "i",
  --     "s",
  --   }),
  -- }
}

-- more keybinds!

return M
