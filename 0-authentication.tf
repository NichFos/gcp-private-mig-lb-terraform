# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project     = "temp-project-453919"  # Change name of project to whatever project you wish to use in your GCP account
  region      = "us-central1"          # Change region name to region you wish to use i.e., Virginia us-east4, Finland europe-north1 etc. 
  credentials = "key.json"             # Name credentials after project, and put the date that you created it ex., temp-project-453919-060225key.json 
}

