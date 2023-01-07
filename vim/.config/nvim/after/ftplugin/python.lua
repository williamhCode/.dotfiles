local set_build_command = require("utils.terminal").set_build_command
local set_run_command = require("utils.terminal").set_run_command

set_build_command("python setup.py build_ext --inplace")
set_run_command("python %")
