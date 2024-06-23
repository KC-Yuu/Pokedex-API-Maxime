# Hop3Dex

![Logo](https://i.goopics.net/8jhjnj.png)

Bienvenue sur le projet Hop3Dex. Ce guide vous aidera à configurer et lancer le projet sur votre machine.

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

- [Ruby on Rails 3.3.3](https://rubyonrails.org/)

## Installation

### Cloner le dépôt

Pour commencer, clonez le dépôt en utilisant la commande suivante :
```bash
git clone https://github.com/Maxime-Boucher/Pokedex-API-Maxime.git
```

### Configuration

#### Pour Linux

1. Exécutez le script de configuration à la racine du projet :
```bash
bash ./setup.sh
```

2. Une fois que le script à terminé de s'executer, lancez le serveur Rails :
```bash
rails server
```

3. Accédez à l'application via [localhost:3000](http://localhost:3000) ou [127.0.0.1:3000](http://127.0.0.1:3000).

#### Pour Windows

1. Exécutez le script de configuration à la racine du projet :
```bash
bash .\setup.bat
```

2. Une fois que le script à terminé de s'executer, lancez le serveur Rails :
```bash
rails server
```

3. Accédez à l'application via [localhost:3000](http://localhost:3000) ou [127.0.0.1:3000](http://127.0.0.1:3000). **Notez qu'il est fortement possible que vous rencontriez une erreur lors du premier chargement de la page (en raison des permissions de fichiers sous Windows). Si cela se produit, rafraîchissez simplement la page pour résoudre le problème.**

## Bonus

- **Système de recherche** : Ajout d'une fonctionnalité de recherche pour filtrer les Pokémon par nom.
- **Ajout des détails du Pokémon** : Ajout d'une page détaillée pour chaque Pokémon avec les informations complètes.
- **Système de filtrage** : Ajout d'un système de filtrage pour filtrer les Pokémon par génération/types.
- **Pagination** : Implémentation de la pagination pour la liste des Pokémon.
- **Interface utilisateur améliorée** : Ajout de styles CSS à l'aide de Tailwind pour une meilleure expérience utilisateur.
