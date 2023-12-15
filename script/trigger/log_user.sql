-- Création du déclencheur associé à la table users
CREATE TRIGGER log_profil_trigger
AFTER INSERT
ON Profil
FOR EACH ROW
EXECUTE FUNCTION insert_log_profil();
