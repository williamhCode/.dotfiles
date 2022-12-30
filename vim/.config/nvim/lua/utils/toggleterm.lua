local M = {}

M.build_cmd = function(cmd)
    return cmd .. [[ && echo "build success" || echo "build failed"]]
end

M.exec_command = function(args)
    vim.cmd("wall")
    if type(args) == "string" then
        require("toggleterm").exec(vim.fn.expandcmd(args), vim.v.count, nil, nil, nil, nil, nil)
    else
        require("toggleterm").exec(vim.fn.expandcmd(args.cmd), vim.v.count, nil, nil, nil, nil, args.open)
    end
end

return M
