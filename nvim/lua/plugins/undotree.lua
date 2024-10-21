return {
	"mbbill/undotree",
	config = function()
		-- specific keymaps
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

		-- undo history
		vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
		vim.opt.undofile = true
	end,
}
