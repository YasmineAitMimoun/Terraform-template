# Terraform GCP Foundation

Ce projet est une **fondation d’infrastructure Google Cloud Platform** construite avec Terraform.
Il a été conçu comme une base **propre, sécurisée et évolutive**, alignée avec les bonnes pratiques d’Infrastructure as Code utilisées en entreprise.

L’objectif est de démontrer une approche professionnelle, avec séparation des responsabilités, gestion IAM rigoureuse, backend distant et préparation CI/CD.

---

## 🎯 Objectifs

* Créer une fondation GCP modulaire et maintenable
* Séparer la configuration de la fondation des environnements applicatifs
* Appliquer des principes de sécurité IAM (least privilege, comptes dédiés)
* Mettre en place un backend Terraform distant pour l’état partagé
* Préparer le projet pour intégration CI/CD

Ce repository sert de **projet vitrine Cloud Data Engineer**.

---

## 🗂 Structure du repository

```
.
├── modules/
│   ├── project/
│   ├── principals/
│   ├── vm/
│   └── bucket/
├── stacks/
│   ├── bootstrap/
│   └── env/
```

### Modules
* **folder** → création d’un dossier GCP
* **project** → création d’un projet GCP + activation des APIs
* **principals** → création d'un service account + donner des droits au SA
* **vm** → création d'une VM Compute Engine
* **bucket** → création d'un bucket cloud Storage

Chaque module est isolé et réutilisable, facilitant la maintenance et l’évolution de l’infrastructure.

---

### Stacks

#### Bootstrap

Initialise la fondation :

  * Création d’un dossier GCP
  * Création d’un projet principal ainsi que d’un projet dédié au backend Terraform (state)
  * Création d’un bucket sur le projet principal ainsi que d’un bucket dans le projet dédié au backend Terraform (state)
  * Activation des APIs essentielles
  * Création de comptes de service pour le projet principal et d’un compte de service dédié au projet backend
  * Attribution des rôles IAM à mon utilisateur ainsi qu’aux comptes de service
  * Configuration de l’impersonation des comptes de service


#### Environnements

Contient les ressources applicatives ou spécifiques (dev, staging, prod).

La séparation Bootstrap / Environnements permet :

* Isolation des responsabilités
* Limitation des risques
* Intégration facile avec CI/CD

---

## 🚀 Déploiement

### Prérequis

* Terraform v1.5.7
* Permissions suffisantes pour créer projets et gérer IAM

Authentification recommandée pour lancer le bootstrap:

```bash
gcloud auth application-default login
```

### Backend distant

Le projet utilise un **backend Terraform sur GCS** pour le state :

* Verrouillage et partage du state entre utilisateurs
* Sécurité et traçabilité
* Prêt pour CI/CD multi-environnements

### Bootstrap

```bash
cd stacks/bootstrap
export TF_VAR_billing_account="XXXXXX-"XXXXXX-"XXXXXX"
terraform init
terraform plan -var-file="bootstrap.tfvars"  -var-file="bootstrap_secret.tfvars" 
terraform apply -var-file="bootstrap.tfvars"  -var-file="bootstrap_secret.tfvars" 
```
bootstrap_secret.tfvars contient la valeur de la variable user_email

### Environnement

```bash
cd stacks/env
terraform init
terraform plan -var-file="dev.tfvars" 
terraform apply -var-file="dev.tfvars" 
```

---

## 🔐 Bonnes pratiques appliquées

### Backend distant & workflow collaboratif pour les states des environnements dev, staging et prod

* Stockage du state sur bucket GCS avec verrouillage
* Versionning activé sur le bucket GCS
* Multi-utilisateur / multi-branches prêt pour CI/CD

### Architecture modulaire

* Modules isolés et réutilisables
* Maintenable et évolutif
* Evite les fichiers Terraform monolithiques

### Séparation Bootstrap / Environnements

* Bootstrap = fondation & IAM
* Environnements = ressources applicatives
* Limite les risques et clarifie les responsabilités

### Sécurité & IAM

* Comptes de service dédiés avec rôles minimaux
* Séparation des responsabilités (infra vs workloads)
* Gestion des secrets hors du repo

### CI/CD ready

* Structure pensée pour GitHub Actions / GitLab CI / Terraform Cloud
* Plan et Apply automatisables
* Intégration rapide dans un pipeline professionnel

---

## 🧠 Compétences démontrées

* Infrastructure as Code (Terraform)
* Architecture modulaire & landing zone GCP
* IAM & sécurité cloud
* Séparation des responsabilités
* Backend distant & workflow collaboratif
* Préparation CI/CD

---

## 📌 Axes d’amélioration possibles

* Ajout de linting (`tflint`) et formatage automatique (`terraform fmt`)
* Tests Terraform automatisés
* Monitoring & alerting sur les ressources
* Documentation automatisée des stacks

---

## 📄 Licence

Open-source, libre d’utilisation et d’adaptation.
