project_id = "kaggle-infra-exp-0808"
region     = "asia-northeast1"

# GCE
zone             = "asia-northeast1-c"
instance_name    = "instance-kaggle-demo"
machine_type     = "e2-micro"
image            = "ubuntu-os-cloud/ubuntu-2004-lts"
network_name     = "default" # VPC Network name
github_email     = "makabe.takayoshi1117@gmail.com"
github_user_name = "takayoshi-makabe"
kaggle_username  = "spidermandance" # Your Kaggle username

# GCE & Network
instance_count = 2

# Network
static_ip_name = "static-ip-kaggle-demo"

# GCS
tf_state_bucket_name    = "tf-state-kaggle-infra-exp-0808"
digger_bucket_name      = "digger-bucket-kaggle-infra-exp-0808"
competition_bucket_name = "competition-bucket-kaggle-infra-exp-0808"
location                = "ASIA"

# Github Actions
github_repo_name = "kaggle-infrastructure"
