@ECHO OFF
::
:: This script is just to test the container.
::

set TAG=latest
set IMAGE_NAME={{cookiecutter.iris_image}}:%TAG%

docker run --rm -it --init ^
    -p 51773:51773 -p 52773:52773 ^
    %IMAGE_NAME%