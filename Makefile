.PHONY: update
update:
	git submodule foreach git pull origin master
