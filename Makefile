watch:
	fswatch -0 -v -o szkoly.adoc | xargs -0 -n 1 -I {} asciidoc szkoly.adoc