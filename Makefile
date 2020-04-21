NAME=JSON2FS
VERSION=0.0.2

all::
	@echo "make install deinstall edit backup git change push pull"

requirements::
	sudo apt -y install libfuse-dev 
	sudo cpan Fuse JSON Digest::SHA

install::
	cp json2fs ~/bin/

deinstall::
	rm -f json2fs ~/bin/

backup::
	cd ..; tar cfvz ~/Backup/${NAME}-${VERSION}.tar.gz ${NAME}; scp ~/Backup/${NAME}-${VERSION}.tar.gz backup:Backup;

edit::
	dee4 json2fs Makefile README.md LICENSE

git::
	#git remote add origin git@git:${NAME}
	#git remote add origin git@github.com:Spiritdude/${NAME}.git
	git remote set-url origin git@github.com:Spiritdude/${NAME}.git
        
change::
	git commit -am "..."

push::
	git push -u origin master

pull::
	git pull
