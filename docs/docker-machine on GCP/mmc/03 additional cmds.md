
Suppose we have the following:

```bash
clausewitz:k8s rommel$ k get service

NAME          TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                        AGE
details       ClusterIP      10.96.65.19    <none>         9080/TCP                       35h
kubernetes    ClusterIP      10.96.0.1      <none>         443/TCP                        35h
nginx         LoadBalancer   10.96.129.46   172.18.1.129   80:30571/TCP,15090:31646/TCP   5m6s
productpage   ClusterIP      10.96.47.232   <none>         9080/TCP                       35h
ratings       ClusterIP      10.96.120.36   <none>         9080/TCP                       35h
reviews       ClusterIP      10.96.63.85    <none>         9080/TCP                       35h


```


We can forward the service


```bash
kubectl port-forward service/simpleservice 8080:80

```