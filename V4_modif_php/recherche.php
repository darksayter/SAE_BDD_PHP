<?php if(@$afficher=="oui") { ?>
<div id="contenu">
    <div id="nbr"><?=count($tab)." ".(count($tab)>1?"résultats trouvés":"résultat trouvé") ?> </div> 
    <ol>
        <?php for ($i=0; $i<count($tab); $i++) { ?>
            <li><?php echo $tab[$i]["title"] ?> </li>
        <?php } ?>
    </ol>    
</div>
<?php } ?>