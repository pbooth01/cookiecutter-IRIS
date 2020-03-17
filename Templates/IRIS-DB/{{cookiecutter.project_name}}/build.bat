@ECHO OFF

set IRIS_PROJECT_FOLDER_NAME={{cookiecutter.project_name}}-project-src
set TAG=latest
set IMAGE_NAME={{cookiecutter.iris_image}}:%TAG%

docker build --build-arg IRIS_PROJECT_FOLDER_NAME=%IRIS_PROJECT_FOLDER_NAME% --force-rm -t %IMAGE_NAME% .