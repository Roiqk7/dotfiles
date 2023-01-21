-- import lualine plugin safely
local status, NERDTree = pcall(require, "NERDTree")
if not status then
	return
end

--autocmd VimEnter * NERDTree
