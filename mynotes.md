kind build node-image --image=t0

kind create cluster --image=t0 --config configs/kind_basic.yaml

