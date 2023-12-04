--------------------------------------------------------------------------------

------------------les tables principales :

anime / manga / genre / profil / theme / voiceactor / personnage / classement / affrontement

-------------------les tables secondaires :

animegenre / animesfav / animetheme / classement / genresfav 
/ mangagenre / mangasfav / mangatheme / personnagesfav / themesfav / voiceactorsfav

------------------------les liens :

anime : animegenre / animesfav / animetheme 

manga : mangagenre / mangasfav / mangatheme 

genre : animegenre / mangagenre / genresfav

profil : animesfav / mangasfav / personnagesfav / voiceactorsfav / themesfav / genresfav

theme : animetheme / mangatheme / themesfav

voiceactor : voiceactorsfav

personnage : personnagesfav

classement : classementanime / classementmanga / classementpersonnage / classementvoiceactor

affrontement : affrontementanime / affrontementmanga / affrontementpersonnage / affrontementvoiceactor

--------------------------------------------------------------------------------

Explications de chaqu'unes des tables :

1. anime : pour y placer tout les animes

2. manga : pour y placer tout les mangas

3. genre : pour y placer tout les genres

4. profil : pour accéder les informations concernant les profils des utilisateurs

5. theme : pour y placer tout les themes

6. voiceactor : pour y placer tout les voiceactors

7. personnage : pour y placer tout les personnages

8. classement : pour regrouper les différents classements

9. affrontement : pour regrouper les différents affrontements

10. animegenre : permet de récuperer les genres exclusif aux animes

11. mangagenre : permet de récuperer les genres exclusif aux mangas

12. genresfav : permet de connaître les genres favoris d'un utilisateur (profil)

13. animetheme : permet de récuperer les themes exclusif aux animes

14. mangatheme : permet de récuperer les themes exclusif aux mangas

15. animesfav : permet de connaîtres les animes favoris d'un utilisateur (profil)

16. mangasfav : permet de connaîtres les mangas favoris d'un utilisateur (profil)

17. themesfav : permet de connaîtres les themes favoris d'un utilisateur (profil)

18. personnagesfav : permet de connaîtres les personnages favoris d'un utilisateur (profil)

19. voiceactorsfav : permet de connaîtres les voiceactors favoris d'un utilisateur (profil)

20. classementanime : regroupe les classements de touts les animes

21. classementmanga : regroupe les classement de touts les mangas

22. classementpersonnage : regroupe les classement de touts les personnages

23. classementvoiceactor : regroupe les classement de touts les voiceactors

24. affrontementanime : regroupe les affrontement de touts les animes

25. affrontementmanga : regroupe les affrontement de touts les mangas

26. affrontementpersonnage : regroupe les affrontement de touts les personnages 

27. affrontementvoiceactor : regroupe les affrontement de touts les voiceactors

--------------------------------------------------------------------------------
