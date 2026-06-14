-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>zg", function()
--   local word = vim.fn.expand("<cword>")
--   vim.cmd("normal! zg")
--   vim.notify("Добавлено в ЛОКАЛЬНЫЙ словарь проекта" .. word, vim.log.levels.INFO)
-- end, { desc = "Spell: Add to LOCAL project dict" })
--
-- -- Глобально: временно переключаем spellfile только на глобальные, добавляем слово, возвращаем назад
-- vim.keymap.set("n", "<leader>zG", function()
--   local word = vim.fn.expand("<cword>")
--   local globals = {
--     vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
--     vim.fn.stdpath("config") .. "/spell/ru.utf-8.add",
--   }
--   local before = vim.opt_local.spellfile:get()
--   vim.opt_local.spellfile = globals
--   vim.cmd("silent spellgood " .. word)
--   vim.opt_local.spellfile = before
--   vim.notify("Добавлено в ГЛОБАЛЬНЫЙ словарь: " .. word, vim.log.levels.INFO)
-- end, { desc = "Spell: Add to GLOBAL dict" })
--
-- -- Локально удалить (из проекта)
-- vim.keymap.set("n", "<leader>zd", function()
--   local word = vim.fn.expand("<cword>")
--   vim.cmd("normal! zw")
--   vim.notify("Удалено из ЛОКАЛЬНОГО словаря проекта" .. word, vim.log.levels.WARN)
-- end, { desc = "Spell: Remove from LOCAL project dict" })
--
-- -- Глобально удалить
-- vim.keymap.set("n", "<leader>zD", function()
--   local word = vim.fn.expand("<cword>")
--   local globals = {
--     vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
--     vim.fn.stdpath("config") .. "/spell/ru.utf-8.add",
--   }
--   local before = vim.opt_local.spellfile:get()
--   vim.opt_local.spellfile = globals
--   vim.cmd("silent spellwrong " .. word)
--   vim.opt_local.spellfile = before
--   vim.notify("Удалено из ГЛОБАЛЬНОГО словаря: " .. word, vim.log.levels.WARN)
-- end, { desc = "Spell: Remove from GLOBAL dict" })

-- if vim.g.vscode then
--   vim.keymap.set("n", "<leader>re", function()
--     vim.VSCodeNotify("editor.action.rename")
--   end, { noremap = true, silent = true })
-- end

-- vim.keymap.set({ "n", "v" }, "р", "h")
-- vim.keymap.set({ "n", "v" }, "о", "j")
-- vim.keymap.set({ "n", "v" }, "л", "k")
-- vim.keymap.set({ "n", "v" }, "д", "l")

-- vim.cmd("nmap <leader>h :e ~/.config/nvim/lua/config/keymaps.lua<cr>")
-- -- Save file
-- vim.cmd("nmap <leader>h :w<cr>")
--
-- -- collaps mode
-- vim.cmd("nmap j gj")
-- vim.cmd("nmap k gk")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move lines up in visual selection" })

-- NOTE: For vacode
if vim.g.vscode then
  -- vim.keymap.set("n", "n", "nzzzv")
  -- vim.keymap.set("n", "N", "Nzzzv")
  local opts = { noremap = true, silent = true }
  local mappings = {
    { "n", "w", "cursorWordPartRight" },
    { "n", "b", "cursorWordPartLeft" },
    { "v", "w", "cursorWordPartRightSelect" },
    { "v", "b", "cursorWordPartLeftSelect" },
    { "n", "<leader>re", "editor.action.rename" },
    -- NOTE: search symbol
    { "n", "<leader>ss", "workbench.action.showAllSymbols" },
    -- NOTE: command panel
    { "n", "<leader>sa", "workbench.action.showCommands" },
    -- NOTE: open files
    { "n", "<leader>sf", "workbench.action.quickOpen" },
    -- NOTE: open definition
    { "n", "<leader>vd", "editor.action.peekDefinition" },
    -- NOTE: open implementation
    { "n", "<leader>vi", "editor.action.peekImplementation" },
    -- NOTE: open type definition
    { "n", "<leader>vt", "editor.action.peekTypeDefinition" },
    -- NOTE: additional info
    { "n", "<leader>vh", "editor.action.showHover" },
    -- NOTE: find references
    { "n", "<leader>fr", "references-view.findReferences" },
    -- NOTE: search trigger
    { "n", "<leader>sr", "editor.action.referenceSearch.trigger" },
    -- NOTE: search in file
    { "n", "<leader>ff", "action.find" },
    -- NOTE: find and replace in file
    { "n", "<leader>fr", "editor.action.startFindReplaceAction" },
    -- NOTE: search global
    { "n", "<leader>fg", "workbench.action.findInFiles" },
    -- NOTE: find and replace global
    { "n", "<leader>rg", "workbench.action.replaceInFiles" },
    -- NOTE: replace global
    { "n", "<leader>re", "editor.action.rename" },
    -- NOTE: refactor
    { "n", "<leader>rf", "editor.action.refactor" },
    -- NOTE: quick fix
    { "n", "<leader>qf", "editor.action.quickFix" },
  }

  for _, mapping in ipairs(mappings) do
    local mode, key, command = mapping[1], mapping[2], mapping[3]
    vim.keymap.set(mode, key, function()
      vim.fn.VSCodeNotify(command)
    end, opts)
  end
  -- vim.keymap.set("n", "<leader>re", function () vim.fn.VSCodeNotify("editor.action.rename") end, opts)
end
