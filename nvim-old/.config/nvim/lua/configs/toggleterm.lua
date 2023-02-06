local toggleterm = require("toggleterm")
toggleterm.setup({
    open_mapping = "<M-s>j",
    on_stdout = function(term, job, data, name)
        if term:is_open() then
            return
        end

        local str = data[1]
        if string.match(str, "build success[\r\n]") then
            print("Build Success ✅")
        elseif string.match(str, "build failed[\r\n]") then
            print("Build Failed ❌")
        elseif string.match(str, "runtime error[\r\n]") then
            print("Runtime Error ❌")
        end
    end,
    direction = "float",
    float_opts = {
        border = 'rounded'
    },
})
