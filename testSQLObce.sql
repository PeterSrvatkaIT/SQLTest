--1a uloha  vysledok  117
SELECT count(nazov) - count(DISTINCT nazov)
FROM obec;

--1b uloha  2 obce Porubka, Lucka - kazda 4 duplikaty
SELECT count(nazov) as count, nazov
FROM obec
GROUP BY nazov
ORDER BY count DESC
LIMIT 110;

--2 uloha 11 okresov v Kosickom kraji
SELECT okres.nazov
FROM okres
         JOIN kraj ON id_kraj = kraj.id
WHERE kraj.nazov LIKE 'Kosicky%';

--3 uloha   431 obci v Kosickom kraji
SELECT count(obec.nazov)
FROM okres
         JOIN kraj ON okres.id_kraj = kraj.id
         JOIN obec ON obec.id_okres = okres.id
WHERE kraj.nazov LIKE 'Kosicky%';

--4 uloha "Bratislava - Petrzalka" 105468
SELECT nazov, (muzi + zeny) AS populacia
FROM obec
         INNER JOIN populacia ON obec.id = id_obec
WHERE rok = 2012
ORDER BY populacia DESC
LIMIT 1;

--5 uloha Sabinov, r. 2021- 58450 obyvatelov
SELECT SUM(muzi + populacia)
FROM obec
         JOIN populacia ON populacia.id_obec = obec.id
         JOIN okres ON okres.id = obec.id_okres
WHERE populacia.rok = 2012
  AND okres.nazov = 'Sabinov';

-- 6 uloha  5410836	2012
--          5404322	2011
--          5435273	2010
--          5424925	2009    - vymierame
SELECT SUM(muzi + zeny) as populacia, rok
FROM populacia
GROUP BY rok
ORDER BY rok DESC;

-- 7 uloha Stefanov nad Oravou, 659 obyvatelov, rok 2011
SELECT obec.nazov, (muzi + zeny) AS poopulacia
FROM obec
         JOIN okres ON okres.id = obec.id_okres
         JOIN populacia ON populacia.id_obec = obec.id
WHERE okres.nazov = 'Tvrdosin'
  AND populacia.rok = '2011'
ORDER BY poopulacia ASC;

-- 8 uloha pocet obci s obyvatelstvom < 5000 v roku 2010 - 2774
SELECT obec.nazov
FROM obec
         JOIN populacia ON populacia.id_obec = obec.id
WHERE populacia.rok = 2010
  AND (muzi + zeny) < 5000;

-- 9 uloha "Bratislava - Ruzinov"	1.2103 - najvacsti pomer zien voci muzom, r. 2012
SELECT nazov, ROUND((zeny * 1.0 / muzi * 1.0), 4) as ratio
FROM obec
         JOIN populacia on obec.id = populacia.id_obec
WHERE (muzi + zeny) > 20000
  AND rok = 2012
--AND ratio > 1.0
ORDER BY ratio DESC
LIMIT 10;

-- 10 uloha

-- 11 uloha

-- 12 uloha




