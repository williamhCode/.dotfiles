local M = {}

M.resolve_spaces = function(str)
    return string.gsub(str, "%s", "\\ ")
end

return M
