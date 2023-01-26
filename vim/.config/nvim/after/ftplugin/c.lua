local term = require("utils.terminal")

term.set_build_command("gcc -Wall -Werror -std=c17 %")
term.set_run_command("./a.out")

