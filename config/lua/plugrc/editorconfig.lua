require("editorconfig").properties.foo = function(bufnr, val, opts)
	opts.root = true
	opts.end_of_line = "cr"
	opts.indent_style = "space"
	opts.indent_size = 4
	opts.insert_final_newline = true
	opts.max_line_length = 79
	opts.trim_trailing_whitespace = true
	if opts.charset and opts.charset ~= "utf-8" then
		error("foo can only be set when charset is utf-8", 0)
	end
	vim.b[bufnr].foo = val
end
