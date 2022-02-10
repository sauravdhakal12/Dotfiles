require('onedark').setup {
  style = "deep",
  transparent = true,
  term_color = true,
  background = "dark",
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- Can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },  
}
require('onedark').load()
