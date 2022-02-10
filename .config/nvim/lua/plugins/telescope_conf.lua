local telescope = require("telescope")
builtin = require("telescope.builtin")

telescope.setup {}

-- KeyMappings
nmap(";f" ,"<CMD> lua builtin.find_files()<CR>")
nmap(";r" ,"<CMD> lua builtin.live_grep()<CR>")
nmap(";b" ,"<CMD> lua builtin.buffers()<CR>")
nmap(";h" ,"<CMD> lua builtin.help_tags()<CR>")
