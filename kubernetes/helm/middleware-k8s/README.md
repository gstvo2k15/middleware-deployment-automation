# Middleware Kubernetes Deployment

This project manages the migration of middleware to Kubernetes, including:
- Helm Charts for Nginx, Apache, Tomcat, JBoss, and WebLogic
- Ingress Nginx and MetalLB for traffic management
- Automated deployment with ArgoCD and Jenkins
- Monitoring with Prometheus, Grafana, and Loki
- SSL Certificates with Let's Encrypt

## Installation

### 1️⃣ Deploy Ingress Nginx and MetalLB
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f manifests/metallb-config.yaml
```

### 2️⃣ Install Cert-Manager and Configure Let's Encrypt
```sh
kubectl create namespace cert-manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
kubectl create secret generic duckdns-api-key --namespace cert-manager --from-literal=token='YOUR_DUCKDNS_TOKEN'
kubectl apply -f manifests/cert-manager.yaml
kubectl apply -f manifests/certificate.yaml
```

### 3️⃣ Apply Ingress Configuration
```sh
kubectl apply -f manifests/ingress.yaml
```

### 4️⃣ Deploy Middleware Services
Create the necessary Kubernetes Services to expose middleware applications:

```sh
kubectl create namespace middleware
kubectl create namespace monitoring

kubectl apply -f manifests/nginx-service.yaml
kubectl apply -f manifests/apache-service.yaml
kubectl apply -f manifests/tomcat-service.yaml
kubectl apply -f manifests/jboss-service.yaml
kubectl apply -f manifests/weblogic-service.yaml
```

Then install the Helm charts for each middleware:
```sh
helm install nginx charts/nginx-chart/
helm install apache charts/apache-chart/
helm install tomcat charts/tomcat-chart/
helm install jboss charts/jboss-chart/
helm install weblogic charts/weblogic-chart/
```

### 5️⃣ Set Up ArgoCD for Automated Deployment
```sh
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f deployment-pipelines/argocd/app.yaml
kubectl get crds | grep applications.argoproj.io
```

### 6️⃣ Configure Monitoring with Prometheus and Grafana
```sh
kubectl create namespace monitoring
kubectl apply -n monitoring -f https://github.com/prometheus-operator/prometheus-operator/releases/latest/download/bundle.yaml
kubectl apply -f monitoring/prometheus-grafana.yaml
kubectl apply -f monitoring/loki.yaml
kubectl get crds | grep servicemonitors.monitoring.coreos.com
```

## Accessing Middleware Services

### Web Middleware (Nginx & Apache):
- [https://nginx.helmgolmolab.duckdns.org](https://nginx.helmgolmolab.duckdns.org)
- [https://apache.helmgolmolab.duckdns.org](https://apache.helmgolmolab.duckdns.org)

### Application Servers:
- [https://tomcat.helmgolmolab.duckdns.org](https://tomcat.helmgolmolab.duckdns.org)
- [https://jboss.helmgolmolab.duckdns.org](https://jboss.helmgolmolab.duckdns.org)
- [https://weblogic.helmgolmolab.duckdns.org](https://weblogic.helmgolmolab.duckdns.org)

Ensure that your `duckdns.org` subdomains are correctly updated with your cluster's IP.

## Verify Deployments
Check if all services are running correctly:
```sh
kubectl get all -A
kubectl describe certificate -A
kubectl get secrets -n cert-manager
kubectl get ingress
```

## Notes
- If using a **private network (VirtualBox, Proxmox, etc.)**, ensure `dns01` validation is used.
- If using a **public IP**, `http01` validation via Ingress Nginx is also possible.
