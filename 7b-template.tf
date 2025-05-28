# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template
resource "google_compute_region_instance_template" "app" {
  name         = "app-template-terraform"
  description  = "This template is used to clone lizzo"
  region       = google_compute_subnetwork.hqinternal.region
  # or write region argument statically as
  # region = "us-central1"
  machine_type = "e2-medium"


  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.hqinternal.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}

