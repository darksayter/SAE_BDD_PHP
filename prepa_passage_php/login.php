<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="/asset/CSS/style_login.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">

                <div class="signup">
                    <form>
                        <label for="chk" aria-hidden="true">Sign up</label>
                        <input type="text" name="txt" placeholder="User name" required="">
                        <input type="password" name="pswd" placeholder="Password" required="">
                        <button>Créer un compte</button>
                    </form>
                </div>

                <div class="login">
                    <form action="check_login.php" method="POST">
                        <label for="chk" aria-hidden="true">Login</label>
                        <input type="password" name="pswd" placeholder="Password" required="">
                        <button>Se connecter</button>
                    </form>
                </div>
        </div>
    </body>
</html>
