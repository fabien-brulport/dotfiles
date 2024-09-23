return {
  'nvim-lua/plenary.nvim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  -- Markdown preview: install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  {
    'f-person/auto-dark-mode.nvim',
    config = function()
      require("auto-dark-mode").setup { update_interval = 1000 }
      require("auto-dark-mode").init()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        background = {
          light = "latte",
          dark = "frappe",
        },
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = { default = true },
  },
  {
    'vimpostor/vim-tpipeline',
    init = function()
      vim.g.tpipeline_autoembed = 0
      vim.g.tpipeline_preservebg = 1
    end
  },
  'akinsho/toggleterm.nvim',
  'stevearc/dressing.nvim',
  'MunifTanjim/nui.nvim',
  'SmiteshP/nvim-navic',
  'towolf/vim-helm',
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory with Oil" },
    }
  },
  {
    'stevearc/quicker.nvim',
    event = "FileType qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    keys = {
      {
        "<leader>q",
        function()
          require("quicker").toggle()
        end,
        desc = "Toggle quickfix",
      },
    },
    opts = {
      keys = {
        {
          ">",
          function()
            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = "Expand quickfix context",
        },
        {
          "<",
          function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context",
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  },
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",                     -- Pin to GitHub releases
    dependencies = {
      "nvim-lua/plenary.nvim",         -- For standard functions
      "MunifTanjim/nui.nvim",          -- To build the plugin UI
      "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
    },
    opts = {
      -- Remote configuration
      remote = {
        app_name = "nvim", -- This directly maps to the value NVIM_APPNAME. If you use any other paths for configuration, also make sure to set this.
        -- List of directories that should be copied over
        copy_dirs = {
          -- What to copy to remote's Neovim config directory
          config = {
            base = "/Users/fbrulport/.dotfiles/neovim/.config/nvim",
            dirs = "*", -- Directories that should be copied over. "*" means all directories. To specify a subset, use a list like {"lazy", "mason"} where "lazy", "mason" are subdirectories}
          }
        }
      },
      client_callback = function(port, workspace_config)
        local cmd = string.format(
          "tmux new-session -ds remote-nvim-%s nvim --server localhost:%s --remote-ui && tmux switch-client -t remote-nvim-%s",
          workspace_config.workspace_id, port, workspace_config.workspace_id)
        vim.fn.jobstart(cmd, {
          detach = true,
          on_exit = function(job_id, exit_code, event_type)
            -- This function will be called when the job exits
            print("Opening tmux session... Client", job_id, "exited with code", exit_code, "Event type:", event_type)
          end,
        })
      end,
    },
    config = true,
  },
}
