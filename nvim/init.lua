local path = vim.fn.expand

vim.o.rtp = path('~/.vim')..','..vim.o.rtp..','..path('~/.vim/after')
vim.cmd 'source ~/.vim/vimrc'
vim.o.shadafile = path("$HOME/.cache/vim/shadafile")

local function fprint(string, ...)
	print(string.format(string, ...))
end

---@param plugin string #must follow the format `username/repository`
local function assert_installed(plugin)
	local _, _, plugin_name = string.find(plugin, [[%S+/(%S+)]])
	local plugin_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/" .. plugin_name
	if vim.fn.empty(vim.fn.glob(plugin_path)) ~= 0 then
		fprint("Couldn't find '%s', cloning new copy to %s", plugin_name, plugin_path)
		vim.fn.system({ "git", "clone", "https://github.com/" .. plugin, plugin_path })
	end
end

assert_installed("wbthomason/packer.nvim")
assert_installed("rktjmp/hotpot.nvim")
assert_installed("Olical/aniseed")
-- assert_installed("Olical/conjure")

if pcall(require, "hotpot") then
	require("hotpot").setup({
		provide_require_fennel = true,
	})
	-- Import neovim configuration
	require("plugins")
else
	print("Unable to load hotpot")
end

require("init")
