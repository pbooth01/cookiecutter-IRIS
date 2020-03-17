#!/bin/bash

docker run --rm -t -i --name cookiecutter-iris -v $PWD/generated_projects/:/generated_projects cookiecutter-iris:latest
