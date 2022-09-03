if exists("g:neovide")
    " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    let g:neovide_transparency=0.0
    let g:transparency = 0.9
    let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

    let g:neovide_input_macos_alt_is_meta=v:true
endif
