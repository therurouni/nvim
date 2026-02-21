return {
  -- Plugin 1: Your "LUFFY" Dashboard
  {
    "goolord/alpha-nvim",
    event = "VimEnter", -- Ensure it loads on startup
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[██╗     ██╗   ██╗███████╗███████╗██╗   ██╗]],
        [[██║     ██║   ██║██╔════╝██╔════╝╚██╗ ██╔╝]],
        [[██║     ██║   ██║█████╗  █████╗   ╚████╔╝ ]],
        [[██║     ██║   ██║██╔══╝  ██╔══╝    ╚██╔╝  ]],
        [[███████╗╚██████╔╝██║     ██║        ██║   ]],
        [[╚══════╝ ╚═════╝ ╚═╝     ╚═╝        ╚═╝   ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find File", ":Telescope find_files <CR>"),
        dashboard.button("r", "󰄉  Recent Files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", "󰱽  Find Text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "󰒓  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
        dashboard.button("q", "󰅙  Quit", ":qa <CR>"),
      }

      -- Center everything based on your screen size
      alpha.setup(dashboard.opts)
    end,
  },

  -- Plugin 2: Neo-Tree (Optimized)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Explorer" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = { enabled = true }, -- Focuses current file in tree
      },
    },
  },

  -- Plugin 3: Noice.nvim (Enhanced Command UI)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
}
