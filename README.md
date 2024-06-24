<p align="center">
  <img src="https://i.goopics.net/8jhjnj.png" alt="Logo" />
</p>

<p align="center">
  Bienvenue dans le projet Pokedex API Maxime. Ce guide vous aidera à configurer et lancer le projet sur votre machine.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Made%20with-Ruby%20on%20Rails-red" alt="Made with Ruby on Rails" />
  <img src="https://img.shields.io/badge/Made%20with-Tailwind%20CSS-blue" alt="Made with Tailwind CSS" />
</p>

## Contexte du Projet

Ce projet a été réalisé dans le cadre de ma candidature pour un poste d'alternant full stack chez Hop3Team. L'objectif est de créer une application Rails qui combine l'amour des Pokémon et des exports de données.

### Résumé des Demandes

- Afficher la liste de la première génération de Pokémon via une API.
- Permettre la sélection de un ou plusieurs Pokémon.
- Exporter la sélection de Pokémon au format CSV (séparateur point-virgule) avec les colonnes suivantes :
  - Le pokedex id
  - Le nom en français
  - L’url du sprite « regular »
  - L’url du sprite « shiny »
  - Les types du Pokémon (séparés par une virgule)
  - Les pokedex ids des évolutions du Pokémon (séparés par une virgule)

Toutes ces informations peuvent être obtenues via l'API suivante : [https://mon-api-pokemon.vercel.app/api/v1/pokemon](https://mon-api-pokemon.vercel.app/api/v1/pokemon).

L'application doit être réalisée en Ruby on Rails et peut utiliser toutes les gems nécessaires. L'ergonomie est libre, mais le fonctionnel est prioritaire.

## Aperçu du projet

![Profil](https://i.goopics.net/ymhs2p.png)

## Prérequis
Le site a été développé avec Ruby 3.1.2 et Rails 7.0.4. Assurez-vous d'utiliser ces versions pour éviter les problèmes de compatibilité.
- [Ruby on Rails 3.3.3](https://rubyonrails.org/)

## Installation

### Cloner le dépôt

Pour commencer, clonez le dépôt en utilisant la commande suivante dans votre terminal :
```bash
git clone https://github.com/KC-Yuu/Pokedex-API-Maxime.git
```

### Configuration

#### Pour Linux

1. Ouvrez un terminal à la racine du projet et donnez les droits d'exécution au script "setup.sh" :
```bash
chmod +x setup.sh
```

2. Exécutez le script de configuration du projet pour installer les gems et les dépendances :
```bash
./setup.sh
```

3. Une fois le message "Setup terminé" affiché, lancez le serveur Rails :
```bash
rails server
```

4. Une fois le server démarré vous pouvez accéder au site via [localhost:3000](http://localhost:3000) ou [127.0.0.1:3000](http://127.0.0.1:3000).

#### Pour Windows

1. Exécutez le script de configuration du projet pour installer les gems et les dépendances :
```bash
.\setup.bat
```

2. Une fois le message "Setup terminé" affiché, lancez le serveur Rails :
```bash
rails server
```

3. Une fois le server démarré vous pouvez accéder au site via [localhost:3000](http://localhost:3000) ou [127.0.0.1:3000](http://127.0.0.1:3000).
/!\ **Notez qu'il est fortement probable que vous rencontriez une erreur lors du premier chargement de la page (en raison des permissions de fichiers sous Windows). Si cela se produit, rafraîchissez simplement la page pour résoudre le problème.** /!\

## Bonus

- **Couleur du Background** : Les couleurs des backgrounds des pokémons sont générées en fonction de leur types.
- **Système de recherche** : Ajout d'une fonctionnalité de recherche pour filtrer les Pokémon par nom.
- **Ajout des détails du Pokémon** : Ajout d'une page détaillée pour chaque Pokémon avec les informations complètes.
- **Système de filtrage** : Ajout d'un système de filtrage pour filtrer les Pokémon par génération/types.
- **Système de tri** : Ajout d'un système de tri pour trier les Pokémon par ordre croissant/décroissant.
- **Pagination** : Implémentation de la pagination pour la liste des Pokémon.
- **Interface utilisateur améliorée** : Ajout de styles CSS à l'aide de Tailwind pour une meilleure expérience utilisateur.
- **Responsivité** : Ajout de la responsivité sur l'ensemble du site pour une meilleure expérience utilisateur.

## Contribueur

### Maxime : https://github.com/KC-Yuu