# Scripts

| File | Description |
|:----:|:------------|
|**.bash_profile**|*Old* Several useful bash functions, such as prompt coloring, aliasing common options, auto-completion.  Copy file to `~/` and type `source ~/.bash_profile` to load preferences.|
|**.zshrc**|Useful zsh terminal functions, such as prompt coloring and aliasing common options. Copy file to `~/` and type `source ~/.zshrc` to load preferences.|
|**remote.sh**|Mounts a remote file system as a directory for easy file access. Use `[-c]` option to ssh into remote machine after remotely mounting file system. Copy file to `/usr/local/bin` to have function useable across all folders.|

If one does not wish to copy, you may make symbolic links via `ln -s <file1> <link1>`. `file1` MUST be an absolute path, e.g. `/Users/<username>/scripts/remote.sh` instead of `./remote.sh`.