-- import nvim-tree plugin safely
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    return
end

-- import safely
local lib_status, lib = pcall(require, "nvim-tree.lib")
if not lib_status then
    return
end

-- import safely
local view_status, view = pcall(require, "nvim-tree.view")
if not view_status then
    return
end

-- import safely
local collapse_all_status, collapse_all = pcall(require, "nvim-tree.actions.tree-modifiers.collapse-all")
if not collapse_all_status then
    return
end

-- import safely
local openfile_status, openfile = pcall(require, "nvim-tree.actions.node.open-file")
if not openfile_status then
    return
end

-- import safely
local api_status, api = pcall(require, "nvim-tree.api")
if not api_status then
    return
end

-- import safely
local finders_status, finders = pcall(require, "telescope.finders")
if not finders_status then
    return
end

-- import safely
local actions_state_status, actions = pcall(require, "telescope.actions.state")
if not actions_state_status then
    return
end

-- import safely
local sorters_status, sorter = pcall(require, "telescope.sorters")
if not sorters_status then
    return
end

-- import safely
local pickers_status, pickers = pcall(require, "telescope.pickers")
if not pickers_status then
    return
end

-- h | Collapse current containing folder
-- H | Collapse Tree
-- l | Open node if it is a folder, else edit the file and close tree
-- L | Open node if it is a folder, else create vsplit of file and keep cursor focus on tree

local function collapse_all()
    collapse_all.fn()
end

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        openfile.fn(action, node.link_to)
        view.close() -- Close the tree if file was opened

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
		openfile.fn(action, node.absolute_path)
        view.close() -- Close the tree if file was opened
    end

end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        openfile.fn(action, node.link_to)

    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)

    else
        openfile.fn(action, node.absolute_path)

    end

    -- Finally refocus on tree if it was lost
    view.focus()
end

-- telescope menu which will give you access to several modes

local tree_actions = {
	{
		name = "Create node",
		handler = api.fs.create,
	},
	{
		name = "Remove node",
		handler = api.fs.remove,
	},
	{
		name = "Trash node",
		handler = api.fs.trash,
	},
	{
		name = "Rename node",
		handler = api.fs.rename,
	},
	{
		name = "Fully rename node",
		handler = api.fs.rename_sub,
	},
	{
		name = "Copy",
		handler = api.fs.copy.node,
	},
}

local function tree_actions_menu(node)
	local entry_maker = function(menu_item)
		return {
			value = menu_item,
			ordinal = menu_item.name,
			display = menu_item.name,
		}
	end

	local finder = finders.new_table({
		results = tree_actions,
		entry_maker = entry_maker,
	})

	local default_options = {
		finder = finder,
		sorter = sorter,
		attach_mappings = function(prompt_buffer_number)
			-- On item select
			actions.select_default:replace(function()
				local selection = state.get_selected_entry()
				-- Closing the picker
				actions.close(prompt_buffer_number)
				-- Executing the callback
				selection.value.handler(node)
			end)

			-- The following actions are disabled in this example
			-- You may want to map them too depending on your needs though
			actions.add_selection:replace(function() end)
			actions.remove_selection:replace(function() end)
			actions.toggle_selection:replace(function() end)
			actions.select_all:replace(function() end)
			actions.drop_all:replace(function() end)
			actions.toggle_all:replace(function() end)

			return true
		end,
	}

	-- Opening the menu
	pickers.new({ prompt_title = "Tree menu" }, default_options):find()
end

-- folowing allows you to seach for files in telescope
local function custom_callback(callback_name)
    return string.format(":lua require('plugrc.treeutils').%s()<CR>", callback_name)
end

-- change root  directory to local
local function change_root_to_global_cwd()
    local global_cwd = vim.fn.getcwd(-1, -1)
    api.tree.change_root(global_cwd)
  end


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all", action_cb = collapse_all },
        { key = "<C-m>", action = "tree actions", action_cb = tree_actions_menu },
        { key = "<c-f>", cb = custom_callback "launch_find_files" },
        { key = "<c-g>", cb = custom_callback "launch_live_grep" },
        { key = "<C-c>", action = "global_cwd", action_cb = change_root_to_global_cwd },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
        open_file = {
            quit_on_open = false
        }
  },
})

