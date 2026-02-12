# Terraform GCP Infrastructure

This project uses **Terraform** to provision resources on **Google Cloud Platform (GCP)** in a **modular, secure, and reusable** way.

It follows best practices for:

- Modular architecture  
- IAM least-privilege principles  
- Service account separation  
- Environment isolation  

The infrastructure is organized into:

- **Reusable modules** (`/modules`)
- **Two independent stacks** (`/stacks/bootstrap` and `/stacks/env`)

---


---

# Modules

The `modules/` directory contains reusable building blocks.

## 1️⃣ project

- Creates:
  - GCP Folder
  - GCP Project
- Enables required APIs:
  - Cloud Storage
  - Compute Engine
  - BigQuery

---

## 2️⃣ principals

- Creates service accounts
- Assigns IAM roles
- Configures impersonation permissions

---

## 3️⃣ vm

- Creates a Compute Engine VM
- Configurable machine type
- Attaches a Service Account

---

## 4️⃣ bucket

- Creates a Cloud Storage bucket
- Configurable region
- Configurable storage class

---

# 🏗 Stacks

## 🔹 Stack 1 – `stacks/bootstrap`

**Purpose:** Provision foundational infrastructure.

This stack deploys:

- Folder  
- Project  
- APIs  
- Service Accounts  
- IAM bindings  
- SA impersonation permissions  

### Service Accounts Created

| Service Account | Purpose | IAM Roles |
|-----------------|----------|-----------|
| **Application SA** | Used by workloads (VMs) | `roles/bigquery.dataViewer`, `roles/bigquery.jobUser`, `roles/storage.bucketViewer` |
| **Admin SA** | Provisions infrastructure | `roles/compute.instanceAdmin.v1`, `roles/iam.serviceAccountUser`, `roles/storage.admin` |

### Authentication

Run this stack using your personal GCP credentials:
- `TF_VAR_billing_account` must be set to your **GCP Billing Account ID**.
- `bootstrap_secret.tfvars` must contain the **email address of your GCP user**.

```bash
cd stacks/bootstrap
terraform init
export TF_VAR_billing_account="XXXXXX-XXXXXX-XXXXXX"
terraform apply -var-file="bootstrap.tfvars" -var-file="bootstrap_secret.tfvars"
