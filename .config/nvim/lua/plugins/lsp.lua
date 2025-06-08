return {
  -- Update the gopls configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=consulent" },
            },
          },
        },
      },
    },
  },
}
