local gitsigns = require("gitsigns")

gitsigns.setup{

  on_attach = function(bufnr)

    local opts = {noremap = true, silent = true}

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>', opts)
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', opts)
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>', opts)
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>', opts)
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', opts)
    map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts)
    map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>', opts)
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

  end
 }
