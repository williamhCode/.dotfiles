local term = require("utils.terminal")

term.set_build_command("python setup.py build_ext --inplace")
term.set_run_command("python %")
