# Using the Builder Pattern

This exercise demonstrates how to make use of the builder pattern to create
Docker images for applications that require a compilation step.

## Assumptions

1. A Docker client is installed locally, that is configured to communicate
   with a local or remote Docker daemon

## Become familiar with app

   Commands you can use:

```text
   cat README.md
   cat mini.go
   cat Dockerfile
```

## Build an image from the Dockerfile

1. Use the `'docker build'` command to build the image, and tag the image with an
   appropriate name.

2. Check and make a note of the image size using the 'docker images' command.

## Test the app

   Use the image you just built to run a container. Don't forget to specify a
   file to edit, which needs to be inside the image already. You could use
   'mini.go' which has been copied into the image during the build, or an OS
   file like '/etc/passwd'.

## Create a Builder Dockerfile

1. Make a copy of the Dockerfile to use as a starting point for authoring an
   image for building the 'mini' binary. Call it `'Dockerfile.build'`.

2. A container that is derived from the image that will be built from your new
   `Dockerfile`, will have the source code for the app bind mounted inside it.
   Alter the Dockerfile to copy just what is needed from the build context to
   deal with the apps dependencies.

3. Redefine the `ENTRYPOINT` instruction to build the binary from the retrieved
   dependencies and mounted source code.

## Build an Image from the Builder Dockerfile

   Use the `'docker build'` command to build the image, and tag the image with an
   appropriate name (maybe 'mini-builder'). Don't forget to use the `'-f'` flag
   because the Dockerfile is called `'Dockerfile.build'`.

## Test the Builder Image

1. Compile the app

   Compile the app using a Builder container derived from the builder image.
   Don't forget to bind mount the the source code into the container at the
   correct location.

2. Check the results

   On the host, make sure that the 'mini' binary is located in the directory
   that was bind mounted into the container. If it's there, you succeeded!

## Create a Dockerfile for the App

   Either create a new Dockerfile (or alter the original Dockerfile), whose
   purpose is just to serve 'micro'. Choose a suitable (small) base image, and
   be sure to copy the binary created by the builder container into the image
   from the build context. The ENTRYPOINT instruction should specify the path
   to the binary.

## Build an Image from the Dockerfile

   Use the 'docker build' command to build the image, and tag the image with an
   appropriate name.

## Test the Image

1. Run a container

   Using the image you just built, run a container to test that it serves the
   'mini' app as expected. You can bind mount a text or source file into the
   container as a target file for editing, if needed.

4. Check the image size

   Check the image size using the 'docker images' command, and satisfy yourself
   that it is smaller in size then the original image built for the app.

Congratulations, you made use of the builder pattern to create an optimized
image for an app authored using a compiled language.
