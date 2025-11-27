USE tifosi;

-- 1. Afficher la liste des noms des focaccias par ordre alphabétique croissant
-- But : lister toutes les focaccias triées de A à Z.
SELECT nom
FROM focaccia
ORDER BY nom ASC;


-- 2. Afficher le nombre total d'ingrédients
-- But : compter combien d'ingrédients différents existent.
SELECT COUNT(*) AS nb_ingredients
FROM ingredient;


-- 3. Afficher le prix moyen des focaccias
-- But : calculer le prix moyen de toutes les focaccias.
SELECT ROUND(AVG(prix), 2) AS prix_moyen_focaccia
FROM focaccia;


-- 4. Afficher la liste des boissons avec leur marque, triée par nom de boisson
-- But : voir chaque boisson, sa marque associée.
SELECT b.nom  AS boisson,
       m.nom  AS marque,
       b.prix AS prix
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;


-- 5. Afficher la liste des ingrédients pour une Raclaccia
-- But : afficher tous les ingrédients utilisés dans la focaccia "Raclaccia".
SELECT i.nom AS ingredient
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i            ON fi.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;


-- 6. Afficher le nom et le nombre d'ingrédients pour chaque focaccia
-- But : pour chaque focaccia, connaître combien d'ingrédients elle contient.
SELECT f.nom,
       COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;


-- 7. Afficher le nom de la focaccia qui a le plus d'ingrédients
-- But : trouver la focaccia la plus "chargée" en ingrédients.
SELECT f.nom,
       COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY nb_ingredients DESC
LIMIT 1;


-- 8. Afficher la liste des focaccia qui contiennent de l'ail
-- But : lister les focaccias qui utilisent l'ingrédient "Ail".
SELECT DISTINCT f.nom
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i            ON fi.id_ingredient = i.id_ingredient
WHERE i.nom = 'Ail'
ORDER BY f.nom ASC;


-- 9. Afficher la liste des ingrédients inutilisés
-- But : trouver les ingrédients qui ne sont utilisés dans aucune focaccia.
SELECT i.nom AS ingredient_inutilise
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL
ORDER BY i.nom ASC;


-- 10. Afficher la liste des focaccia qui n'ont pas de champignons
-- But : lister les focaccias qui ne contiennent pas l'ingrédient "Champignon".
SELECT f.nom
FROM focaccia f
WHERE NOT EXISTS (
    SELECT 1
    FROM focaccia_ingredient fi
    JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
    WHERE fi.id_focaccia = f.id_focaccia
      AND i.nom = 'Champignon'
)
ORDER BY f.nom ASC;
