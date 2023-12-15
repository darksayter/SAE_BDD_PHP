-- Création du déclencheur associé à la table users
CREATE TRIGGER log_user_trigger
AFTER INSERT
ON users
FOR EACH ROW
EXECUTE FUNCTION insert_log_user;
