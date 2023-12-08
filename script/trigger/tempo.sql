-- trigger pour les victoires ou défaites en affrontement --
DROP TRIGGER IF EXISTS `trigger_victoire_defaite`;
DELIMITER $$
CREATE TRIGGER `trigger_victoire_defaite` AFTER UPDATE ON `affrontement`
FOR EACH ROW
BEGIN
    IF NEW.vote_personnage1 > NEW.vote_personnage2 THEN
        UPDATE Personnage SET victoires = victoires + 1 WHERE id_pers = NEW.id_personnage1;
        UPDATE Personnage SET defaites = defaites + 1 WHERE id_pers = NEW.id_personnage2;
    ELSEIF NEW.vote_personnage1 < NEW.vote_personnage2 THEN
        UPDATE Personnage SET victoires = victoires + 1 WHERE id_pers = NEW.id_personnage2;
        UPDATE Personnage SET defaites = defaites + 1 WHERE id_pers = NEW.id_personnage1;
    END IF;
END$$
DELIMITER ;

-- trigger pour les étapes de chaque séries dans le tournoi --
DROP TRIGGER IF EXISTS `trigger_etapes`;
DELIMITER $$
CREATE TRIGGER `trigger_etapes` AFTER UPDATE ON `affrontement`
FOR EACH ROW
BEGIN
    IF NEW.vote_personnage1 > NEW.vote_personnage2 THEN
        UPDATE TournoiPersonnage SET etapes = etapes + 1 WHERE id_tournoipersonnage = NEW.id_tournoipersonnage;
    ELSEIF NEW.vote_personnage1 < NEW.vote_personnage2 THEN
        UPDATE TournoiPersonnage SET etapes = etapes + 1 WHERE id_tournoipersonnage = NEW.id_tournoipersonnage;
    END IF;
END$$
DELIMITER ;