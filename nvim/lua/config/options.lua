-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true

vim.g.lazyvim_python_ruff = "ruff"

vim.opt.scrolloff = 15
vim.opt.colorcolumn = "80,120"

vim.opt.spell = true
vim.opt.spelllang = { "en", "ru" }
vim.opt.spelloptions = "camel,noplainbuffer"

-- Включаем отображение невидимых символов
vim.opt.list = true

-- Настраиваем, какими именно символами они будут отображаться
vim.opt.listchars = {
  space = "·",      -- Точка для обычных пробелов
  tab = "<>",       -- Точка для табуляции (первый символ — точка, остальные — пробелы)
  trail = "×",      -- Крестик для лишних пробелов в конце строки (удобно видеть ошибки)
  nbsp = "␣",       -- Символ для неразрывных пробелов - не знаю когда встречается тестирую
  -- multispace = "·", -- Точки появятся только там, где больше одного пробела подряд
  -- leadmultispace = "· ", -- Точки только в отступах в начале строки
}

-- NOTE: for correct root project tree with git worktree
vim.g.root_spec = {
  { ".git", "pyproject.toml", "flake.nix", "Makefile" },
  "lsp",
  "cwd"
}

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "python" },
--   callback = function()
--     vim.opt_local.spell = true
--     vim.opt_local.spelllang = { "en", "ru" }
--     vim.opt.spelloptions = "camel,noplainbuffer"
--     vim.api.nvim_set_hl(0, "SpellCap", { fg = "NONE", bg = "NONE", underline = false })
--   end,
-- })

-- vim.opt.spellfile = {
--   vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
--   vim.fn.stdpath("config") .. "/spell/ru.utf-8.add",
-- }

-- local local_spell = vim.fn.getcwd() .. "/.nvim/spell/local.utf-8.add"
-- if vim.fn.filereadable(local_spell) == 1 then
--   vim.opt.spellfile:append(local_spell)
-- end

-- -- Создаём файлы глобальных словарей на всякий случай
-- local cfg_spell_dir = vim.fn.stdpath("config") .. "/spell"
-- vim.fn.mkdir(cfg_spell_dir, "p")
-- for _, f in ipairs({ "en.utf-8.add", "ru.utf-8.add" }) do
--   local p = cfg_spell_dir .. "/" .. f
--   if vim.fn.filereadable(p) == 0 then
--     vim.fn.writefile({}, p)
--   end
-- end
--
-- -- Глобальные словари по умолчанию
-- local local_cfg_spell_dir = vim.fn.getcwd() .. "/.nvim/spell/"
-- vim.opt.spellfile = {
--   local_cfg_spell_dir .. "/local.utf-8.add",
--   cfg_spell_dir .. "/en.utf-8.add",
--   cfg_spell_dir .. "/ru.utf-8.add",
-- }

-- NOTE: for fast work
vim.opt.updatetime = 50
-- NOTE: clipboard
vim.opt.clipboard = "unnamedplus"
-- NOTE: Search ignore case for vscode
vim.opt.ignorecase = true
-- NOTE: disable "ignore" option if the search pattern contains upper case characters for vscode
vim.opt.smartcase = true
