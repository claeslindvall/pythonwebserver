
echo "Stopping all containers"
podman stop $(podman ps -a | grep -v CONTAINER | awk '{ print $1 '})

echo "Removing all containers"
podman rm $(podman ps -a | grep -v CONTAINER | awk '{ print $1 '})

echo "Cleaning up all images"
podman rmi $(podman images | grep -v IMAGE | awk '{ print $3 }')
