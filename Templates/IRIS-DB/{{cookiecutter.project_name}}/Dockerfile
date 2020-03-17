FROM {{cookiecutter.iris_image}}:{{cookiecutter.image_version}}

LABEL maintainer="Phillip Booth <phillip.booth@intersystems.com>"
# Get Java OpenJDK 1.8 for JDBC and/or Java Gateway, which must run as root user
USER root
RUN apt-get -y update && \
    apt-get install --no-install-recommends -y openjdk-8-jre-headless ca-certificates-java && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Going back to irisowner now
USER irisowner

# Name of the project folder ex.
ARG IRIS_PROJECT_FOLDER_NAME={{cookiecutter.project_name}}-project-src

# Adding source code that will be loaded by the installer
ADD --chown=irisowner:irisuser ./${IRIS_PROJECT_FOLDER_NAME}/ $IRIS_APP_SOURCEDIR

# Adding zpm.xml file necessary for package manager install
ADD --chown=irisowner:irisuser https://pm.community.intersystems.com/packages/zpm/latest/installer /tmp/packagemanager/zpm.xml

# Install sourcecode into IRIS instance.
RUN $ISC_PACKAGE_INSTALLDIR/demo/irisdemoinstaller.sh

HEALTHCHECK --interval=5s CMD /irisHealth.sh || exit 1