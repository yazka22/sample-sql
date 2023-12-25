use gestiunea_vanzarilor;

SELECT * FROM produse 
WHERE denumire_prod LIKE 'C%';

SELECT * FROM produse 
WHERE denumire_prod LIKE '%i';

SELECT * FROM produse 
WHERE denumire_prod LIKE '__i';

SELECT * FROM produse 
WHERE denumire_prod LIKE '__i%';

SELECT * FROM produse 
WHERE denumire_prod LIKE '______';

SELECT nume, adresa FROM clienti
WHERE telefon IS NULL;

SELECT nume, adresa, telefon FROM clienti 
WHERE telefon IS NOT NULL;

SELECT * FROM produse 
ORDER BY denumire_prod ASC;

SELECT * FROM produse 
ORDER BY denumire_prod DESC;