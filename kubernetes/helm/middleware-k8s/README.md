# Middleware Kubernetes Deployment

This project manages the migration of middleware to Kubernetes with:
- Helm Charts for Nginx, Apache, Tomcat, JBoss, WebLogic
- Ingress Nginx and MetalLB for traffic management
- Automated deployment with ArgoCD and Jenkins
- Monitoring with Prometheus, Grafana and Loki
- SSL Certificates with Let's Encrypt

## Installation
1. Deploy Ingress Nginx and MetalLB
2. Apply the Helm Charts
3. Configure ArgoCD and Jenkins
4. Configure monitoring

Example:
```sh
kubectl apply -f manifests/metallb-config.yaml
kubectl apply -f manifests/ingress.yaml
helm install tomcat charts/tomcat-chart/
```
