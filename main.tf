/* ================================================================================= 
*  Copyright (c) 2024, Bobby Wen, All Rights Reserved 
*  Use of this source code is governed by a MIT-style
*  license that can be found at https://en.wikipedia.org/wiki/MIT_License.
*
*  Project:    Google Cloud Platform (GCP) computer cluster examples 
*  Class:      Terraform GCP IaC file
*  Purpose:    Terraform script to create a compute Cluster 
*  Usage:      terraform (init|plan|apply|destroy)
*  Pre-requisites: Google Cloud Platform project and console access (https://cloud.google.com/docs/get-started), 
*                  Terraform by HashiCorp (https://www.terraform.io/)
*  Beware:     terraform.tfvars file is used to pass environment variable to main.tf.  
*              Sensative information need to be encode to use Terraform's built in base64decode function
* 
*  Developer:  Bobby Wen, Ym9iYnlAd2VuLm9yZwo= (email is base64 encode to prevent file scraping for email addresses)
================================================================================== */
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  required_version = ">= 0.14"
}

provider "google" {
  # description = "GCP project credentials"
  credentials = base64decode(file(var.credentials_file))
  project     = base64decode(var.project)
  region      = var.region
  zone        = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}-${var.environment}"
  machine_type = var.instance_type[var.environment]
  tags         = var.tags
  boot_disk {
    initialize_params {
      # image = "debian-cloud/debian-12"
      image = "ubuntu-1404-trusty-v20160627"
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  # Note, my keys
  metadata = {
    ### Dummy key DEBUG
    # "ssh-keys" = <<EOF
    #   ubuntu:ssh-ed25519 AAAAC4NzaC2lZDI2NTE3AAAAIKUQrAkvAPiKWiV7crHgp3czwdBINaXv9illAEspcWva dev 
    #  EOF

    ### My key DEBUG  
    "ssh-keys" = <<EOF
      ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUQrAkvAPiKWiV8crHgp6czwdBINaXv6illAEspcWva dev 
     EOF
  }
}

resource "google_compute_network" "vpc_network" {
  name = "vpc-network"
}

resource "google_compute_firewall" "rules" {
  project     = base64decode(var.project)
  name        = "gcnet-vpc-rules"
  network     = google_compute_network.vpc_network.name
  description = "Allow SSH and RDP communication from secure locations."
  priority    = 1000
  allow {
    protocol = "tcp"
    ports    = ["22", "3389", ]
  }
  source_ranges = var.ingress_cidr_blocks[var.environment]
}