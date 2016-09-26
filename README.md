[![CircleCI](https://circleci.com/gh/nanshe-org/docker_nanshe_notebook/tree/master.svg?style=shield)](https://circleci.com/gh/nanshe-org/docker_nanshe_notebook/tree/master)
[![](https://badge.imagelayers.io/nanshe/nanshe_notebook:latest.svg)](https://imagelayers.io/?images=nanshe/nanshe_notebook:latest 'Get your own badge on imagelayers.io')

# Purpose

Provides the latest release of `nanshe` and dependencies installed in a supported cluster environment with a working copy of the Jupyter Notebook.

# Building

## Automatic

This repo is part of an automated build, which is hosted on Docker Hub ( <https://hub.docker.com/r/nanshe/nanshe_notebook> ). Changes added to this trigger an automatic rebuild and deploy the resulting image to Docker Hub. To download an existing image, one simply needs to run `docker pull nanshe/nanshe_notebook`.

## Manual

If one wishes to develop this repo, building will need to be performed manually. This container can be built simply by `cd`ing into the repo and using `docker build -t <NAME> .` where `<NAME>` is the name tagged to the image built. More information about building can be found in Docker's documentation ( <https://docs.docker.com/reference/builder> ). Please consider opening a pull request for changes that you make.

# Testing

Only releases of `nanshe` are installed in this repo. `nanshe` is only released if it passes a build and is actively tested in this exact same environment. The container used by this container as a base, `jakirkham/centos_drmaa_conda`, is tested independently. That being said, the test suite is run for the installed release of `nanshe` during the build phase. If it fails, the build phase will be interrupted and the container will not be tagged or released on Docker Hub.

# Usage

Once an image is acquired either from one of the provided builds or manually, the image is designed to provide a pre-configured Jupyter notebook environment. Simply run `docker run -it -p 8888:8888 <NAME>`. This will configure Grid Engine and a number of environment variables useful for maintaining it and starts up the Jupyter notebook. To open the notebook, go to your browser and type `localhost:8888`. If you are using `docker-machine`, get the IP address of the VM from `docker-machine ip <MACHINE>` where `<MACHINE>` is the machine running the container. If some other VM is in use with `docker`, one will need to figure out how to configure networking and port forwarding to access the notebook. At this point, `nanshe` can be imported and run in any way. In the case of an automated build, `<NAME>` is `nanshe/nanshe_notebook`.
