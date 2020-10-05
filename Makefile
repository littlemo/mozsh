default: install

install:
	ln -s $(PWD)/zshrc ~/.zshrc
	ln -s $(PWD)/zshenv ~/.zshenv
	ln -s $(PWD)/zprofile ~/.zprofile
	ln -s $(PWD)/oh_my_zsh ~/.oh-my-zsh
	ln -s $(PWD)/zplug ~/.zplug

uninstall:
	rm -rf ~/.zshrc
	rm -rf ~/.zshenv
	rm -rf ~/.zprofile
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.zplug

.PHONY: install
