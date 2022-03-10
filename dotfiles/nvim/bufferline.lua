local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none",
		close_command = nil,
		right_mouse_command = nil,
		left_mouse_command = nil,
		middle_mouse_command = nil,
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 25,
		max_prefix_length = 25,
		tab_size = 21,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		custom_filter = false,
		offsets = { { filetype = "NvimTree", text = "Explorer", text_align = "center" } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = { "", "" },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "directory",
	},
})
