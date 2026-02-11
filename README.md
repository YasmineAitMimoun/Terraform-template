# Terraform GCP Infrastructure for Data Engineering

This repository contains Terraform code to provision **Google Cloud Platform (GCP)** resources in a structured and secure manner, following best practices for service accounts, IAM roles, and resource organization. The infrastructure is organized into two stacks, each composed of multiple modules, to ensure modularity, reusability, and separation of concerns.

---

## Stack Overview

### Stack 1 – Project & Service Account Setup

**Purpose:** Set up foundational GCP resources, including projects, folders, and service accounts with appropriate IAM roles.

**Modules:**

#### Project & Folder Module
- Creates a GCP folder and a project within that folder.
- Enables essential APIs:
  - Cloud Storage
  - Compute Engine
  - BigQuery

#### Service Accounts Module
- Creates two service accounts (SAs):

1. **Application SA** – used by VMs to authenticate and access data.  
   **Roles:**
   - `roles/bigquery.dataViewer` – read access to BigQuery datasets
   - `roles/bigquery.jobUser` – execute queries in BigQuery
   - `roles/storage.bucketViewer` – read access to Cloud Storage buckets

2. **Admin SA** – used to create VMs and storage buckets.  
   **Roles:**
   - `roles/compute.instanceAdmin.v1` – create VM instances
   - `roles/iam.serviceAccountUser` – assign service accounts to VMs
   - `roles/storage.admin` – create and manage Cloud Storage buckets

- Grants necessary IAM permissions for each SA to perform its designated tasks.
- Configures impersonation tokens for the Admin SA to execute Stack 2 operations.

**Authentication for Stack 1:** Use your personal GCP user credentials.

---

### Stack 2 – Compute & Storage Deployment

**Purpose:** Deploy data workloads using the service accounts created in Stack 1.

**Modules:**

#### VM Module
- Creates an `e2-micro` VM instance running Debian 12.
- Assigns the **Application SA** (from Stack 1) for workload authentication and data access.

#### Bucket Module
- Creates a Cloud Storage bucket in the **EU region** within the project provisioned in Stack 1.
- Storage class: Standard.

**Authentication for Stack 2:** Uses service account impersonation with the **Admin SA** to provision resources securely.

---

## Usage

### Prerequisites
- Terraform >= 1.5
- GCP project with sufficient permissions
- `gcloud` CLI configured with authentication
- Service accounts enabled for impersonation
