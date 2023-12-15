-- Création du déclencheur
CREATE OR REPLACE FUNCTION insert_log_user()
RETURNS TRIGGER AS $$
BEGIN
    -- Insérer une nouvelle ligne dans log_users avec l'ID de l'utilisateur et le temps actuel
    INSERT INTO log_users (user_id) VALUES (NEW.user_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;