

# Steps for Zoe

Note... fill in value for {put int your directory}

```bash

# Make sure to fill in {put int your directory}
export GOOGLE_APPLICATION_CREDENTIALS=/Users/{put int your directory}/.googleAuthPath/zoes-project.json
export KUBE_BUILD_VM=k8s-build-zoe
export KUBE_BUILD_GCE_PROJECT=intrepid-app-299501

# Start computer
docker-machine start ${KUBE_BUILD_VM}

# Set environment
eval $(docker-machine env ${KUBE_BUILD_VM})
docker-machine ssh ${KUBE_BUILD_VM} -L 3050:172.18.1.128:80 -N &
export PORT=$(docker ps --filter "name=kind-control-plane" --format "{{.Ports}}"| sed -e 's/.*://'|sed -e 's/->.*//g')
docker-machine ssh ${KUBE_BUILD_VM} -L ${PORT}:localhost:${PORT} -N &


```