# terraform-gcp-compute
This code is a basic demonstration of ways to create Structured Design Life Cycle (SDLC) deployment cloud environments with minimum effort. The code uses terraform to create a Google Cloud Platform (GCP) instance.

Design Principles
Reusable code: The same code base is used for all environment; implementation differences are set based on the environment or tier for the SDLC.

SDLC from the start: Development (dev), Staging (stg) and Production (prd) versions can be to implement for a project by creating different folders at the beginning of a project, and just setting the environment variable in the variables file.

Scalable: the environment setting allows each environment to scale automatically. Development environment use micro server instance (e2.micro) to service a small number of developers, staging environments uses medium server instances (e2.medium) to allow a large audience to test the application. Production environments uses large server instances (f1-micro) to be generally available to the Internet.

** This is an alternative to terraform workspace and does not require workspace setup

Secure: The code show examples of how to secure project credentials, user account and application accessibility based on environments.

** Project credentials and sensitive data can be based 64 encrypted to obfuscate sensitive information.

** Access to the server instances is limited based on the environment. Dev can be configured to only allow developer access. Stg can be configured to only allow corporate user access. Prd can be configured to allow general Internet access.

Easy to use and maintain: All code contains a banner with project, usage, pre-requisite and beware sections. In addition, tags to identify the project, environment and other identifiable information are added where possible.

Pre-requisites
To use this code base, gcloud cli, and Terraform are required to be installed locally on the local host.
gCloud CLI (https://cloud.google.com/cli)
Terraform by HashiCorp (https://www.terraform.io/)

How to use
To create the example environment using Terraform, in the SDLC directory for the environment to deploy, for example, dev

	$ terraform init

	$ terraform fmt

	$ terraform validate

	$ terraform plan

		$ terraform plan -out <filename>  is recommended but not required
	$ terraform apply

		$ terraform apply <filename>  if -out was used

Once the server instance is created, terraform will output the server’s name and IP. You can retrieve this output at any time after creating the instances by running

	$ terraform output

Once you have the new instance DNS name information, connect to the instance to ensure your connection and ssh keys work.

for example:
	ssh ubuntu@ec2-54-92-22-20.compute-1.amazonaws.com and accept the server ssh key into the ssh known-hosts

or

	ssh -o StrictHostKeyChecking=accept-new ubuntu@ec2-54-92-22-20.compute-1.amazonaws.com
to automatically accept the ssh key


If you no longer need the stack, you can clean up the by using $ terraform destroy -auto-approve

Roadmap
Please email me for features and additions you would like to see.

or

Get Involved
Submit a proposed code update through a pull request to the devel branch.
Talk to us before making larger changes to avoid duplicate efforts. This not only helps everyone know what is going on, but it also helps save time and effort if we decide some changes are needed.
Author
Terraform-with-ansible was created by [Bobby Wen] (https://github.com/bobby1) as a primer to Terraform and ansible.

License
MIT License

https://github.com/bobby1/terraform-with-ansible/blob/main/LICENSE


