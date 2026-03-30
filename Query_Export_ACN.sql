-- QUERY RICHIESTA PER GENERAZIONE OUTPUT STRUTTURATO (CSV)
-- Questa vista permette l'estrazione dei dati minimi per il profilo ACN

CREATE VIEW vista_conformita_acn AS
SELECT 
    a.nome_asset AS 'Asset Critico',
    s.nome_servizio AS 'Servizio Erogato',
    f.ragione_sociale AS 'Fornitore Terzo',
    c.email_diretta AS 'Punto di Contatto Incidenti'
FROM asset_critici a
INNER JOIN servizi_erogati s ON a.id_asset = s.id_asset_collegato
INNER JOIN fornitori_terze_parti f ON a.id_vendor = f.id_fornitore
INNER JOIN anagrafica_contatti c ON a.id_responsabile = c.id_contatto;

-- Esempio di utilizzo della vista per export
SELECT * FROM vista_conformita_acn;