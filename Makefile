SLIDES := $(patsubst %.slides.md,%.slides.pdf,$(wildcard *.slides.md))
README := README.md

all : $(SLIDES) $(README)

%.slides.pdf : %.slides.md
	pandoc $^ -t beamer --slide-level 2 -o $@
	rm -f README.md
	cat intro.md > README.md
	cat $(wildcard *.slides.md) >> README.md

README.md: intro.md
	rm -f README.md
	cat intro.md > README.md
	cat $(wildcard *.slides.md) >> README.md

clobber :
	rm -f $(SLIDES)
	rm -f $(README)
