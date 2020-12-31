# k8s
Kubernetes Notes


## Step 1
```bash
sudo ./sudo_k8s_basic_w_istio_setup
```

## Step 2
```bash
make
```

## Step 3
```bash
. setup_istio_in_k8s.sh 
```


## Step 4
```bash

cd codespace:~/workspace/k8s/istio-1.8.1
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml
kubectl apply -f samples/addons

kubectl rollout status deployment/kiali -n istio-system

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

curl -s "http://${GATEWAY_URL}/productpage" | grep -o "<title>.*</title>"

```

## Step 5 
Generate data
```bash
watch curl -s "http://${GATEWAY_URL}/productpage" | grep -o "<title>.*</title>"

```

## Step 6
```bash
istioctl install --set values.global.logging.level=debug
```

## Step 7
```bash
istioctl dashboard kiali
```


<img src=https://user-images.githubusercontent.com/755710/103420613-300f7980-4b66-11eb-9b7b-5febfbd1f787.png width=500 />