-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alter2000/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/alter2000/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/alter2000/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/alter2000/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alter2000/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["agila.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/agila.vim",
    url = "https://github.com/nerdypepper/agila.vim"
  },
  ["ayu-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  colorizer = {
    commands = { "ColorHighlight", "ColorClear", "ColorContrast", "ColorSwapFgBg", "ColorToggle", "RGB2Term", "Term2RGB", "HSL2RGB" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/colorizer",
    url = "https://github.com/chrisbra/colorizer"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  gruvbox = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["iron.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/iron.nvim",
    url = "https://github.com/hkupty/iron.nvim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/kotlin-vim",
    url = "https://github.com/udalov/kotlin-vim"
  },
  materialbox = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/materialbox",
    url = "https://github.com/mkarmona/materialbox"
  },
  ["nvim-moonmaker"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/nvim-moonmaker",
    url = "https://github.com/svermeulen/nvim-moonmaker"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/papercolor-theme",
    url = "https://github.com/NLKNguyen/papercolor-theme"
  },
  ["purescript-vim"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/purescript-vim",
    url = "https://github.com/purescript-contrib/purescript-vim"
  },
  ["seoul256.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  tabular = {
    after_files = { "/home/alter2000/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize", "AddTabularPattern", "AddTabularPipeline" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    commands = { "G", "Git", "Ggrep", "GLgrep", "Gclog", "Gllog", "Gcd", "Glcd", "Gedit", "Gsplit", "Gvsplit", "Gtabedit", "Gread", "Gwrite", "Gwq", "Gdiffsplit", "GMove", "GRename", "GDelete", "GRemove", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-game-snake"] = {
    commands = { "VimGameSnake" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-game-snake",
    url = "https://github.com/johngrib/vim-game-snake"
  },
  ["vim-gcov-marker"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-gcov-marker",
    url = "https://github.com/m42e/vim-gcov-marker"
  },
  ["vim-gnupg"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-gnupg",
    url = "https://github.com/jamessan/vim-gnupg"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-ledger"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-ledger",
    url = "https://github.com/ledger/vim-ledger"
  },
  ["vim-mundo"] = {
    commands = { "MundoToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-mustache-handlebars"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-mustache-handlebars",
    url = "https://github.com/mustache/vim-mustache-handlebars"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-nix",
    url = "https://github.com/LnL7/vim-nix"
  },
  ["vim-pandoc"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-pandoc",
    url = "https://github.com/vim-pandoc/vim-pandoc"
  },
  ["vim-pandoc-after"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-pandoc-after",
    url = "https://github.com/vim-pandoc/vim-pandoc-after"
  },
  ["vim-pandoc-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-pandoc-syntax",
    url = "https://github.com/vim-pandoc/vim-pandoc-syntax"
  },
  ["vim-projectionist"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle", "TableModeEnable", "TableModeDisable", "Tableize", "TableModeRealign", "TableAddFormula", "TableEvalFormulaLine", "TableSort" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-waikiki"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/alter2000/.local/share/nvim/site/pack/packer/opt/vim-waikiki",
    url = "https://github.com/fcpg/vim-waikiki"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MundoToggle lua require("packer.load")({'vim-mundo'}, { cmd = "MundoToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gclog lua require("packer.load")({'vim-fugitive'}, { cmd = "Gclog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableEvalFormulaLine lua require("packer.load")({'vim-table-mode'}, { cmd = "TableEvalFormulaLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AddTabularPattern lua require("packer.load")({'tabular'}, { cmd = "AddTabularPattern", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AddTabularPipeline lua require("packer.load")({'tabular'}, { cmd = "AddTabularPipeline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRemove lua require("packer.load")({'vim-fugitive'}, { cmd = "GRemove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableAddFormula lua require("packer.load")({'vim-table-mode'}, { cmd = "TableAddFormula", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gtabedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gtabedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gread lua require("packer.load")({'vim-fugitive'}, { cmd = "Gread", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwq lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwq", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Ggrep lua require("packer.load")({'vim-fugitive'}, { cmd = "Ggrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GLgrep lua require("packer.load")({'vim-fugitive'}, { cmd = "GLgrep", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeEnable lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeDisable lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorHighlight lua require("packer.load")({'colorizer'}, { cmd = "ColorHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorClear lua require("packer.load")({'colorizer'}, { cmd = "ColorClear", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorContrast lua require("packer.load")({'colorizer'}, { cmd = "ColorContrast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableSort lua require("packer.load")({'vim-table-mode'}, { cmd = "TableSort", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RGB2Term lua require("packer.load")({'colorizer'}, { cmd = "RGB2Term", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Term2RGB lua require("packer.load")({'colorizer'}, { cmd = "Term2RGB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HSL2RGB lua require("packer.load")({'colorizer'}, { cmd = "HSL2RGB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GMove lua require("packer.load")({'vim-fugitive'}, { cmd = "GMove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GRename lua require("packer.load")({'vim-fugitive'}, { cmd = "GRename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GDelete lua require("packer.load")({'vim-fugitive'}, { cmd = "GDelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeRealign lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeRealign", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tableize lua require("packer.load")({'vim-table-mode'}, { cmd = "Tableize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorToggle lua require("packer.load")({'colorizer'}, { cmd = "ColorToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VimGameSnake lua require("packer.load")({'vim-game-snake'}, { cmd = "VimGameSnake", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gllog lua require("packer.load")({'vim-fugitive'}, { cmd = "Gllog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gcd lua require("packer.load")({'vim-fugitive'}, { cmd = "Gcd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glcd lua require("packer.load")({'vim-fugitive'}, { cmd = "Glcd", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorSwapFgBg lua require("packer.load")({'colorizer'}, { cmd = "ColorSwapFgBg", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
