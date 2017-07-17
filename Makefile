clean:
	$(RM) *~

blog:
	bundle exec jekyll serve
	open http://localhost:4000

push:
	git add .
	git commit -m "default Makefile commit"
	git push -u origin master