
```bash
# Create ubuntu
kubectl run --rm -i --tty ubuntu --image=ubuntu:latest --restart=Never -- bash -il

# Attach to it later
kubectl exec -it ubuntu -- /bin/bash

kubectl exec -it nginx -- bash

```

apt-get install -y haproxy
apt-get install -y bridge-utils