local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

comment.setup({
	---Add a space b/w comment and the line
	padding = true,

	---Whether the cursor should stay at its position
	sticky = true,

	---Lines to be ignored while comment/uncomment.
	---Could be a regex string or a function that returns a regex string.
	---Example: Use '^$' to ignore empty lines
	ignore = nil,

	---LHS of toggle mappings in NORMAL + VISUAL mode
	toggler = {
		---Line-comment toggle keymap
		line = "gcc",
		---Block-comment toggle keymap
		block = "gbc",
	},

	---LHS of operator-pending mappings in NORMAL + VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "gc",
		---Block-comment keymap
		block = "gb",
	},

	---LHS of extra mappings
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
	},

	---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
	mappings = {
		---Operator-pending mapping
		---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
		basic = false,
		---Extra mapping
		---Includes `gco`, `gcO`, `gcA`
		extra = false,
		---Extended mapping
		---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = false,
	},

	---Pre-hook, called before commenting the line
	pre_hook = nil,

	---Post-hook, called after commenting is done
	post_hook = nil,
})
