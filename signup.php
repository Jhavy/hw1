<?php
require 'dbconfig.php';
if (!empty($_POST["username"]) && !empty($_POST["password"]) && !empty($_POST["password_confirm"]))
{
    // Ricevuto form controllato dal JS, effettuo un ulteriore check del form

    $error = array();
    $conn = mysqli_connect($dbconfig['host'], $dbconfig['user'], $dbconfig['password'], $dbconfig['name']);
    $username = mysqli_real_escape_string($conn, $_POST["username"]);
    $query = "SELECT username FROM user WHERE username = '".$username."'";

    $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

    if(mysqli_num_rows($res)>0)
    {
        // Username in uso
        $error[] = "Username già utilizzato";
    }

    if(strlen($_POST["password"]) < 6) {
        $error[] = "Password troppo corta";
    } 

    if(strcmp($_POST["password"], $_POST["password_confirm"]) != 0) {
        $error[] = "Le password non coincidono";
    }

    // Se non sono presenti errori, si prosegue con la registrazione dei dati nel db, altrimenti
    // ricarica la pagina
    if (count($error) == 0) {
        $password=mysqli_real_escape_string($conn, $_POST["password"]);
        $password=hash('sha256',$password);
        $password=base64_encode($password);

        $query="INSERT INTO user(username,password) VALUES('$username','$password')";

        if (mysqli_query($conn, $query)) {
            session_start();
            $_SESSION["_username"] = $_POST["username"];
            $_SESSION["_user_ID"] = mysqli_insert_id($conn);
            mysqli_close($conn);
            header("Location: home.php");
            exit;
        } 
        else {
            $error[]="Errore di connessione al Database";
        }

    }

    mysqli_close($conn);
}
?>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <script src='./scripts/signup.js' defer></script>
        <title>Sign Up</title>
        <link rel='stylesheet' href='styles/signup_stylesheet.css'>
    </head>

    <body>
        <header>
            <div id="sfondo2"></div>
            <div id='title'>
                <div class='line'></div>
                <h1>MotoGP™|2021</h1>
                <p>racing is life</p>
                <div class='line'></div>
            </div>
        </header>

        <section>
            <div id="sfondo"></div>
            <div id="main">
                <div class="dati">
                    <span id="signupSpan">Sign-Up</span>

                    <form name="new_user_data" method="post">
                        <div class="username">
                            <label>
                                Username</label>
                                <input type="text" name="username">
                            <div id="error_user" class="error hidden"> Il nome utente deve avere almeno 4 caratteri </div>
                            <div id="error_user2" class="error hidden"> Il nome utente è stato già utilizzato</div>
                        </div>

                        <div class="password">
                            <label>
                                Password</label>
                                <input type="password" name="password">
                            <div id="error_pw1" class="error hidden"> La password deve avere minimo 6 caratteri </div>
                        </div>

                        <div class="confirm_password">
                            <label id="conferma">
                                Conferma Password</label>
                                <input type="password" name="password_confirm">
                                <div id="error_pw2" class="error hidden"> Le password non coincidono </div>
                        </div>

                        <div>
                            <input type="submit" value="Registrati" id="submit">
                        </div>

                        <div id="errorList">
                        </div>
                        
                    </form>
                    <div id="accedi">Hai già un account? <a href="login.php">Accedi</a>
                    
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>