# Kaggle Infrastructure

[English](README.md) | [日本語](docs/README.ja.md)

<br />

## Setup GCP Project

1. Prepare to use the gcloud CLI in advance.
   Reference: [Install the gcloud CLI](https://cloud.google.com/sdk/docs/install?hl=ja) [Google Cloud Official]

2. Run the following commands:

```shell
cd setup-gcp-project
make setup-gcp-project \
    GCP_PROJECT_ID=<your_gcp_project_id> \
    BILLING_ACCOUNT_ID=<your_billing_account_id> \
    KAGGLE_KEY=<your_kaggle_api_key> \
    TF_STATE_BUCKET_NAME=<your_tf_state_bucket_name>
```

If you don't know your Billing Account ID, you can check it by running the following command:

```shell
gcloud billing accounts list
```

<br />

## Terraform

1. Set various variables in the `terraform/environments/competition01/terraform.tfvars` file according to your environment.

2. Update the `terraform/environments/competition01/terraform.tf` file to change the tfstate file storage location to the GCS bucket created with the `make` command above. Change the prefix as needed.

```hcl
terraform {
  required_version = ">= 1.6"

  backend "gcs" {
    bucket = "your-state-bucket"  # <- GCS Bucket name
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.30"
    }
  }
}
```

3. Run the following commands:

```shell
gcloud auth application-default login   # GCP authentication (ADC)
cd terraform/environments/competition01
terraform init
terraform plan
terraform apply

# If you want to destroy the resources
terraform destroy
```

<br />

## Terraform CI/CD

You can run Terraform CI/CD using GitHub Actions instead of from a local environment.

1. Create Environments in your GitHub Repository according to your environment.

<img src="docs/img01.png" alt="GitHub Environments" width="400">

2. Set the following values in the Secrets of the Environments:

<img src="docs/img02.png" alt="GitHub Environments Secrets" width="400">

3. When you create a PR, `terraform plan` will be automatically executed, and the results will be displayed in the PR comments.

4. By commenting `digger plan` or `digger apply` in the PR comments, GitHub Actions will execute `terraform plan` or `terraform apply`.

ref: https://github.com/takayoshi-makabe/kaggle-infrastructure/pull/10

<br />

## Docker

1. Clone this repository.
2. Since Docker and Docker Compose are already installed, run the following commands to start the Kaggle container:

```shell
cd docker
docker-compose up -d
```

3. Once connected to the Kaggle container from VSCode, you can execute Python scripts and use Jupyter Notebook.
