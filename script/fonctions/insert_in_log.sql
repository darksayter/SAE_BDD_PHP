-- Création du déclencheur
CREATE OR REPLACE FUNCTION insert_log_profil()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_profil(id_profil) VALUES (NEW.id_profil);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;