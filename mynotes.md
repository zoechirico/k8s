```

kind build node-image --image=t2
kind delete cluster
kind create cluster --image=t2 --config configs/kind_basic.yaml
```

```go
klog.Errorf("Chirico DeletionObserved keys: %+v", rcKey)


docker tag t2 quay.io/mchirico/k8s:t2

docker push quay.io/mchirico/k8s:t2
kind create cluster --image=quay.io/mchirico/k8s:t2 --config configs/kind_basic.yaml


```
![image](https://user-images.githubusercontent.com/755710/103427389-bfc91e00-4b8e-11eb-8e52-f9c8f5c755b7.png)
