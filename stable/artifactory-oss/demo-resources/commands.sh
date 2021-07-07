### one time ###

gcloud container clusters create --preemptible dex-yalla-cluster --machine-type=n1-standard-2
gcloud container clusters resize dex-yalla-cluster --num-nodes=1
helm dependecy update




### demo ###

kubectl get node

cat demo-resources/external-postgres.yaml

kubectl apply -f demo-resources/external-postgres.yaml

kubectl get pod -n external-postgres

kubectl port-forward -n external-postgres svc/postgres 5432:5432

psql -h localhost -p 5432 -U yalla_user --password \postgres

open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory/values-medium.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory/values-large.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml
open https://github.com/dexhorthy/jfrog-charts/blob/add-troubleshoot/stable/artifactory-oss/preflight-large.yaml

kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml

gcloud container clusters resize dex-yalla-cluster --num-nodes=4
kubectl get node

kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-medium.yaml
kubectl preflight https://raw.githubusercontent.com/dexhorthy/jfrog-charts/add-troubleshoot/stable/artifactory-oss/preflight-large.yaml

cat demo-resources/values-1.yaml

helm install --upgrade artifactory-oss . -f demo-resources/values-1.yaml


#### teardown ####

gcloud container clusters resize dex-yalla-cluster --num-nodes=2
kubectl delete ns external-postgres
