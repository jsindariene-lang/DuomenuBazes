-- Užklausos
-- Atsakymą pateikite po kiekvienu punktu.

-- 1) Atrinkite visus duomenis iš lentelės „prekes“ kurių tiekėjas yra „MELE“.
SELECT *
FROM prekes
WHERE tiekejas = 'MELE';


-- 2) Atrinkite nesikartojančius prekių pavadinimus, kurių pavadinime
--    ketvirta raidė yra „L“.
SELECT DISTINCT pavadinimas
FROM prekes
WHERE pavadinimas LIKE '___L%';

-- 3) Atrinkite iš lentelės „prekes“ mažiausią kainą IR ją pateikite centais.
-- Stulpelį pavadinkite „min_kaina_centais“.
SELECT MIN(kaina) * 100 AS min_kaina_centais
FROM prekes;

-- 4) Atrinkite darbuotojų dirbančių Kauno Minimoje ir Vilniaus Maximoje
--    asmens kodus ir jų atlyginimus.
SELECT d.asmens_kodas, d.atlyginimas
FROM darbuotojai d
JOIN parduotuves p
ON d.parduotuves_id = p.id
WHERE (p.miestas = 'Kaunas' AND p.pavadinimas = 'Minima')
OR (p.miestas = 'Vilnius' AND p.pavadinimas = 'Maxima');


-- 5) Atrinkite parduotuvių pavadinimus taip, kad jie nesikartotų.
SELECT DISTINCT pavadinimas
FROM parduotuves;

-- 6) Atrinkite visus duomenis apie prekes, kurios kainuoja 400 arba 500.
SELECT *
FROM prekes
WHERE kaina IN (400, 500);

-- 7) Atrinkite visus duomenis iš lentelės „darbuotojai“ ir išrikiuokite juos
--    taip, kad jų atlyginimas būtų nuo mažiausio iki didžiausio.
SELECT *
FROM darbuotojai
ORDER BY atlyginimas ASC;

-- 8) Išveskite kiekvienos parduotuvės pavadinimą, miestą ir darbuotojų skaičių.
--    Rezultate turi būti ir tos parduotuvės, kuriose nedirba nė vienas darbuotojas.
SELECT p.pavadinimas, p.miestas, COUNT(d.Asmens_kodas) AS darbuotoju_skaicius
FROM parduotuves p
LEFT JOIN darbuotojai d
ON p.id = d.parduotuves_id
GROUP BY p.pavadinimas, p.miestas;

-- 9) #8 užklausą pataisykite taip, kad būtų rodomas parduotuvės pavadinimas,
--    miestas ir darbuotojų skaičius tik tų Vilniaus parduotuvių,
--    kuriose dirba mažiau nei 2 darbuotojai.
SELECT p.pavadinimas, p.miestas, COUNT(d.Asmens_kodas) AS darbuotoju_skaicius
FROM parduotuves p
LEFT JOIN darbuotojai d
ON p.id = d.parduotuves_id
WHERE p.miestas = 'Vilnius'
GROUP BY p.pavadinimas, p.miestas
HAVING COUNT(d.Asmens_kodas) <= 2;

-- 10) Atrinkite duomenis: parduotuvės pavadinimą, miestą kuriame įsikūrusi
--     parduotuvė, ir apskaičiuokite, kiek skirtingų prekių turi kiekviena
--     parduotuvė. Rezultate turi būti ir parduotuvės, kurios neturi nė vienos prekės.
SELECT p.pavadinimas, p.miestas, COUNT(DISTINCT pr.id) AS skirtingu_prekiu_skaicius
FROM parduotuves p
LEFT JOIN prekes pr
ON p.id = pr.id
GROUP BY p.pavadinimas, p.miestas;

-- 11) Atrinkite darbuotojų vardus, pavardes ir parduotuvių pavadinimus,
--     bei miestus, kuriuose jie dirba. Rezultate turi būti tik tie darbuotojai,
--     kurie yra priskirti parduotuvėms.
SELECT d.vardas, d.pavarde, p.pavadinimas, p.miestas
FROM darbuotojai d
INNER JOIN parduotuves p
ON d.parduotuves_id = p.id
ORDER BY d.pavarde, d.vardas;

-- 12) #11 užklausą pataisykite taip, kad rezultate būtų visi darbuotojai:
--     ir priskirti parduotuvėms, ir nepriskirti jokiai parduotuvei.
--     Išveskite vardą, pavardę, parduotuvės pavadinimą ir miestą.
SELECT d.vardas, d.pavarde, p.pavadinimas, p.miestas
FROM darbuotojai d
LEFT JOIN parduotuves p
ON d.parduotuves_id = p.id
ORDER BY d.pavarde, d.vardas;

-- 13) Įterpkite į lentelę „darbuotojai“ naują įrašą, užpildydami visus laukus,
--     bei priskirkite darbuotoją dirbti Vilniaus Maximoje.

INSERT INTO darbuotojai (Asmens_kodas, vardas, pavarde, Dirba_nuo, Atlyginimas, Parduotuves_id)
VALUES ('38011061234', 'Martynas', 'Pertaitis', '2011-01-01',1500,
    (SELECT id FROM parduotuves WHERE miestas = 'Vilnius'AND pavadinimas = 'Maxima'));

-- 14) Atnaujinkite duomenis lentelėje „darbuotojai“, priskirdami darbuotoją,
--     kurio asmens kodas 49005203214, dirbti Vilniaus Maximoje.
UPDATE darbuotojai
SET parduotuves_id = (SELECT id FROM parduotuves WHERE miestas = 'Vilnius' AND pavadinimas = 'Maxima')
WHERE asmens_kodas = '49005203214';

-- 15) Ištrinkite iš lentelės „darbuotojai“ įrašą, kurį sukūrėte #13 užklausoje.
DELETE FROM darbuotojai
WHERE asmens_kodas = '38011061234';

-- 16) Atrinkite visus darbuotojų duomenis tų darbuotojų, kurie nėra priskirti
--     jokiai parduotuvei.
SELECT *
FROM darbuotojai
WHERE parduotuves_id IS NULL;

-- 17) Apskaičiuokite vidutinį darbuotojų atlyginimą pagal parduotuvės miestą.
--     Rezultate turi būti miesto pavadinimas ir vidutinis atlyginimas.
--     Nepriskirtų darbuotojų į skaičiavimą neįtraukite.
SELECT p.miestas, AVG(d.atlyginimas) AS vidutinis_atlyginimas
FROM darbuotojai d
INNER JOIN parduotuves p
ON d.parduotuves_id = p.id
GROUP BY p.miestas
ORDER BY p.miestas;

-- 18) Apskaičiuokite bendrą prekių kiekį kiekvienoje parduotuvėje.
--     Rezultate turi būti parduotuvės pavadinimas, miestas ir bendras kiekis.
SELECT p.pavadinimas, p.miestas, COALESCE(SUM(pp.kiekis), 0) AS bendras_prekiu_kiekis
FROM parduotuves p
LEFT JOIN parduotuves_prekes pp
ON p.id = pp.parduotuves_id
GROUP BY p.pavadinimas, p.miestas
ORDER BY p.pavadinimas;

-- 19) Atnaujinkite duomenis lentelėje „darbuotojai“, priskirdami darbuotoją,
--     kurio asmens kodas 48905203214, dirbti Kauno Maximoje. Parduotuvės ID
--     negalima įrašyti ranka - jį gaukite pagal parduotuvės pavadinimą ir miestą.
UPDATE darbuotojai
SET parduotuves_id = ( SELECT id FROM parduotuves WHERE miestas = 'Kaunas' AND pavadinimas = 'Maxima' )
WHERE asmens_kodas = '48905203214';

-- 20) Lentelėje „parduotuves_prekes“ pridėkite naują stulpelį „Minimalus_kiekis“.
--     Stulpelio tipas turi būti INT, reikšmė negali būti NULL, numatytoji reikšmė 0.
ALTER TABLE parduotuves_prekes
ADD Minimalus_kiekis INT NOT NULL DEFAULT 0;