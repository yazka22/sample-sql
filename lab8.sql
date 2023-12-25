select * from clienti;

select nume from clienti
where adresa like '%adresa%';

select nr_fact, seria_fact from facturi
where data_fact>'01.07.2009';

select denumire_prod from produse
where stoc_initial<20;