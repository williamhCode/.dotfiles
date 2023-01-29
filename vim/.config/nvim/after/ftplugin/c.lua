local term = require("utils.terminal")

term.set_build_command("gcc -Wall -Werror -std=c17 %")
term.set_run_command("./a.out")

-- set indentation to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
