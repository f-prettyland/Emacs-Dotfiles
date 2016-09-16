# Emacs-Dotfiles
Personal configuration scripts for the Emacs text editor.

##Install
Assuming your `~/.emacs.d/` directory
```
cd ~/.emacs.d/ && git init . && git remote add origin https://github.com/jac32/Emacs-Dotfiles.git && git pull origin master
```
Then since I am lazy, you need to do a search and replace across all files to replace `jac32` which will refer to some hardcoded file locations. This should only be in three locations:

1. Projectile ignored directory
2. Cargo directory
3. Racer Directory
