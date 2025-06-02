# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "aaronmcd-state-files"                # Change current bucket name to name of bucket that you created in your GCP account
    prefix      = "terraform/052025-mig-alb-private"    # Change current prefix name to a prefix name of your choosing 
    credentials = "key.json"                            # Name credentials after project, and put the date that you created it ex., temp-project-453919-060225key.json 
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"                                # Optional, change version to version you wish to use ex., verison = "~> 5.0"
    }

    # tls = {
    #   source  = "hashicorp/tls"
    #   version = "~> 4.0"
    # }
  }
}

