return {

  -----------------------------------------------------------------------
  -- 🌈 THEME: Tokyo Night (Force Full Black Background)
  -----------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        on_highlights = function(hl, colors)
          hl.Normal = { bg = "#000000", fg = colors.fg }
          hl.NormalNC = { bg = "#000000", fg = colors.fg }
          hl.SignColumn = { bg = "#000000" }
          hl.LineNr = { bg = "#000000", fg = colors.dark5 }
          hl.CursorLine = { bg = "#000000" }
          hl.CursorLineNr = { bg = "#000000", fg = colors.blue }
          hl.StatusLine = { bg = "#000000", fg = colors.blue }
          hl.TabLineFill = { bg = "#000000" }
          hl.WinSeparator = { bg = "#000000", fg = "#222222" }
          hl.DiagnosticVirtualTextError = { bg = "#000000", fg = colors.red }
          hl.DiagnosticVirtualTextWarn  = { bg = "#000000", fg = colors.yellow }
          hl.DiagnosticVirtualTextInfo  = { bg = "#000000", fg = colors.blue }
          hl.DiagnosticVirtualTextHint  = { bg = "#000000", fg = colors.green }
        end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -----------------------------------------------------------------------
  -- 🔍 TELESCOPE (Fuzzy Finder)
  -----------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
    end,
  },

  -----------------------------------------------------------------------
  -- 🌳 TREESITTER (Syntax Highlighting)
  -----------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "cpp", "java", "python", "lua", "vim", "bash" },
        highlight = { enable = true },
      })
    end,
  },

  -----------------------------------------------------------------------
  -- 🔄 AUTOPAIRS & SNIPPETS
  -----------------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup() end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/lua/custom/snippets",
      })
    end,
  },

  -----------------------------------------------------------------------
  -- 📦 TERMINAL & UTILS
  -----------------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = { border = "rounded" },
      })
    end,
  },
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("competitest").setup({
        compile_command = {
          cpp = { exec = "g++", args = { "-std=c++17", "$(FNAME)", "-O2", "-Wall", "-o", "$(FNOEXT)" } },
          java = { exec = "javac", args = { "$(FNAME)" } },
          go = { exec = "go", args = { "build", "-o", "$(FNOEXT)", "$(FNAME)" } },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
          java = { exec = "java", args = { "$(FNOEXT)" } },
          go = { exec = "./$(FNOEXT)" },
        },
      })
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  { "cbochs/grapple.nvim", config = true },
  { "Pocco81/auto-save.nvim", config = true },
  { "rmagatti/auto-session", config = { auto_session_enabled = true } },
  { "stevearc/overseer.nvim", config = true },
  { "b0o/incline.nvim", config = function() require("incline").setup() end },

  -----------------------------------------------------------------------
  -- 🔧 THE LSP ENGINE (Optimized & Consolidated)
  -----------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "jdtls", "pyright", "gopls", "ts_ls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
          ["gopls"] = function()
            lspconfig.gopls.setup({
              capabilities = capabilities,
              settings = {
                gopls = {
                  completeUnimported = true,
                  usePlaceholders = true,
                  analyses = { unusedparams = true },
                },
              },
            })
          end,
        },
      })
    end,
  },

  -----------------------------------------------------------------------
  -- 🐹 GO SPECIALIST
  -----------------------------------------------------------------------
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = function() require("go").setup() end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()'
  },

  -----------------------------------------------------------------------
  -- ⚡ AUTOCOMPLETION (nvim-cmp)
  -----------------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
}
