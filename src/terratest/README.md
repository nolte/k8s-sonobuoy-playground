

 ```sh 
docker build -t terratest-k8s-sonobuoy-playground:dirty .

kind load docker-image terratest-k8s-sonobuoy-playground:dirty
```

```
docker build -t terratest-k8s-sonobuoy-playground:dirty . \
  && kind load docker-image terratest-k8s-sonobuoy-playground:dirty
```

```sh
sonobuoy delete --wait \
  && kubectl apply -k ../test-infra \
  && sonobuoy run --skip-preflight --existing-service-account --service-account-name sonobuoy-test-robot --plugin terra-test.yaml --wait 
```

sonobuoy status

```sh
rm -rf results && rm *.tar.gz 
outfile=$(sonobuoy retrieve) && mkdir -p /tmp/sonobuoy-results/results && tar -xf $outfile -C /tmp/sonobuoy-results/results
```