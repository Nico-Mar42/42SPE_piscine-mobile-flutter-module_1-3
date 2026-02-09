# Piscine Mobile 2026

## :warning: Disclaimer

[ :uk: ] This repository is for learning purposes. Please do not copy-paste the code directly. Use it to understand concepts and try to implement them yourself. Some files may be incorrect or outdated.

[ :fr: ] Ce dépôt est destiné à l'apprentissage. Merci de ne pas copier-coller le code tel quel. Servez-vous en pour comprendre et refaites par vous-même. Certains fichiers peuvent être incorrects ou obsolètes.

---


## Objectifs pédagogiques

### Module 1 : Design basic d'une App Météo

L'objectif du premier module est de préparer l'aspect de base d'une application météo. Trois pages principales sont à réaliser :

- **Current** : Affichage de la météo actuelle
- **Today** : Prévisions détaillées de la journée
- **Weekly** : Prévisions sur la semaine

Ce module se concentre sur la conception UI/UX, la navigation entre pages et la structuration visuelle de l'application.

### Module 2 : Fonctionnalités GPS & API Open-Meteo

Le second module vise à intégrer des fonctionnalités avancées :

- Utilisation des coordonnées GPS du téléphone pour localiser l'utilisateur
- Récupération des informations météo via l'API Open-Meteo
- Recherche météo par ville (saisie utilisateur ou géolocalisation)

Ce module met l'accent sur l'interaction avec les capteurs du téléphone, la gestion des permissions, et la consommation d'API externes.

### Module 3 : Finaliser le design

Le troisième module vise à finaliser l'application pour lui donner sont design final :

- Ajouter un fond qui n'empèche pas la lecture des informations
- Ajouter des graphique pour représenter l'evolution des température dans le temps
- Rendre plus intuitive la lecture des données

Ce module met l'accent comment crée des graphique, et sur l'UI/UX.

---

## Structure du projet

Ce dépôt contient plusieurs modules de la piscine mobile, chacun avec ses propres exercices et applications :

- **mobileModule01** : Exercices et projets du module 1
- **mobileModule02** : Exercices et projets du module 2
- **mobileModule03** : Exercices et projets du module 3
- **screen/** : Captures d'écran illustrant les modules

Chaque module contient des sous-dossiers pour chaque exercice (ex00, ex01, ...), avec leur propre application Flutter/Dart.

---

## Lancement rapide

Pour chaque projet Flutter :

```bash
cd chemin/vers/le/projet
flutter pub get
flutter run
```

---

## Screenshots

### Module 1

<div align="center">
	<img src="./screen/module 1/screen module 1 1.png" width="30%" />
	<img src="./screen/module 1/screen module 1 2.png" width="30%" />
	<img src="./screen/module 1/screen module 1 3.png" width="30%" />
</div>

### Module 2

<div align="center">
	<img src="./screen/module 2/screen module 2 1.png" width="30%" />
	<img src="./screen/module 2/screen module 2 2.png" width="30%" />
	<img src="./screen/module 2/screen module 2 3.png" width="30%" />
</div>

### Module 3

<div align="center">
	<img src="./screen/module 3/screen module 3 1.png" width="30%" />
	<img src="./screen/module 3/screen module 3 2.png" width="30%" />
	<img src="./screen/module 3/screen module 3 3.png" width="30%" />
</div>

---

## Organisation détaillée

- **mobileModule01/**
	- weather_app/ : Application météo, code source, tests, etc.
- **mobileModule02/**
	- ex00/, ex01/, ex02/, ex03/ : Exercices avec leur propre weather_app/
- **mobileModule03/**
	- ex00/ : Application météo, code source, tests, etc/
- **screen/**
	- module 1/ : Captures d'écran du module 1
	- module 2/ : Captures d'écran du module 2
	- module 3/ : Captures d'écran du module 3

---

## Auteurs

**Login 42** : Nicolmar

Projet réalisé dans le cadre de la Piscine Mobile 42, janvier 2026.

