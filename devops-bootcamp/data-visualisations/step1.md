# Setting up the enviornment for Visualisation

You will now run a Docker container for Jupyter Notebook. Note: this may take up to 3 minutes, because of the size of the container image.

## Run the Jupyter Notebook

Run the Jupyter Notebook container image:

`docker run -p 8888:8888 -d --name jupyter jupyter/scipy-notebook`{{execute}}

### Further prepare the container

To prepare the container we will run a script inside the container to install several Python packages

Run this script to execute these steps:

* copy the script `installPackages.sh` into the container
* copy the script, make the copy executable and then run the script inside the container - this will install several Python packages using pip
* restart the container

`sh prepareVizEnv.sh`{{execute}}

**Notes on what is happening under the covers**
These are the individual steps inside this script. You do not have to execute them - because they are in the *runPrep.sh* script.

First, copy the script into the container
`docker cp installPackages.sh jupyter:/home/jovyan/installPackages.sh`

This will copy the local file prepareContainer.sh into the container's directory `/home/jovyan` as prepareContainerRoot.sh; it will be a root owned file that cannot be run straightaway.

Next, copy the script, make the copy executable and then run the script inside the container:
`docker exec -d jupyter bash -c 'cp ~/installPackages.sh ~/installPackages.sh && chmod +x ~/installPackages.sh'`

Next, run the script inside the container:
`docker exec -d jupyter sh /home/jovyan/installPackages.sh`

Finally restart the docker container
`docker restart jupyter`