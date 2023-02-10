local lsp = require("lsp-zero")

-- lsp.preset("recommended")
lsp.set_preferences({
	suggest_lsp_servers = false,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = " ",
		warn = "",
		hint = "ﴞ ",
		info = " ",
	},
})

lsp.ensure_installed({
	"tsserver",
	"html",
	"cssls",
	"tailwindcss",
	"sumneko_lua",
	-- 'rust_analyzer',
})

lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
cmp_mappings["<S-Tab>"] = nil
cmp_mappings["<CR>"] = nil

local lspkind = require("lspkind")

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	formatting = {
		format = lspkind.cmp_format(),
	},
})

local keymap = vim.keymap

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- set keybinds
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	end

	-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	-- vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
	--
	-- -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	-- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

-- Extra config
-- diagnostics
-- local sign = function(opts)
-- 	vim.fn.sign_define(opts.name, {
-- 		texthl = opts.name,
-- 		text = opts.text,
-- 		numhl = "",
-- 	})
-- end
--
-- sign({ name = "DiagnosticSignError", text = "✘" })
-- sign({ name = "DiagnosticSignWarn", text = "▲" })
-- sign({ name = "DiagnosticSignHint", text = "⚑" })
-- sign({ name = "DiagnosticSignInfo", text = "" })
--
-- vim.diagnostic.config({
-- 	virtual_text = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- 	underline = true,
-- 	severity_sort = true,
-- 	float = {
-- 		focusable = false,
-- 		style = "minimal",
-- 		border = "rounded",
-- 		source = "always",
-- 		header = "",
-- 		prefix = "",
-- 	},
-- })
--
