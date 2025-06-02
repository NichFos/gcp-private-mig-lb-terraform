# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {                     # Change name of google_compute_network resource "main" to a name of your choosing
  name                            = "main"                     # Change name of the network to fit with the name of the google_compute_network resource name 
  routing_mode                    = "REGIONAL"                 # Optional, change routing mode to global if you are trying to create a global google network
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false

}


