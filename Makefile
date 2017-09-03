cwd = $(shell pwd)

watch:
	fswatch -0 -v -o szkoly.adoc | xargs -0 -n 1 -I {} asciidoc --out-file=target/watch.html szkoly.adoc

html: *.adoc
	docker run --rm -v $(cwd):/documents --name asciidoc-to-html asciidoctor/docker-asciidoctor asciidoctor -D /documents/target *.adoc

pdf: *.adoc
	docker run --rm -v $(cwd):/documents --name asciidoc-to-pdf asciidoctor/docker-asciidoctor asciidoctor-pdf -D /documents/target *.adoc