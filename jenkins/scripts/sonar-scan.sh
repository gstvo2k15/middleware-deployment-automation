#!/bin/bash
echo "Ejecutando análisis en SonarQube..."
mvn sonar:sonar \
  -Dsonar.projectKey=middleware-k8s \
  -Dsonar.host.url=$SONAR_SERVER \
  -Dsonar.login=$SONAR_TOKEN
