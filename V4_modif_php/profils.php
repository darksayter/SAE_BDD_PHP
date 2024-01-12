<?
  require ("header.php");



    $profils = [
        [
            'Pseudo' => 'Alex',
            'Nom' => 'fe',
            'Prenom' => 'rzis',
            'image' => 'https://fakeimg.pl/50x50/'
        ],
        [
            'Pseudo' => 'Clem',
            'Nom' => 'fe',
            'Prenom' => 'rzis',
            'image' => 'https://fakeimg.pl/50x50/'
        ]
    ];
?>

    <div id="contenu">
        <div id="profil">
            <?php foreach ($profils as $profil): ?>
                <div id="profil<?= $profil['Pseudo'] ?>">
                    <a href="profil.php"><img src="<?= $profil['image'] ?>" alt="<?= $profil['Pseudo'] ?>"></a>
                    <p><?= $profil['Pseudo'] ?> (<?= $profil['Prenom'] ?> <?= $profil['Nom'] ?>)</p>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

<?

      require ("assets/HTML/footer.html");
