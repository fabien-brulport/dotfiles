vim.pack.add({ "https://github.com/amitds1997/remote-nvim.nvim" })

require("remote-nvim").setup({
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
})
