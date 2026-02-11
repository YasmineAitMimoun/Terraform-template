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
┌─────────────────────────────┐
│ GCP Folder │
│ └── GCP Project │
│ ├─ APIs enabled │
│ │ ├─ Cloud Storage │
│ │ ├─ Compute Engine │
│ │ └─ BigQuery │
│ └─ Service Accounts │
│ ├─ App SA │ <-- read access to BigQuery & Storage
│ └─ Admin SA │ <-- creates VMs/buckets, manages App SA via impersonation
└─────────────────────────────┘

Stack 2 – VMs and Buckets
┌─────────────────────────────┐
│ GCP Project (from Stack 1) │
│ ├─ Debian 12 VM (e2-micro) │
│ │ └─ uses App SA │
│ └─ Cloud Storage Bucket │
│ └─ Region: EU, Class: Standard │
└─────────────────────────────┘


**Key principles:**  
- Stack 1 manages critical resources (project, service accounts, APIs).  
- Stack 2 manages application resources (VMs, buckets) using impersonation of the Admin SA.  
- Stacks are independent to simplify versioning and maintenance.

---

## Folder Structure

terraform-gcp-data-infra/
├── README.md
├── stack1_project_sa/
│ ├── main.tf # Project and service account resources
│ ├── variables.tf # Input variables
│ ├── outputs.tf # Outputs (IDs, SA emails)
│ ├── versions.tf # Terraform & provider versions
│ └── modules/
│ ├── project_folder/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── service_accounts/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── stack2_vm_bucket/
│ ├── main.tf # VM and bucket resources
│ ├── variables.tf
│ ├── outputs.tf
│ ├── versions.tf
│ └── modules/
│ ├── vm_instance/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── storage_bucket/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── scripts/
└── bootstrap.sh # Optional utility script for Terraform initialization

