## Overview
This project is intended to provide a fully automated CI/CD pipeline for deploying middleware with Nginx/Apache as a reverse proxy on Kubernetes (OpenStack). It integrates Terraform, Ansible, Docker, Jenkins and ArgoCD to provide scalability and security.

The pipeline is designed to be flexible and easily customizable to suit different environments, applications and use cases. It is built with extensibility in mind, so you can easily add new features, tools or services as needed.

The project is divided into several components:

1. **Terraform**: Infrastructure as Code (IaC) tool for provisioning and managing OpenStack resources.
2. **Ansible**: Configuration management tool for automating software provisioning, configuration and deployment.
3. **Docker**: Containerization platform for building, packaging and running applications in containers.
4. **Jenkins**: Continuous Integration/Continuous Deployment (CI/CD) tool for automating the build, test and deployment process.
5. **ArgoCD**: Continuous Delivery tool for managing and deploying applications on Kubernetes.

Each component plays a specific role in the pipeline and is responsible for a different aspect of the deployment process. Together, they form a powerful and robust system for deploying middleware applications on Kubernetes.

## Architecture
The architecture of the pipeline is based on the following components:

1. **OpenStack**: Cloud platform for provisioning and managing virtual machines and other resources.
2. **Kubernetes**: Container orchestration platform for managing containerized applications.
3. **Nginx/Apache**: Web server software for serving static and dynamic content.
4. **Terraform**: Infrastructure as Code (IaC) tool for provisioning OpenStack resources.
5. **Ansible**: Configuration management tool for automating software provisioning and configuration.
6. **Docker**: Containerization platform for building and running applications in containers.
7. **Jenkins**: CI/CD tool for automating the build, test and deployment process.
8. **ArgoCD**: Continuous Delivery tool for managing and deploying applications on Kubernetes.

The pipeline is designed to be modular and extensible, so you can easily add new components, tools or services as needed. It is built with scalability and security in mind, so you can deploy and manage middleware applications with confidence.

## Features
The pipeline provides the following features:

1. **Infrastructure Provisioning**: Automated provisioning of OpenStack resources with Terraform.
2. **Configuration Management**: Automated configuration

## Example usage

1. **Actual versions**
`ansible-playbook main.yml -i inventory.yml --limit long_term_support --tag apache`

1. **Last releases**
`ansible-playbook main.yml -i inventory.yml --limit latest_release`

3. **Both versions of Ubuntu/Rocky**
`ansible-playbook main.yml -i inventory.yml --limit apache_servers`
