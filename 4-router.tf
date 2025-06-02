# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "iowa" {                   # Change name of google_compute_router resource "iowa" to a name of your choosing, ideally corresponding to region that your network is in
  name    = "iowa-router"                                   # Change name of the router to fit with the name of the google_compute_router resource name i.e., virginia-router 
  region  = "us-central1"                                   # Change region name to region your network is housed in i.e., Virginia us-east4, Finland europe-north1
  network = google_compute_network.main.id                  # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2
}


