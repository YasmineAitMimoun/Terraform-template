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

architecture:
  stack1_project_service_accounts:
    description: "Project and Service Accounts"
    deployed_by: "Personal User"
    resources:
      gcp_folder:
        projects:
          gcp_project:
            apis_enabled:
              - cloud_storage
              - compute_engine
              - bigquery
            service_accounts:
              app_service_account:
                permissions:
                  - roles/bigquery.dataViewer
                  - roles/bigquery.jobUser
                  - roles/storage.bucketViewer
              admin_service_account:
                permissions:
                  - roles/compute.instanceAdmin.v1
                  - roles/iam.serviceAccountUser
                  - roles/storage.admin
                can_impersonate:
                  - app_service_account

  stack2_vm_bucket:
    description: "VMs and Cloud Storage Buckets"
    deployed_by: "Admin SA from Stack 1 (impersonation)"
    resources:
      gcp_project: "Created in Stack 1"
      vm:
        name: "debian-12-e2-micro"
        service_account: "app_service_account"
      cloud_storage_bucket:
        region: "EU"
        storage_class: "Standard"

deployment_flow:
  - step: 1
    action: "Personal User deploys Stack 1"
    result: "Project + Service Accounts created"
  - step: 2
    action: "Admin SA from Stack 1 impersonates to deploy Stack 2"
    result: "VM + Bucket created"
  - step: 3
    action: "App SA is used by VM"
    result: "Access BigQuery and Cloud Storage"
