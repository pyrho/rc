lua <<EOF
require'bufferline'.setup{
  options = {
    view = "default",
    numbers = "both",
    number_style = "superscript",
    mappings = false,
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict)
      return "("..count..")"
    end,
    separator_style = "slant"
  }
}
EOF
