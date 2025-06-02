# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "hqinternal" {             # Change name of google_compute_subnetwork resource "hqinternal" to a name of your choosing
  name                     = "hqinternal"                       # Change name of the subnetwork to fit with the name of the google_compute_subnetwork resource name
  ip_cidr_range            = "10.100.10.0/24"                   # Change current IP cidr range to range of your choosing i.e., 10.80.45.0/24
  region                   = "us-central1"                      # Change region name to region you wish to use i.e., Virginia us-east4, Finland europe-north1
  network                  = google_compute_network.main.id     # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2
  private_ip_google_access = true                               # Optional, you can set private_ip_google_access to false
}

# Regional Proxy-Only Subnet 
# Required for Regional Application Load Balancer for traffic offloading
resource "google_compute_subnetwork" "regional_proxy_subnet" {            # Change name of google_compute_subnetwork resource "regional_proxy_subnet" to a name of your choosing
  name          = "regional-proxy-subnet"                                 # Change name of the subnetwork to fit with the name of the google_compute_subnetwork resource name
  region        = "us-central1"                                           # Change region name to region you wish to use in your regular subnetwork  i.e., Virginia us-east4, Finland europe-north1 etc. 
  ip_cidr_range = "10.100.0.0/24"                                         # Change current IP cidr range to range of your choosing i.e., 10.80.45.0/24. Make sure this value is different from your regular subnetwork.
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose       = "REGIONAL_MANAGED_PROXY"                                # Optional, change purpose to fit your personal/company needs
  network       = google_compute_network.main.id                          # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2
  role          = "ACTIVE"
}