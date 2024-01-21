CALL deletealltournoianime();

CALL CreerTournoiAnime(0, false, 4);

CALL InitialiserAffrontementsAnime(1, ARRAY[5114,11061,38524,9253]);

CALL MettreAJourAffrontementAnime(1,5114,11061,1,3);

CALL MettreAJourAffrontementAnime(1,38524,9253,1,3);

CALL MettreAJourAffrontementAnime(1,11061,9253,15,3);





SELECT * FROM MangaLePlusPopulaire(5);

SELECT * FROM AnimeAvecLePlusEpisodes(5);

SELECT * FROM RechercherAnimeParNom('rezero');