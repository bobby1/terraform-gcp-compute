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
# credentials_file = "<location of the GCP Credential file encoded using base64 from GCP>"  //base64 encoded JSON file
# project          = "<your GCP project ID>"  //base64 encoded project name
# zone             = "<the zones to deploy the nodes based on your region>"
