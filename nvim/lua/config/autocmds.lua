-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-save on leaving insert mode and when text changes
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})

-- -- Auto import but not working
-- -- FIXME: not working
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.py",
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- -- Для каждого буфера ищем локальный проектный словарь .nvim/spell/project.utf-8.add
-- local function set_project_spellfile()
--   local buf = vim.api.nvim_get_current_buf()
--   local file = vim.api.nvim_buf_get_name(buf)
--   if file == "" then
--     return
--   end
--
--   local cfg_spell_dir = vim.fn.stdpath("config") .. "/spell"
--   local globals = {
--     cfg_spell_dir .. "/en.utf-8.add",
--     cfg_spell_dir .. "/ru.utf-8.add",
--   }
--
--   local dir = vim.fn.fnamemodify(file, ":p:h")
--   -- ищем папку .nvim/spell вверх по дереву
--   local spell_dir = vim.fn.finddir(".nvim/spell", dir .. ";")
--   if spell_dir ~= "" then
--     local local_add = spell_dir .. "/local.utf-8.add"
--     if vim.fn.filereadable(local_add) == 0 then
--       vim.fn.mkdir(spell_dir, "p")
--       vim.fn.writefile({}, local_add)
--     end
--     -- важный момент: локальный файл ДОЛЖЕН быть ПЕРВЫМ, чтобы `zg` писал в него
--     vim.opt_local.spellfile = { local_add, unpack(globals) }
--   else
--     vim.opt_local.spellfile = globals
--   end
-- end
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "DirChanged" }, {
--   callback = set_project_spellfile,
-- })
