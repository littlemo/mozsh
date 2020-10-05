default: install

install:
	ln -s -f $(PWD)/zshrc ~/.zshrc
	ln -s -f $(PWD)/zshenv ~/.zshenv
	ln -s -f $(PWD)/zprofile ~/.zprofile

uninstall:
	rm -rf ~/.zshrc
	rm -rf ~/.zshenv
	rm -rf ~/.zprofile

.PHONY: install
