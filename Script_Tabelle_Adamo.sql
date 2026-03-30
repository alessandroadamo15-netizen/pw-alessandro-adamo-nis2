-- SCRIPT CREAZIONE STRUTTURA DATABASE NIS2
-- Studente: Alessandro Adamo

CREATE TABLE anagrafica_contatti (
    id_contatto INT PRIMARY KEY,
    nominativo VARCHAR(100) NOT NULL,
    email_diretta VARCHAR(100) UNIQUE,
    ruolo_aziendale VARCHAR(50)
);

CREATE TABLE fornitori_terze_parti (
    id_fornitore INT PRIMARY KEY,
    ragione_sociale VARCHAR(100) NOT NULL,
    servizio_gestito VARCHAR(100),
    livello_criticita ENUM('Alta', 'Media', 'Bassa') DEFAULT 'Media'
);

CREATE TABLE asset_critici (
    id_asset INT PRIMARY KEY,
    nome_asset VARCHAR(100) NOT NULL,
    tipo_asset VARCHAR(50), 
    id_responsabile INT,
    id_vendor INT,
    FOREIGN KEY (id_responsabile) REFERENCES anagrafica_contatti(id_contatto),
    FOREIGN KEY (id_vendor) REFERENCES fornitori_terze_parti(id_fornitore)
);

CREATE TABLE servizi_erogati (
    id_servizio INT PRIMARY KEY,
    nome_servizio VARCHAR(100) NOT NULL,
    descrizione_funzionale TEXT,
    id_asset_collegato INT,
    FOREIGN KEY (id_asset_collegato) REFERENCES asset_critici(id_asset)
);