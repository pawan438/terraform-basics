# terraform-basics

A modular Terraform project that provisions a Dockerized Nginx container,
built using reusable modules and isolated per-environment workspaces (dev/prod).

## Project structure
erraform-basics/
├── modules/
│   └── docker-container/     # Reusable module: pulls image + runs container
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev.tfvars            # Dev-specific values (port 8080)
│   └── prod.tfvars           # Prod-specific values (port 8081)
├── main.tf                   # Root config: provider + calls the module
├── variables.tf               # Root input variables (with defaults)
├── outputs.tf                  # Root outputs (pulled up from the module)
├── .gitignore                   # Excludes state files and .terraform cache
└── README.md
## How it works

- The `docker-container` module contains the actual resources
  (`docker_image`, `docker_container`) and is reusable across environments.
- The root `main.tf` calls this module once, passing in variables.
- `terraform.workspace` is appended to the container name, so `dev` and `prod`
  get separate containers (`terraform-nginx-dev`, `terraform-nginx-prod`)
  without duplicating any code.
- Environment-specific values (image tag, external port) live in
  `environments/*.tfvars`, keeping the module logic environment-agnostic.

## Prerequisites

- Terraform >= 1.5
- Docker installed and running locally

## Usage

```bash
terraform init

# Create workspaces (one-time setup)
terraform workspace new dev
terraform workspace new prod

# Deploy to dev
terraform workspace select dev
terraform apply -var-file="environments/dev.tfvars"

# Deploy to prod
terraform workspace select prod
terraform apply -var-file="environments/prod.tfvars"
```

## Validating state

```bash
terraform workspace show          # confirm active workspace
terraform state list              # list resources tracked in this workspace's state
docker ps                         # confirm containers match state
```

## Outputs

| Output           | Description                          |
|-------------------|--------------------------------------|
| `container_name`  | Name of the created container        |
| `container_id`    | Docker-assigned container ID         |
| `access_url`      | URL to access the running app        |

## Notes

- Ports: dev uses `8080`, prod uses `8081` (avoids conflicts with services
  already bound to port `80` on the host).
- State files (`terraform.tfstate*`) and `.terraform/` are gitignored —
  never commit real state, since it can contain resource IDs and sensitive data.
