# Middleware Kubernetes Deployment

Este proyecto gestiona la migración de middleware a Kubernetes con:
- Helm Charts para Nginx, Apache, Tomcat, JBoss, WebLogic
- Ingress Nginx y MetalLB para gestión de tráfico
- Despliegue automatizado con ArgoCD y Jenkins
- Monitoreo con Prometheus, Grafana y Loki
- Certificados SSL con Let's Encrypt

## Instalación
1. Desplegar Ingress Nginx y MetalLB
2. Aplicar los Helm Charts
3. Configurar ArgoCD y Jenkins
4. Configurar monitoreo

Ejemplo:
```sh
kubectl apply -f manifests/metallb-config.yaml
kubectl apply -f manifests/ingress.yaml
helm install tomcat charts/tomcat-chart/
```
