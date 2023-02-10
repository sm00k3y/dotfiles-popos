local saga = require("lspsaga")

-- saga.init_lsp_saga({
--   -- keybinds for navigation in lspsaga window
--   move_in_saga = { prev = "<C-k>", next = "<C-j>" },
--   -- use enter to open file with finder
--   finder_action_keys = {
--     open = "<CR>",
--   },
--   -- use enter to open file with definition preview
--   definition_action_keys = {
--     edit = "<CR>",
--   },
-- })

saga.setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	-- keybinds for navigation in lspsaga window
	scroll_preview = {
		scroll_down = "<C-j>",
		scroll_up = "<C-k>",
	},
	-- request timeout for finding definitions
	request_timeout = 3000,
	-- use enter to open files in finder in definition
	finder = {
		edit = "<CR>",
	},
	definition = {
		edit = "<CR>",
	},
	-- code_action = {
	--   num_shortcut = true,
	--   keys = {
	--     -- string | table type
	--     quit = "q",
	--     exec = "<CR>",
	--   },
	-- },
	-- diagnostic = {
	-- 	show_code_action = true,
	-- 	show_source = true,
	-- 	jump_num_shortcut = true,
	-- 	keys = {
	-- 		exec_action = "o",
	-- 		quit = "q",
	-- 		go_action = "g",
	-- 	},
	-- },
	symbol_in_winbar = {
		enable = true,
		-- separator = "  ",
		separator = "  ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
})
