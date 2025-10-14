SHELL := /bin/bash
#.ONESHELL:

all: prep-venv clean

prep-venv: 
	-python3 -m venv farmt_env && source farmt_env/bin/activate && python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt  && /bin/bash

clean:
	-rm -rf farmt_env
