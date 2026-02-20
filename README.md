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

Ce repository sert de **projet vitrine DevOps / Cloud Engineer**.

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
└── versions.tf
```

### Modules

* **project** → création d’un projet GCP + activation des APIs
* **principals** → comptes de service et IAM
* **vm** → VM Compute Engine
* **bucket** → Cloud Storage

Chaque module est isolé et réutilisable, facilitant la maintenance et l’évolution de l’infrastructure.

---

### Stacks

#### Bootstrap

Initialise la fondation :

* Création du projet et du dossier GCP
* Activation des APIs essentielles
* Création des comptes de service
* Attribution des rôles IAM
* Configuration de l’impersonation

#### Environnements

Contient les ressources applicatives ou spécifiques (dev, staging, prod).

La séparation Bootstrap / Environnements permet :

* Isolation des responsabilités
* Limitation des risques
* Intégration facile avec CI/CD

---

## 🚀 Déploiement

### Prérequis

* Terraform ≥ 1.4
* Compte GCP avec billing activé
* Permissions suffisantes pour créer projets et gérer IAM

Authentification recommandée :

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
terraform init
terraform apply
```

### Environnement

```bash
cd stacks/env
terraform init
terraform apply
```

---

## 🔐 Bonnes pratiques appliquées

### Backend distant & workflow collaboratif

* Stockage du state sur bucket GCS avec verrouillage
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
