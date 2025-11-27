# Tifosi-devoir6-BDD
# Projet Tifosi – Devoir 6 : Base de Données MySQL

## Objectif du projet

Ce projet a pour but de créer et d'exploiter une base de données pour *Le Tifosi*, un restaurant de street-food italien.  
La base permet de gérer :

- Les focaccias  
- Les ingrédients  
- Les marques  
- Les boissons  
- Les relations focaccia ↔ ingrédients  

Le projet inclut la création du schéma, l’insertion des données de test et l’exécution d’un ensemble de requêtes SQL destinées à vérifier la cohérence du modèle.

## Structure du dépôt

Tifosi-devoir6-BDD/
│
├── sql/
│   ├── 01_create_schema.sql
│   ├── 02_insert_data.sql
│   ├── 02b_insert_focaccia_ingredient.sql
│   └── 03_test_queries.sql
│
├── data/
│   ├── focaccia_ingredient.csv
│   ├── focaccia.csv   
│   ├── ingredient.csv 
│   ├── boisson.csv    
│   └── marque.csv     
│
├── src/
│ ├── focaccia.xlsx
│ ├── ingredient.xlsx
│ ├── boisson.xlsx
│ └── marque.xlsx
│
└── README.md

## 1. Création de la base de données & de l’utilisateur

Dans MySQL (avec un compte ayant les privilèges administrateur), exécuter :

```sql
CREATE DATABASE tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'VotreMotDePasse';

GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

## 2. Création du schéma

Le schéma physique de la base (tables, clés primaires, clés étrangères, contraintes, types) est défini dans :
sql/01_create_schema.sql

Pour l’exécuter :
mysql -u tifosi -p tifosi < sql/01_create_schema.sql

## 3. Insertion des données de test

Les données proviennent des fichiers fournis :
focaccia.xlsx, ingredient.xlsx, boisson.xlsx, marque.xlsx.
Les données sont insérées via deux scripts :

# 3.1 Données principales

sql/02_insert_data.sql

Exécution :
mysql -u tifosi -p tifosi < sql/02_insert_data.sql

# 3.2 Table de liaison focaccia ↔ ingrédients

sql/02b_insert_focaccia_ingredient.sql

Exécution :
mysql --local-infile=1 -u tifosi -p tifosi < sql/02b_insert_focaccia_ingredient.sql

Le fichier CSV utilisé pour cette liaison se trouve dans :
data/focaccia_ingredient.csv

## 4. Requêtes de vérification

Les 10 requêtes demandées dans le devoir sont regroupées dans :
sql/03_test_queries.sql

Elles permettent notamment :
D’afficher les focaccias par ordre alphabétique
De compter le nombre total d’ingrédients
De calculer le prix moyen des focaccias
D’afficher les boissons avec leur marque
De récupérer les ingrédients de la Raclaccia
De compter les ingrédients par focaccia
D’identifier la focaccia la plus garnie
De lister les focaccias contenant de l’ail
De détecter les ingrédients inutilisés
De lister les focaccias sans champignons

▶ Exécution des requêtes :

Depuis le client MySQL :
mysql -u tifosi -p tifosi

Puis dans MySQL :
SOURCE sql/03_test_queries.sql;

Les résultats apparaissent directement dans le terminal.

## 5. Objectifs pédagogiques atteints

Ce projet permet de :

Recenser les informations du domaine (focaccias, ingrédients, boissons, marques)
Organiser les données via un modèle relationnel normalisé
Construire l’organisation physique (schéma SQL, clés, contraintes)
Manipuler SQL : création, insertion, suppression, mise à jour
Exécuter des requêtes SQL de complexité variable :
jointures
sous-requêtes
fonctions d’agrégation
regroupements
conditions avancées

✔️ Conclusion

Ce dépôt fournit :

Un schéma complet et cohérent
Un ensemble de données de test représentatif
Les requêtes nécessaires pour valider la base
Une structure claire permettant de rejouer toutes les opérations
Le projet est entièrement reproductible en local via les commandes fournies.







