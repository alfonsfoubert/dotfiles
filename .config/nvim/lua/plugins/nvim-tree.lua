return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	version = "*",
    dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }),
		})
	end,
}
