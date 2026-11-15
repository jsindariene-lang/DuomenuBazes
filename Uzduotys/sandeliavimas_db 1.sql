CREATE DATABASE IF NOT EXISTS sandeliavimas
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_0900_ai_ci;
USE sandeliavimas;


SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS parduotuves_prekes;
DROP TABLE IF EXISTS darbuotojai;
DROP TABLE IF EXISTS prekes;
DROP TABLE IF EXISTS parduotuves;
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE `parduotuves` (
  `ID` INT NOT NULL,
  `Pavadinimas` VARCHAR(20) NOT NULL,
  `Miestas` VARCHAR(20) NOT NULL,
  `Adresas` VARCHAR(30) NOT NULL,
  `Telefonas` VARCHAR(20) NOT NULL,
  CONSTRAINT `pk_parduotuves` PRIMARY KEY (`ID`),
  -- Naudingas unikalumas pagal pavadinimą+miestą+adresą (pasirinktinai)
  UNIQUE KEY `uq_pard_pav_miest_adresas` (`Pavadinimas`,`Miestas`,`Adresas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `prekes` (
  `ID` INT NOT NULL,
  `Pavadinimas` VARCHAR(30) NOT NULL,
  `Tiekejas` VARCHAR(30) NOT NULL,
  `Kaina` DECIMAL(8,2) NOT NULL,
  CONSTRAINT `pk_prekes` PRIMARY KEY (`ID`),
  KEY `idx_prekes_pavadinimas` (`Pavadinimas`),
  KEY `idx_prekes_tiekejas` (`Tiekejas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `darbuotojai` (
  `Asmens_kodas` BIGINT NOT NULL,
  `Vardas` VARCHAR(20) NOT NULL,
  `Pavarde` VARCHAR(20) NOT NULL,
  `Dirba_nuo` DATE NOT NULL,
  `Atlyginimas` DECIMAL(7,2) NOT NULL,
  `Parduotuves_id` INT DEFAULT NULL,
  CONSTRAINT `pk_darbuotojai` PRIMARY KEY (`Asmens_kodas`),
  KEY `idx_darbuotojai_parduotuves` (`Parduotuves_id`),
  CONSTRAINT `fk_darbuotojai_pard`
    FOREIGN KEY (`Parduotuves_id`) REFERENCES `parduotuves` (`ID`)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `parduotuves_prekes` (
  `Parduotuves_id` INT NOT NULL,
  `Prekes_id` INT NOT NULL,
  `Kiekis` INT NOT NULL DEFAULT 0,
  CONSTRAINT `pk_parduotuves_prekes`
    PRIMARY KEY (`Parduotuves_id`, `Prekes_id`),
  KEY `idx_pp_prekes` (`Prekes_id`),
  CONSTRAINT `fk_pp_pard`
    FOREIGN KEY (`Parduotuves_id`) REFERENCES `parduotuves` (`ID`)
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `fk_pp_prek`
    FOREIGN KEY (`Prekes_id`) REFERENCES `prekes` (`ID`)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `parduotuves` (`ID`, `Pavadinimas`, `Miestas`, `Adresas`, `Telefonas`) VALUES
(1, 'MINIMA', 'VILNIUS', 'ULONU 2', '+37065412369'),
(2, 'MEDIA', 'VILNIUS', 'BALIUKO 3', '+37065412369'),
(3, 'MAXIMA', 'VILNIUS', 'SENAMIESCIO 6', '+37065412369'),
(4, 'MINIMA', 'KAUNAS', 'ALGIRDO 5', '+37065412369'),
(5, 'MEDIA', 'KAUNAS', 'MYKOLO 6', '+37065412369'),
(6, 'MAXIMA', 'KAUNAS', 'KAUNO 7', '+37065412369');

INSERT INTO `prekes` (`ID`, `Pavadinimas`, `Tiekejas`, `Kaina`) VALUES
(1, 'VIRYKLE', 'SAMSUNG', 500.00),
(3, 'VIRYKLE', 'VIRPUL', 400.00),
(2, 'VIRYKLE', 'MELE', 600.00),
(4, 'SKALBIMO MASINA', 'SAMSUNG', 800.00),
(5, 'SKALBIMO MASINA', 'MELE', 900.00),
(6, 'SKALBIMO MASINA', 'VIRPUL', 600.00),
(7, 'TELEVIZORIUS', 'SAMSUNG', 300.00),
(8, 'TELEVIZORIUS', 'MELE', 250.00),
(9, 'TELEVIZORIUS', 'VIRPUL', 150.00);

INSERT INTO `darbuotojai` (`Asmens_kodas`, `Vardas`, `Pavarde`, `Dirba_nuo`, `Atlyginimas`, `Parduotuves_id`) VALUES
(38705203214, 'ALGIS', 'GRIGAS', '2012-10-10', 600.00, 1),
(39705203214, 'ANTANAS', 'PALIONIS', '2013-12-10', 500.00, 2),
(38905212217, 'KAROLIS', 'KARALIUS', '2015-10-10', 1100.00, 3),
(37805203245, 'GRIGAS', 'GRIGAITIS', '2012-10-10', 600.00, 4),
(47005203214, 'MARINA', 'GARINA', '2013-10-10', 300.00, 2),
(46605203214, 'VIKTORIJA', 'PETKEVIC', '1999-10-10', 800.00, 1),
(49005203214, 'KOTRYNA', 'ZINKE', '2001-10-10', 650.00, NULL),
(48905203214, 'KAROLINA', 'BUNKE', '1999-10-10', 800.00, NULL);

INSERT INTO `parduotuves_prekes` (`Parduotuves_id`, `Prekes_id`, `Kiekis`) VALUES
(1, 1, 12),
(1, 4, 5),
(1, 7, 18),
(2, 2, 7),
(3, 3, 4),
(4, 5, 9),
(5, 6, 3),
(5, 8, 14),
(5, 9, 20);
