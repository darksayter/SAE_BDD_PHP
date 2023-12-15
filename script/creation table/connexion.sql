-- Création de la table 'users'
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    cree_a TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table 'log_users'
CREATE TABLE log_users (
    log_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création du déclencheur
CREATE OR REPLACE FUNCTION insert_log_user()
RETURNS TRIGGER AS $$
BEGIN
    -- Insérer une nouvelle ligne dans log_users avec l'ID de l'utilisateur et le temps actuel
    INSERT INTO log_users (user_id) VALUES (NEW.user_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Création du déclencheur associé à la table users
CREATE TRIGGER log_user_trigger
AFTER INSERT
ON users
FOR EACH ROW
EXECUTE FUNCTION insert_log_user;
