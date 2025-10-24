-- Neovim Configuration Entry Point
-- ================================
-- This file bootstraps the entire Neovim configuration

-- Load core options and settings
require("options")

-- Load additional keymaps and custom functions
require("keymaps")

-- Initialize lazy.nvim plugin manager
require("lazyvim")