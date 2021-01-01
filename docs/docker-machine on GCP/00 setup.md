## Docker Macine on GCP

# Reference
https://docs.docker.com/machine/drivers/gce/
and
https://github.com/kubernetes/kubernetes/blob/8725c3bf12cfd3697464136201216fa05dc662d2/build/README.md


```bash
export GOOGLE_APPLICATION_CREDENTIALS=/Users/rommel/.googleAuthPath/k8s-dev-cwxstat.json
KUBE_BUILD_VM=k8s-build
KUBE_BUILD_GCE_PROJECT=k8s-dev-cwxstat

docker-machine create --driver google \
  --google-project ${KUBE_BUILD_GCE_PROJECT} \
  --google-zone us-central1-f \
  --google-machine-type=n1-standard-8 \
  --google-disk-size=50 \
  --google-preemptible=true \
  --google-disk-type=pd-ssd \
  ${KUBE_BUILD_VM}
```

Next run


```bash
# Set up local docker to talk to that machine
eval $(docker-machine env ${KUBE_BUILD_VM})
```


Build cluster

```bash
kind delete cluster
kind create cluster --image=quay.io/mchirico/k8s:v1.20.1 --config configs/kind_basic.yaml

```


Find out what port is being used.  Below, you can see it is **59701**

```bash
docker ps -a
CONTAINER ID   IMAGE                          COMMAND                  CREATED         STATUS         PORTS                       NAMES
6f603ae99714   quay.io/mchirico/k8s:v1.20.1   "/usr/local/bin/entr…"   7 minutes ago   Up 7 minutes                               kind-worker
190878786bfa   quay.io/mchirico/k8s:v1.20.1   "/usr/local/bin/entr…"   7 minutes ago   Up 7 minutes   127.0.0.1:59701->6443/tcp   kind-control-plane

```

```bash


# forward local 59701 to that machine so that rsync works
docker-machine ssh ${KUBE_BUILD_VM} -L 59701:localhost:59701 -N &

```


## Stop

```bash
docker-machine stop ${KUBE_BUILD_VM}
docker-machine rm ${KUBE_BUILD_VM}

```