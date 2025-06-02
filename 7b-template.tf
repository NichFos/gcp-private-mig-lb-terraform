# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template
resource "google_compute_region_instance_template" "app" {        # Change name of google_compute_region_instance_template resource "app" to a name of your choosing, preferably corressponding to region of your subnetwork(s) i.e. "virginia-app-template-terraform"  
  name         = "app-template-terraform"                         # Change name "app-template-terraform" to name of your choosing preferably corressponding to region of your subnetwork(s) i.e. "virginia-app-template-terraform"
  description  = "This template is used to clone vms"
  region       = google_compute_subnetwork.hqinternal.region      # Change the hqinternal part of google_compute_subnetwork.hqinternal.region to reference the name(s) of your google compute subnetwork(s) that you created in file number 3
  # or write region argument statically as
  # region = "" (optional if provider default is set)
  machine_type = "e2-medium"                                      # Optional, change machine type "e2_medium" to a machine of your choosing. Depending on what region your subnet is in, e2 may not be available. Refer to Regions and zones GCP official documentation for available machine types.  


  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.hqinternal.id         # Change the hqinternal part of google_compute_subnetwork.hqinternal.id to reference the name(s) of your google compute subnetwork(s) that you created in file number 3
    /*access_config {
      # Include this section to give the VM an external IP address     
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")                 # If you do not have a startup.sh file, this function will not work
}

