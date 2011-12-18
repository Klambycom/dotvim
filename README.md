My .vim
=======

Installation
------------

Download:

	git clone git://github.com/klambycom/dotvim.git

Install plugins:

	cd ~/.vim
	git submodule init
	git submodule update

Create symlink:

	ln -s ~/.vim/vimrc ~/.vimrc

Adding Plugin Bundles
---------------------

	cd ~/.vim
	git submodule add https://github.com/tpope/vim-markdown.git bundle/markdown

Removing Plugin Bundles
-----------------------

1. Delete the relevant line from the `.gitmodules` file.
2. Delete the relevant section from `.git/config`.
3. Run `git rm --cached path_to_submodule` (no trailing slash).
4. Commit and delete the now untracked submodule files.

(via [Stackoverflow](http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule))

Plugins that I use
------------------

* [snipMate](https://github.com/msanders/snipmate.vim)
* [Zencoding](https://github.com/mattn/zencoding-vim)
* [NERD_Tree](https://github.com/vim-scripts/The-NERD-tree)
* [Surround](https://github.com/tpope/vim-surround)
* [Gundo](https://github.com/sjl/gundo.vim)
* [SuperTab](https://github.com/ervandew/supertab)
* [Eclim](http://eclim.org/) (must be installed separately)
* [Vim-scala](https://github.com/derekwyatt/vim-scala)

Useful links
------------

[Vim Casts](http://www.vimcasts.org/)

[Git Submodules: Adding, Using, Removing, Updating](http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating/)
