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
// Google Cloud Platform setup
variable "credentials_file" {
  description = "GCP project credential"
}

variable "environment" {
  description = "SDLC Infrastructure environment: THIS SETS THE DEPLOYMENT ENVIRONMENT"
  type        = string
  default     = "dev"
}

variable "instance_count" {
  description = "Number of instances to provision."
  type        = map(number)
  default = {
    dev = 2
    stg = 4
    prd = 6
  }
}

variable "instance_name" {
  description = "Name tag for the VM instance." // Needs to be all lower case because it is used for naming services
  type        = string
  default     = "core-tool-test"
}

variable "instance_type" {
  description = "Compute instance type"
  type        = map(string)
  default = {
    dev = "e2-micro"
    stg = "e2-medium"
    prd = "f1.micro"
  }
}

variable "project" {
  description = "GCP project name"
}

variable "project_name" {
  description = "product or project name"
  type        = string
  default     = "Core_tools_team"
}

variable "region" {
  description = "GCP region for deployment"
  type        = string
  default     = "us-central1"
}

variable "tags" {
  type    = list(string)
  default = ["web", "dev"]
}

variable "zone" {
  description = "GCP zone in region for deployment"
}
