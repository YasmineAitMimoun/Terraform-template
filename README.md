# 🌐 Terraform GCP Infrastructure

This project uses **Terraform** to provision resources on **Google Cloud Platform (GCP)** in a **modular, secure, and reusable** way.  
It follows best practices for **service accounts**, **IAM roles**, and resource organization.

The infrastructure is organized into **2 stacks** to separate foundational setup from workload deployment.

---

## 📦 Stack Overview

### **Stack 1 – Project & Service Account Setup**

**Purpose:** Create the GCP foundations: projects, folders, and service accounts with appropriate IAM roles.

#### Modules

**1️⃣ Project & Folder Module**
- Creates a **GCP folder** and a **project** within it.
- Enables essential APIs:
  - Cloud Storage
  - Compute Engine
  - BigQuery

**2️⃣ Service Accounts Module**
- Creates **2 service accounts**:

| Service Account | Purpose | IAM Roles |
|-----------------|--------|-----------|
| **Application SA** | Authenticate VMs and access data | `roles/bigquery.dataViewer`, `roles/bigquery.jobUser`, `roles/storage.bucketViewer` |
| **Admin SA** | Create VMs and buckets | `roles/compute.instanceAdmin.v1`, `roles/iam.serviceAccountUser`, `roles/storage.admin` |

- Configures necessary **IAM permissions**.
- Enables **impersonation** of the Admin SA for Stack 2 operations.

> 🔑 **Stack 1 Authentication:** Use your personal GCP credentials.

---

### **Stack 2 – Compute & Storage Deployment**

**Purpose:** Deploy data workloads using the service accounts created in Stack 1.

#### Modules

**1️⃣ VM Module**
- Creates an **e2-micro** VM running Debian 12.
- Assigns the **Application SA** for authentication and data access.

**2️⃣ Bucket Module**
- Creates a **Cloud Storage bucket** in the **EU region**.
- Storage class: Standard.

> 🔑 **Stack 2 Authentication:** Uses **Admin SA impersonation** for secure resource provisioning.

---

## ⚙️ Prerequisites

- Terraform >= 1.5  
- GCP account with sufficient permissions  
- `gcloud` CLI configured for authentication  

