/*
This file is for testing whether your VM templates will work with the desired network, subnetwork, firewall, and routing configurations in
files 2, 3, 4, 5, and 6
*/






# resource "google_compute_instance" "sample-vm" {    # Change resource name of google_compute_instance to a name of your choosing i.e. "test-vm"
#   name         = "public-iowa-sample-vm"            # Change name of vm to a name of your choosing, corresponding to a region in one of your subnetworks i.e., "public-iowa-test-vm"
#   machine_type = "e2-medium"                        # Optional, change machine type "e2_medium" to a machine of your choosing. Depending on what region your subnet is in, e2 may not be available. Refer to Regions and zones GCP official documentation for available machine types.  
#   zone         = "us-central1-a"                    # Change zone name "us-central1-a" to zone in the region availability zone you wish to house your VMs in i.e., "us-east4-a" 


# Note, not all regions have the same amount of availability zones, and not all availability zones are active
# If you wish to check what zones and regions are available run the command gcloud compute zones list 

#   # Create a new disk from an image and set as boot disk
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-12"                       
#     }
#   }

#   # Network Configurations 
#   network_interface {
#     subnetwork = google_compute_subnetwork.hqinternal.name   # Change the hqinternal part of google_compute_subnetwork.hqinternal.name to reference the name(s) of your google compute subnetwork(s) that you created in file number 3    
#     access_config {
#       // Ephemeral public IP
#     }
#   }

#   # Install Webserver using file() function
#   metadata_startup_script = file("./startup.sh")             # If you do not have a startup.sh file, this function will not work

# }