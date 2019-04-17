ZSH
===

Uses [Antibody](https://getantibody.github.io/) for plugin management.

Antibody offers static loading for plugins, the plugins are stored in the
`zsh_plugins.txt` file, exported to a static file via 
`antibody bundle < ~/rc/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh`, and sourced in
the `.zshrc` file via `source ~/.zsh_plugins.sh`.



