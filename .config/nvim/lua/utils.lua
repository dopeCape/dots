local telescope = require "telescope.builtin"
local m = {}
local obsi_vault = "~/obsi-vault/"
local get_dir = function(folder) return obsi_vault .. folder end
local find_files = function(slug)
  telescope.find_files {
    cwd = get_dir(slug),
    prompt_title = slug,
  }
end

m.search_by_title = function()
  telescope.find_files {
    cwd = get_dir "",
  }
end
m.search_by_title_projects = function()
  local slug = "projects"
  find_files(slug)
end

m.search_by_title_quicky = function()
  local slug = "quicky"

  find_files(slug)
end

m.search_by_title_temp = function()
  local slug = "temp"

  find_files(slug)
end

m.search_by_title_perma = function()
  local slug = "perma"

  find_files(slug)
end

m.search_by_title_fun = function()
  local slug = "fun"

  find_files(slug)
end

m.search_daily = function()
  local slug = "daily"

  find_files(slug)
end

return m
