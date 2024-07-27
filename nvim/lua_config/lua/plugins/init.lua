return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "easymotion/vim-easymotion",
    tag = "v3.0.1",
    lazy = false,
    config = function()
      -- <Leader>f{char} to move to {char}
      -- vim.api.nvim_set_keymap("n", "<Leader>f", "<Plug>(easymotion-bd-f)", {})
      -- vim.api.nvim_set_keymap("n", "<Leader>f", "<Plug>(easymotion-overwin-f)", {})
      --
      -- -- s{char}{char} to move to {char}{char}
      -- vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", {})
      --
      -- -- Move to line
      -- vim.api.nvim_set_keymap("n", "<Leader>L", "<Plug>(easymotion-bd-jk)", {})
      -- vim.api.nvim_set_keymap("n", "<Leader>L", "<Plug>(easymotion-overwin-line)", {})
      --
      -- -- Move to word
      -- vim.api.nvim_set_keymap("n", "<Leader>w", "<Plug>(easymotion-bd-w)", {})
      -- vim.api.nvim_set_keymap("n", "<Leader>w", "<Plug>(easymotion-overwin-w)", {})

      -- Disable default mappings
      vim.g.EasyMotion_do_mapping = 0

      -- `s{char}{char}{label}`
      -- Need one more keystroke, but on average, it may be more comfortable.
      vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {})

      -- Turn on case-insensitive feature
      vim.g.EasyMotion_smartcase = 1

      -- JK motions: Line motions
      vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', {})
      vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', {})
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
    lazy = false,
  },
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    lazy = true,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "mhartington/formatter.nvim",
    lazy = false,
    config = function()
      require "configs.formatter"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    lazy = false,
    config = function()
      require("lint").linters_by_ft = {
        -- markdown = { "vale" },
        python = { "pylint" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          require("lint").try_lint()

          -- You can call `try_lint` with a linter name or a list of names to always
          -- run specific linters, independent of the `linters_by_ft` configuration
          -- require("lint").try_lint "cspell"
        end,
      })
    end,
  },
  { "folke/neodev.nvim", opts = {} },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()
      require("telescope").load_extension "lazygit"
      vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
      vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
      vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } -- customize lazygit popup window border characters
      vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
      vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

      vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
      vim.g.lazygit_config_file_path = "" -- custom config file path
      -- OR
      vim.g.lazygit_config_file_path = {} -- table of custom config file paths
    end,
  },
}
