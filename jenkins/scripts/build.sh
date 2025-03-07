#!/bin/bash
echo "Building Tomcat and WildFly"
mvn clean package -DskipTests
