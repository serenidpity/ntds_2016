NB  = $(wildcard toolkit/*.ipynb)
NB += $(wildcard algorithms/*.ipynb)

all: test run

run:
	grip README.md --export README.html
	jupyter nbconvert --inplace --execute --ExecutePreprocessor.timeout=120 $(NB)

test:
	python3 check_install.py

install:
	pip3 install --upgrade pip
	pip3 install -r requirements.txt

clean:
	jupyter nbconvert --inplace --ClearOutputPreprocessor.enabled=True $(NB)
	rm -f README.html
	rm -fr data

readme:
	grip README.md
	#pandoc -f markdown_github README.md -s -o README.html

.PHONY: all run test install clean readme