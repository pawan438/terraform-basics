# Terraform Basics

A beginner-friendly Terraform project that provisions a Docker container (Nginx) using Infrastructure as Code.

## What is Infrastructure as Code (IaC)?

Infrastructure as Code means managing and provisioning infrastructure (servers, containers, networks, etc.) using configuration files instead of manually clicking through a UI or running one-off commands.

Instead of manually running `docker pull` and `docker run` every time, you write down *what* you want in a file, and a tool (Terraform) figures out *how* to make that happen. This gives you:

- **Consistency** – the same config always produces the same result
- **Version control** – infrastructure changes can be tracked in Git, just like code
- **Repeatability** – easy to recreate the same setup on another machine
- **Documentation** – the config file itself documents your infrastructure



