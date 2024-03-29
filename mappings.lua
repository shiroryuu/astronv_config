-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- local utils = require "user.utils"
local astro_utils = require "astronvim.utils"
local mappings = {
  -- first key is the mode
  n = {
    -- disable default bindings
    ["<C-s>"] = false,
    ["<C-q>"] = false,
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>uU"] = { "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
  },
  i = {
    -- ["<tab>"] = {"", desc="Bringing back tab"}
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line/block Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line/block Up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

return mappings
