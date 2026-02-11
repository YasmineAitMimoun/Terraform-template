# Terraform GCP Data Infrastructure

## Overview

This repository contains Terraform code to provision a GCP infrastructure for data projects.  

**Objectives:**  
- Create a GCP project with required APIs enabled: Cloud Storage, Compute Engine, BigQuery.  
- Create service accounts to manage VMs and access data.  
- Provision Debian VMs and Cloud Storage buckets for pipelines and data storage.  

The infrastructure is divided into **two stacks**:  
1. **Stack 1 – Project & Service Accounts**  
2. **Stack 2 – VMs & Buckets**

---

## Architecture

Simplified architecture:

Stack 1 – Project and Service Accounts

GCP Folder
 └─ GCP Project
     ├─ APIs Enabled
     │   ├─ Cloud Storage
     │   ├─ Compute Engine
     │   └─ BigQuery
     └─ Service Accounts
         ├─ App Service Account
         │   └─ Permissions: 
         │       - BigQuery Data Viewer
         │       - BigQuery Job User
         │       - Cloud Storage Bucket Viewer
         └─ Admin Service Account
             └─ Permissions:
                 - Compute Instance Admin
                 - IAM Service Account User
                 - Storage Admin
             └─ Can impersonate App SA for resource creation

Stack 2 – VMs and Buckets

GCP Project (from Stack 1)
 ├─ Debian 12 VM (e2-micro)
 │    └─ Uses App SA for authentication
 └─ Cloud Storage Bucket
      └─ Region: EU
      └─ Storage Class: Standard


**Key principles:**  
- Stack 1 manages critical resources (project, service accounts, APIs).  
- Stack 2 manages application resources (VMs, buckets) using impersonation of the Admin SA.  
- Stacks are independent to simplify versioning and maintenance.

---

## Folder Structure

terraform-gcp-data-infra/
├── README.md
├── stack1_project_sa/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── modules/
│       ├── project_folder/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── service_accounts/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
├── stack2_vm_bucket/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── modules/
│       ├── vm_instance/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── storage_bucket/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
└── scripts/
    └── bootstrap.sh

