 ```sh
 export SONOBUOY_TEST_NAMESPACE=sonobuoy-playground 
 kubectl create ns $SONOBUOY_TEST_NAMESPACE
 ```


 ```sh 
 kubectl -n $SONOBUOY_TEST_NAMESPACE apply -k src/test-infra 
 ```

 ```sh 
docker build -t py-k8s-sonobuoy-playground:dirty .
kind load docker-image py-k8s-sonobuoy-playground:dirty
 ```

```
sonobuoy gen plugin \
--name=hello-world \
--image py-k8s-sonobuoy-playground:dirty \
--arg="echo hello world" \
--arg="kubectl cluster-info" > hello-world.yaml
```

```
docker build -t py-k8s-sonobuoy-playground:dirty . \
  && kind load docker-image py-k8s-sonobuoy-playground:dirty    
```

sonobuoy delete && sonobuoy run --skip-preflight --plugin hello-world.yaml 


sonobuoy delete --wait \
  && kubectl apply -k src/test-infra \
  && sonobuoy run --skip-preflight --existing-service-account --service-account-name sonobuoy-test-robot --plugin hello-world.yaml 

sonobuoy delete --wait \
  && kubectl apply -k src/test-infra \
  && sonobuoy run --skip-preflight --wait --plugin hello-world.yaml 

kubectl -n sonobuoy delete pod sonobuoy && sonobuoy run --plugin hello-world.yaml  -skip-preflight

rm -rf results && rm *.tar.gz 
outfile=$(sonobuoy retrieve) && mkdir results && tar -xf $outfile -C results
