ifndef $(GOPATH)
  export GOPATH=/home/codespace/go
  ${shell mkdir -p ${GOPATH}}
endif

ifndef $(GOBIN)
  export GOBIN=${GOPATH}/bin
endif



.PHONY : k8sSource mchiricov1.20

mchiricov1.20:
	kind delete cluster
	kind create cluster --image=quay.io/mchirico/k8s:v1.20.1 --config configs/kind_basic.yaml


k8sSource : v1.20 create
	echo "Building"
	

.PHONY: v1.20
v1.20:
	go get k8s.io/kubernetes || true
	cd $GOPATH/src/k8s.io/kubernetes && git checkout v1.20.1 || git pull
	go get sigs.k8s.io/kind
#     Node image
	kind build node-image --image=v1.20


.PHONY: create
create:
	kind delete cluster
	kind create cluster --image=v1.20 --config configs/kind_basic.yaml
