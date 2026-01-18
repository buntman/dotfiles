return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.phpcsfixer,
				null_ls.builtins.diagnostics.twigcs,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.phpcs.with({
					extra_args = {
						"--standard=PSR12",
						"--ignore=Squiz.Commenting.ClassComment,Squiz.Commenting.FunctionComment",
					},
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {}) -- Make sure this is the LSP method
	end,
}
