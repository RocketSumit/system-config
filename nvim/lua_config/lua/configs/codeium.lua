require("codeium").setup {
  -- Optionally disable cmp source if using virtual text only
  enable_cmp_source = false,
  virtual_text = {
    enabled = true,

    -- These are the defaults

    -- Set to true if you never want completions to be shown automatically.
    manual = true,
    -- A mapping of filetype to true or false, to enable virtual text.
    filetypes = {
      python = true,
      markdown = false,
    },
    -- Whether to enable virtual text of not for filetypes not specifically listed above.
    default_filetype_enabled = true,
    -- How long to wait (in ms) before requesting completions after typing stops.
    idle_delay = 75,
    -- Priority of the virtual text. This usually ensures that the completions appear on top of
    -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
    -- desired.
    virtual_text_priority = 65535,
    -- Set to false to disable all key bindings for managing completions.
    map_keys = true,
    -- The key to press when hitting the accept keybinding but no completion is showing.
    -- Defaults to \t normally or <c-n> when a popup is showing.
    accept_fallback = nil,
    -- Key bindings for managing completions in virtual text mode.
    key_bindings = {
      -- Accept the current completion.
      accept = "<Tab>",
      -- Accept the next word.
      accept_word = false,
      -- Accept the next line.
      accept_line = false,
      -- Clear the virtual text.
      clear = false,
      -- Cycle to the next completion.
      next = "<M-]>",
      -- Cycle to the previous completion.
      prev = "<M-[>",
    },
  },
  -- Request completions immediately (manual trigger)
  vim.api.nvim_set_keymap(
    "i",
    "<Leader>c",
    [[<Cmd>lua require('codeium.virtual_text').complete()<CR>]],
    { noremap = true, silent = true }
  ),

  -- Request a completion, or cycle to the next if we already have some
  vim.api.nvim_set_keymap(
    "i",
    "<Leader>n",
    [[<Cmd>lua require('codeium.virtual_text').cycle_or_complete()<CR>]],
    { noremap = true, silent = true }
  ),

  -- Complete only after idle_delay has passed with no other calls to debounced_complete()
  vim.api.nvim_set_keymap(
    "i",
    "<Leader>d",
    [[<Cmd>lua require('codeium.virtual_text').debounced_complete()<CR>]],
    { noremap = true, silent = true }
  ),
}
