-- Table marque
CREATE TABLE IF NOT EXISTS marque (
  id_marque INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Table boisson
CREATE TABLE IF NOT EXISTS boisson (
  id_boisson INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL,
  id_marque INT NOT NULL,
  prix DECIMAL(6,2) DEFAULT 0.00,
  CONSTRAINT uq_boisson_nom_marque UNIQUE (nom, id_marque),
  FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Table ingredient
CREATE TABLE IF NOT EXISTS ingredient (
  id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL UNIQUE,
  allergene TINYINT(1) DEFAULT 0
) ENGINE=InnoDB;

-- Table focaccia
CREATE TABLE IF NOT EXISTS focaccia (
  id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL UNIQUE,
  description TEXT,
  prix DECIMAL(7,2) NOT NULL DEFAULT 0.00,
  disponibilite TINYINT(1) DEFAULT 1,
  CHECK (prix >= 0)
) ENGINE=InnoDB;

-- Table de liaison focaccia <-> ingredient (many-to-many)
CREATE TABLE IF NOT EXISTS focaccia_ingredient (
  id_fi INT AUTO_INCREMENT PRIMARY KEY,
  id_focaccia INT NOT NULL,
  id_ingredient INT NOT NULL,
  quantite VARCHAR(50),
  UNIQUE (id_focaccia, id_ingredient),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;