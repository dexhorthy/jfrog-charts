### one time ###

gcloud container clusters create --preemptible dex-yalla-cluster --machine-type=n1-standard-2
gcloud container clusters resize dex-yalla-cluster --num-nodes=1
helm dependecy update




### demo ###

kubectl get node

cat demo-resources/external-postgres.yaml

kubectl get pod -n external-postgres

psql -h localhost -p 5432 -U yalla_user --password \postgres
select VERSION();

open https://github.com/dexhorthy/jfrog-charts/tree/add-troubleshoot/stable/artifactory-oss
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory/values-medium.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory/values-large.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory-oss/preflight-large.yaml
open https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml

kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml

open https://troubleshoot.sh/docs/analyze/node-resources/
open https://troubleshoot.sh/docs/collect/
gcloud container clusters resize dex-yalla-cluster --num-nodes=4
kubectl get node

kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml
kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-large.yaml
kubectl preflight --format=json --interactive=false https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-large.yaml


cat demo-resources/values-1.yaml

kubectl create namespace artifactory-oss
helm upgrade --install artifactory-oss . -f demo-resources/values-1.yaml --namespace artifactory-oss

kubectl get pod
kubectl -n artifactory-oss get pod
kubectl logs artifactory-oss-0
kubectl -n artifactory-oss logs artifactory-oss-0

kubectl -n artifactory-oss logs artifactory-oss-0 | grep 'FATAL: password authentication failed for user'

kubectl support-bundle https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/support-bundle.yaml
rm -r support-bundle-*

cat demo-resources/values-2.yaml
helm upgrade --install artifactory-oss . -f demo-resources/values-2.yaml --namespace artifactory-oss
kubectl -n artifactory-oss get pod
kubectl -n artifactory-oss delete pod artifactory-oss-0
kubectl -n artifactory-oss get pod
kubectl -n artifactory-oss get svc

kubectl support-bundle https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/support-bundle.yaml
tar xvf support-bundle-*
tree support-bundle-*
tail -n10 support-bundle-*/artifactory-oss/*/*.log | grep -E 'support-bundle.*|$'

cat support-bundle-*/cluster-resources/statefulsets/artifactory-oss.json

cat support-bundle-*/cluster-resources/statefulsets/artifactory-oss.json | tail -n 20

cat support-bundle-*/cluster-resources/statefulsets/artifactory-oss.json | jq '.[] | .status'

#### teardown ####

gcloud container clusters resize dex-yalla-cluster --num-nodes=2
kubectl delete ns artifactory-oss
kubectl delete ns external-postgres

kubectl apply -f demo-resources/external-postgres.yaml

kubectl create namespace artifactory-oss
helm upgrade --install artifactory-oss . -f demo-resources/values-1.yaml --namespace artifactory-oss
rm -r support-bundle-*
kubectl port-forward -n external-postgres svc/postgres 5432:5432
