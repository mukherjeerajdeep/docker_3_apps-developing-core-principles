# Consuming Configuration from within a Container

This exercise demonstrates how a containerized application can consume
configuration from the environment at different points in time, as needed.

## Assumptions

1. A Docker client is installed locally, that is configured to communicate
   with a local or remote Docker daemon

## Become familiar with app

   Commands you can use:

   find . -maxdepth 2 -type d -exec ls -l "{}" \;
   tree -L 3                                          # if tree is installed
   exa -lTL 3                                         # if exa is installed
   cat package.json

## Test the Dockerfile

1. Build an image for the app

   Use the provided Dockerfile to build an image for the application. Give the
   image a suitable name.

2. Run a dev container

   Use the image you just built to run a container in 'dev' mode. That means
   specifying the dev script as an argument at the end of the 'docker run'
   command. Check that the container invokes 'nodemon' to control the app's
   execution. Remove the container.

3. Run a prod container

   Using the image again, run a 'prod' container. That means not specifying a
   particular script to run, which will default to the prod script. Check that
   the container's main process is 'node' instead of 'nodemon'. Remove the
   container.

## Create separate images for dev and prod

1. Define build argument for NODE_ENV

   Edit the Dockerfile to add in an environment variable at a suitable location
   that will define the NODE_ENV environment variable. It's to be used with a
   build argument (ENV or ARG)? Give it a default value of 'production'.

2. Build a dev image for the app

   Use the amended Dockerfile and a build argument with a suitable value to
   build a dev image for the application. Give the image a suitable name to
   make it plain that it's the 'dev' image (e.g. todo-dev).

4. Build a prod image for the app

   Use the amended Dockerfile and a build argument with a suitable value to
   build a prod image for the application. Give the image a suitable name to
   make it plain that it's the 'prod' image (e.g. todo-prod). Was it necessary
   to provide a build argument for building the prod image?

5. Check the image sizes

   Use the 'docker images' command to check the size of the 'dev' and 'prod'
   images. The 'prod' image should be smaller in size. Why?

6. Test both images

   Run a container for each of the 'dev' and 'prod' images to make sure that
   they work as expected. Don't forget to use the 'dev' argument when running a
   container derived from the 'dev' image. What happens when you run a
   container derived from the 'prod' image using the argument 'dev'? Why do you
   get an error?

## Persist NODE_ENV variable into a container

1. Get familiar with the entrypoint script

   Check out the docker-entrypoint.sh script located in the build context. See
   how it tests the value of the NODE_ENV variable to determine what gets run.
   Based on its value, it'll be either 'npm run dev' or 'npm run prod'.

2. Add an ENV instruction to the Dockerfile

   Amend the Dockerfile to add an ENV instruction to enable the value of the
   NODE_ENV variable to persist into a derived container. Be sure to use the
   ARG instruction in conjunction with the ENV instruction, so as to be able to
   make use of a build argument for NODE_ENV.

3. Change the ENTRYPOINT intsruction

   Alter the existing ENTRYPOINT instruction so that a container will execute
   the entrypoint script instead of 'npm run'. Don't forget to remove the CMD
   instruction which is now redundant.

4. Test both images

   Run a container for each of the 'dev' and 'prod' images to make sure that
   they work as expected. There is no need to specify any arguments this time,
   as the entrypoint script handles this based on the value of the NODE_ENV
   variable.

## Use configuration in the environment at runtime

1. Get familiar with the app's port configuration

   Take a look at the file './src/index.js', and see how the app assesses
   whether an environment variable called PORT defines a port number, or not.
   If it's not defined, it defaults to port 3000.

2. Use an alternative port
 
   Run a container and specify an alternative port number for the app using an
   environment variable (what s the 'docker run' flag for specifying or
   amending environment variables)? Test out the app to see whether the it can
   consume requests on the new port number.

Good job! You've used configuration in the environment at different points in
the life of the app's definition to nuance it's runtime behavior.
