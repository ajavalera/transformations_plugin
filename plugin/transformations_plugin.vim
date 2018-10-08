if !has("python3")
    echo "transformations_plugin will not work without python3 support... Sorry..."
    finish
endif

" Only load the library once.
if exists('g:transformations_plugin')
    finish
endif

" Setting global commodity variables
let g:transformations_plugin_path = expand("<sfile>:p:h")

execute("source " . expand("<sfile>:p:h") . "/transformations_plugin_maps.vim")
execute("source " . expand("<sfile>:p:h") . "/transformations_plugin_functions.vim")

let g:transformations_plugin = 1

