# copy the script into the container; note: the resulting file is owned by root and it not executable
docker cp installPackages.sh jupyter:/tmp/installPackages.sh
# copy the script to make it accessible and executable 
docker exec -it jupyter bash -c 'cp /tmp/installPackages.sh ~/installPackages.sh && chmod +x ~/installPackages.sh'
# execute the script inside the container - to install a number of packages
docker exec -it jupyter bash -c './installPackages.sh'
# # restart the docker container
docker restart jupyter
echo 'Restarted Jupyter container'
docker logs jupyter