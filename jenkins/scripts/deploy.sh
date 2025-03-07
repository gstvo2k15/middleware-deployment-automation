#!/bin/bash
echo "Building and pushing Docker images"
docker login middlewareacr.azurecr.io -u <USERNAME> -p <PASSWORD>

docker build -t middlewareacr.azurecr.io/middleware/tomcat:latest -f Dockerfile-tomcat .
docker push middlewareacr.azurecr.io/middleware/tomcat:latest

docker build -t middlewareacr.azurecr.io/middleware/wildfly:latest -f Dockerfile-wildfly .
docker push middlewareacr.azurecr.io/middleware/wildfly:latest
