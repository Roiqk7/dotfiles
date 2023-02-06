-- import safely
local lib_status, lib = pcall(require, "nvim-tree.lib")
if not lib_status then
    return
end

-- import safely
local openfile_status, openfile = pcall(require, "nvim-tree.actions.node.open-file")
if not openfile_status then
    return
end

-- import safely
local actions_status, actions = pcall(require, "telesope.actions")
if not actions_status then
    return
end

-- import safely
local action_state_status, action_state = pcall(require, "telescope.actions.state")
if not action_state_status then
    return
end

local M = {}

local view_selection = function(prompt_bufnr, map)
  actions.select_default:replace(function()
    actions.close(prompt_bufnr)
    local selection = action_state.get_selected_entry()
    local filename = selection.filename
    if (filename == nil) then
      filename = selection[1]
    end
    openfile.fn('preview', filename)
  end)
  return true
end

function M.launch_live_grep(opts)
  return M.launch_telescope("live_grep", opts)
end

function M.launch_find_files(opts)
  return M.launch_telescope("find_files", opts)
end

function M.launch_telescope(func_name, opts)
  local node = lib.get_node_at_cursor()
  local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
  local basedir = is_folder and node.absolute_path or vim.fn.fnamemodify(node.absolute_path, ":h")
  if (node.name == '..' and TreeExplorer ~= nil) then
    basedir = TreeExplorer.cwd
  end
  opts = opts or {}
  opts.cwd = basedir
  opts.search_dirs = { basedir }
  opts.attach_mappings = view_selection
  return require("telescope.builtin")[func_name](opts)
end

return M
