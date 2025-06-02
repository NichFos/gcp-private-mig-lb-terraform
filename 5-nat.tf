# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "iowa" {                      # Change name of google_compute_router_nat resource "iowa" to a name of your choosing, ideally corresponding to region that your network is in
  name   = "iowa-nat"                                              # Change name of the nat to fit with the name of the google_compute_router_nat resource name i.e., virginia-nat
  router = google_compute_router.iowa.name                         # Change the iowa part of google_compute_network.iowa.name to reference the name(s) of your google compute router(s) that you created in file number 4
  region = "us-central1"                                           # Change region name to region your router(s) is housed in i.e., Virginia us-east4, Finland europe-north1 etc

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.hqinternal.id       # Change the hqinternal part of google_compute_subnetwork.hqinternal.id to reference the name(s) of your google compute subnetwork(s) that you created in file number 3
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.iowa.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
resource "google_compute_address" "iowa" {                          # Change name of google_compute_address resource "iowa" to a name of your choosing, ideally corresponding to region that your nat is in
  name         = "iowa-nat"                                         # Change name of the address to fit with the name of the google_compute_router_nat resource name i.e., virginia-nat
  address_type = "EXTERNAL"                                         # Leave as external because we need to have internet access
  network_tier = "PREMIUM"
  region       = "us-central1"                                      # Change region name to region your nat(s) are housed in i.e., Virginia us-east4, Finland europe-north1 etc
}


