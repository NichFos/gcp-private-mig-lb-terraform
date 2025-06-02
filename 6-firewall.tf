# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

# Direct SSH Access for devs
# For main VPC
resource "google_compute_firewall" "ssh" {
  name    = "${google_compute_network.main.name}-allow-ssh"                         # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   
  network = google_compute_network.main.name                                        # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2
  #direction = "INGRESS" (not needed as it is a default value- see API documentation)

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]                                                     # Optional, change source range IP address to limit ssh access as needed
}


resource "google_compute_firewall" "web_traffic" {
  name    = "${google_compute_network.main.name}-allow-web-traffic"                  # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   
  network = google_compute_network.main.name                                         # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]                                                      # Do not change as you want to have connectivity to the internet
}

# Lizzo's ping FW rule
resource "google_compute_firewall" "ping" {
  name    = "${google_compute_network.main.name}-allow-ping"                          # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   
  network = google_compute_network.main.name                                          # Change the main part of google_compute_network.main.id to reference the name(s) of your google compute network(s) that you created in file number 2   

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]                                                       # Optional, change to limit IPs that can ping 
}