USE tifosi;

-- On vide les tables dans le bon ordre
DELETE FROM focaccia_ingredient;
DELETE FROM boisson;
DELETE FROM focaccia;
DELETE FROM ingredient;
DELETE FROM marque;

-- On remet les compteurs d'auto-incrément à 1
ALTER TABLE focaccia_ingredient AUTO_INCREMENT = 1;
ALTER TABLE boisson AUTO_INCREMENT = 1;
ALTER TABLE focaccia AUTO_INCREMENT = 1;
ALTER TABLE ingredient AUTO_INCREMENT = 1;
ALTER TABLE marque AUTO_INCREMENT = 1;

-- 1) Marques
INSERT INTO marque (nom) VALUES
('Coca-cola'),
('Pepsico'),
('Monster'),
('Cristalline');

-- 2) Ingrédients
INSERT INTO ingredient (nom) VALUES
('Ail'),             -- id_ingredient = 1
('Ananas'),          -- 2
('Artichaut'),       -- 3
('Bacon'),           -- 4
('Base Tomate'),     -- 5
('Base crème'),      -- 6
('Champignon'),      -- 7
('Chevre'),          -- 8
('Cresson'),         -- 9
('Emmental'),        -- 10
('Gorgonzola'),      -- 11
('Jambon cuit'),     -- 12
('Jambon fumé'),     -- 13
('Oeuf'),            -- 14
('Oignon'),          -- 15
('Olive noire'),     -- 16
('Olive verte'),     -- 17
('Parmesan'),        -- 18
('Piment'),          -- 19
('Poivre'),          -- 20
('Pomme de terre'),  -- 21
('Raclette'),        -- 22
('Salami'),          -- 23
('Tomate cerise'),   -- 24
('Mozarella');       -- 25

-- 3) Focaccias
INSERT INTO focaccia (nom, description, prix, disponibilite) VALUES
('Mozaccia',        NULL,  9.80, 1),  -- id_focaccia = 1
('Gorgonzollaccia', NULL, 10.80, 1),  -- 2
('Raclaccia',       NULL,  8.90, 1),  -- 3
('Emmentalaccia',   NULL,  9.80, 1),  -- 4
('Tradizione',      NULL,  8.90, 1),  -- 5
('Hawaienne',       NULL, 11.20, 1),  -- 6
('Américaine',      NULL, 10.80, 1),  -- 7
('Paysanne',        NULL, 12.80, 1);  -- 8

-- 4) Boissons (exemple simple, tu peux adapter)
INSERT INTO boisson (nom, id_marque, prix) VALUES
('Coca-cola zéro',        1, 0.00),
('Coca-cola original',    1, 0.00),
('Fanta citron',          1, 0.00),
('Fanta orange',          1, 0.00),
('Capri-sun',             1, 0.00),
('Pepsi',                 2, 0.00),
('Pepsi Max Zéro',        2, 0.00),
('Lipton zéro citron',    2, 0.00),
('Lipton Peach',          2, 0.00),
('Monster energy ultra gold', 3, 0.00),
('Monster energy ultra blue', 3, 0.00),
('Eau de source',         4, 0.00);
