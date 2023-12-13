<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./assets/CSS/style_login.css">
        <title>Login</title>
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <form action="check_login.php" method="POST">
                <label for="login">Username:</label>
                <input type="text" id="login" name="login" required>
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>
