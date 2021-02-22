# Run it
This was tested with Docker Desktop for Windows's Kubernetes cluster.
**WARNING: This example will create Cassandra, Kafka, and an ingress controller in a `lagom-k8s` namespace on your Kubernetes cluster!** 
1) Make sure kubectl's context is pointing to a safe Kubernetes cluster (such as Docker Desktop's Kubernetes). 
1) `bash test.sh` This can take a few minutes.
1) `Hello Lagomer!` should appear in the console. You can also go to `http://hello.local.afawfaaw.com/api/hello/:greeter`.
1) Delete the namespace with `kubectl delete namespaces lagom-k8s` when you are done. You can change kubectl's default namespace back with `kubectl config set-context --current --namespace=default`

### TODO:
* Make SBT create the docker image
* Make Cassandra and Kafka settings not hard coded
* Figure out why the helm chart won't recreate pods even with the roll me annotation. Isn't as big an issue if the `latest` tag isn't being use in the pod's image.
* Paramaterize helm chart
* Make hello-stream work
