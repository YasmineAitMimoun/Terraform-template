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
