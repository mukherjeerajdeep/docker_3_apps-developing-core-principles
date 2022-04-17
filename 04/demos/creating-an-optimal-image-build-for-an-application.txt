# Creating an Optimal Image Build for an Application

This exercise demonstrates how to create an optimal image for an example
software application.

## Assumptions

1. A Docker client is installed locally, that is configured to communicate
   with a local or remote Docker daemon

## Become familiar with app

   Commands you can use:

   find . -maxdepth 2 -type d -exec ls -l "{}" \;
   tree -L 3                                          # if tree is installed
   exa -lTL 3                                         # if exa is installed
   cat package.json

## Use a Sub-optimal Dockerfile

1. Copy Dockerfile.one from solutions directory into the app directory

   Get familiar with what the Dockerfile is trying to achieve by listing its
   content, and looking up any Dockerfile syntax for clarity. Information can
   be found at https://docs.docker.com/engine/reference/builder/.

2. Build an image for the app

   Use the Dockerfile as the basis for building an image for the app with the
   'docker build' command. Give the image a suitable name. Make a note of how
   long the image build took.

3. Check the size of the image

   Use the 'docker images' command to check the size of the image that you just
   built. Mke a note of the image size so that you can compare it with the
   optimizations you will subsequently make.

## Optimize the image for size

1. Create a more optimal Dockerfile

   use the shell's logical AND operator to compress the 'RUN' instructions into
   a single 'RUN' instruction. Think about removing redundant packages and
   removing other redundant content. Save the new Dockerfile as Dockerfile.two.

2. Build an image for the app

   Use the new Dockerfile as the basis for building an image for the app with
   the 'docker build' command. Tag the image with a suitable name. Make a note
   of how long the image build took.

3. Check the size of the image

   Use the 'docker images' command to check the size of the revised image that
   you just built. Make a note of the image size so that you can compare it
   with future versions of the image.

4. Change a source file

   Make a change to the application's source code in order to make a material
   change to the application.

5. Re-build the image

   Use the 'docker build' command to build the image again, and make a note of
   how long the build takes. Is the build quicker this time around? Why? Did
   the app's dependencies get installed again?

## Maximize build cache use

1. Split the COPY instruction

   Change the Dockerfile to split out copying the files that are related to the
   app's dependencies from copying the app's source code.

2. Re-build the image

   Use the 'docker build' command to build the image again, and make a note of
   how long the build takes.

3. Change a source file

   Make a change to the application's source code in order to make a material
   change to the application. Perhaps undo the previous change you made.

5. Re-build the image

   Use the 'docker build' command to build the image again, and make a note of
   how long the build takes. Is the build quicker this time around? Why? Did
   the app's dependencies get installed again?

## Use a multi-stage Dockerfile for the app

1. If you feel confident enough, change the Dockerfile so that it is split into
   multiple stages; a base stage, a dependencies stage, and a stage to serve
   the app. If you need help, refer to Dockerfile.four in the solutions folder.
   Think about which instructions go in which stages, and how content can be
   optimized using the different stages. Also consider if it's beneficial to
   copy content between layers. 

2. Re-build the image

   Use the 'docker build' command to build the image again, and make a note of
   how long the build takes.

3. Check the size of the image

   Use the 'docker images' command to check the size of the revised image that
   you just built. How much smaller is the image compared with the original
   image that you built?

Great work! You've optimized an app's Docker image for size, and seen how to
speed up development time with careful use of Dockerfile instructions.

