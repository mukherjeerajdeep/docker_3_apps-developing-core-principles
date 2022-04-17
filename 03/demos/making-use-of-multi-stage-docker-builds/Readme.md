# Making Use of Multi-stage Docker Builds

This exercise demonstrates how to use a multi-stage Dockerfile to separate
build from execution in order to optimize image size. It also shows how stages
can be defined to serve different purposes.

## Assumptions

1. A Docker client is installed locally, that is configured to communicate
   with a local or remote Docker daemon

## Enable BuildKit

1. If the Docker host is the Linux platform, edit the Daemon configuration file
   at '/etc/docker/daemon.json'. If the Docker environment is Docker Desktop,
   open the settings and select 'Docker Engine'. If not already present, insert
   the following line:

   "features": {"buildkit": true},

2. If the Docker environment is the Docker Desktop, click the 'Apply & Restart'
   button. If on Linux, restart the Docker service:

   sudo systemctl restart docker.service

## Become familiar with app environment

   Navigate the app directory, focusing on the Dockerfile. Notice the different
   stages defined in the Dockerfile. Take note of the linter in the build
   context.

   Commands you can use:

   ls -lR   
   cat README.md
   cat mini.go
   cat Dockerfile

## Build a linter image from the Dockerfile

1. Use the 'docker build' command to build the image, using the 'lint' stage
   from the Dockerfile (HINT. use the --target flag). Tag the image with an
   appropriate name. 

2. In the build output, notice how BuildKit has restricted the steps it has
   processed to just those relevant to the 'lint' stage.

3. Check for the presence of the image using the 'docker images' command.

## Lint the app's source code

   Use the image you just built to run a container to lint the source code.
   Remember that the source code needs to be bind mounted into the container,
   as the source files have not been copied into the image.

## Build an image to serve the app

1. Use the 'docker build' command to build the image, and tag the image with an
   appropriate name. There is no need to specify a stage as the build will
   process the Dockerfile for the final, unnamed stage in the Dockerfile.

2. In the build output, notice how BuildKit ignores any steps in the 'lint'
   stage, but processes steps in the 'build' stage as there is a dependency on
   the binary built in the 'build' stage.

3. Check the size of the new image using 'docker images'. Notice how much
   smaller the image is compared with the original.

## Test the Image

   Using the image you just built, run a container to test that it serves the
   'mini' app as expected. You can bind mount a text or source file into the
   container as a target file for editing, if needed.

Well done! You've made use of a multi-stage Dockerfile to separate build from
execution in order to optimize image size. You also used a specific Dockerfile
stage to lint the source code.
