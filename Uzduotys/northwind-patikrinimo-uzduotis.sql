-- 1. Išrinkite visus duomenis iš lentelės "ORDERS"
SELECT * FROM orders;

-- 2. Išrinkite duomenis, kiek iš viso buvo įvykdyta užsakymų
SELECT COUNT(*) AS viso_uzsakymu
FROM orders;

-- 3. Išrinkite duomenis (užsakymo datą ir laivo vardą) apie visus krovinius į Prancūziją
SELECT orderdate, shipname
FROM orders
WHERE shipcountry = 'France';

-- 4. Išrinkite užsakymus (užsakymo ID, užsakymo datą ir šalį) apie visus krovinius, išsiųstus į šalis, prasidedančias raidėmis G, B arba A
SELECT orderid, orderda, shipcountry
FROM orders
WHERE shipcountry LIKE 'G%'
   OR salis LIKE 'B%'
   OR salis LIKE 'A%';
-- 5. Išrinkite duomenis (adresas, laivo vardas, šalis) apie užsakymus, kurių ORDERID yra nuo 10248 iki 10300

-- 6. Išrinkite visus duomenis apie užsakymus, kurių numeriai yra 10250, 10260, 10270 (operatorius IN)

-- 7. Išrinkite visus duomenis apie užsakymus ir išrikiuokite duomenis pagal užsakymo datą nuo seniausios iki naujausios

-- 8. Išveskite stulpelio FREIGHT vidurkį

-- 9. Išrinkite duomenis (šalis ir skaičius), kiek krovinių buvo išplukdyta į kiekvieną šalį

-- 10. Išrinkite duomenis (šalis ir skaičius), kiek produktų buvo išplukdyta į kiekvieną šalį (produktai lentelėje ORDER_DETAILS)

-- 11. #9 punkto užklausą pataisykite taip, kad rodytų tik tas šalis, į kurias buvo išplukdyta daugiau nei 20 krovinių

-- 12. Įterpkite į lentelę PRODUCTS naują įrašą, užpildydami visus laukus, skirdami ID=1000, bei priskirkite produktą 'Seafood' kategorijai (lentelė CATEGORIES)

-- 13. Atnaujinkite duomenis apie produktą, priskirdami jį 'Beverages' kategorijai, kurio ID yra 23

-- 14. Išrinkite duomenis (produkto pavadinimas, vieneto kaina, užsakymo numeris ir aptarnavęs darbuotojas), kokie produktai buvo užsakyti bei apie tuos, kurių niekas neužsakė

-- 15. Ištrinkite iš lentelės PRODUCTS įrašą, kurį sukūrėte #12 užklausoje

-- PAPILDOMAI: Sujunkite visas NORTHWIND duomenų bazės lenteles į vieną naudojant JOIN (išskyrus CUSTOMERCUSTOMERDEMO, CUSTOMERDEMOGRAPHICS, USSTATES lenteles)
