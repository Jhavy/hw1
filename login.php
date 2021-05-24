<?php
// Verifica se esiste già una sessione attiva
require 'auth.php';
$userID=checkAuth();
if ($userID!=0) {
    header("Location: home.php");
    exit;
}

require 'dbconfig.php';
$error=null;
// Controlliamo se username e password sono inseriti
if(!empty($_POST["username"]) && !empty($_POST["password"]) )
{
    # Avviamo la connessione al db
    $conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));

    # Effettuiamo l'escape del nome utente e della password, e li salviamo
    $username=mysqli_real_escape_string($conn, $_POST['username']);
    $password=mysqli_real_escape_string($conn, $_POST["password"]);
    $password=hash('sha256',$password);
    $password=base64_encode($password);
    

    # Creiamo la query per ricercare i dati corrispondenti a quell'username nella tabella 'user' del db
    $query="SELECT id,username,password FROM user WHERE username='".$username."'";

    # Salviamo la tabella risultante fornita dalla query
    $res=mysqli_query($conn,$query) or die(mysqli_error($conn));

    # Verifichiamo che ci sia effettivamente un utente registrato con l'username inserito
    if(mysqli_num_rows($res)>0)
    {
        
        # Se siamo qui vuol dire che l'username esiste nel database, adesso verifichiamo se coincide
        # la password associata ad esso

        # $entry corrisponde all'array associativo con i campi: id, username e pw
        $entry=mysqli_fetch_assoc($res);
        # Adesso controlliamo effettivamente se la password inserita nel login corrisponde alla reale 
        # password associata a quel nome utente

    
        if($password == $entry['password'])
        {
            session_start();
            # Se la password è quella giusta creiamo la sessione
            $_SESSION["_username"]=$entry['username'];
            $_SESSION["_user_ID"]=$entry['id'];

            # Adesso che abbiamo autenticato l'utente, lo reindirizziamo nella home
            header("Location: home.php");
            mysqli_free_result($res);
            mysqli_close($conn);
            exit;
        }
    }
    # Altrimenti la password non è valida e salviamo l'errore
    $error="Username o password errati";
}

// Se i dati non sono stati inseriti segnala l'errore
else if(isset($_POST["username"]) || isset($_POST["password"])){
    $error="Inserisci nome utente/password";
}
?>

<html>

    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel='stylesheet' href='styles/login_stylesheet.css'>
        <script src='./scripts/login.js' defer></script>
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
                <div class="spoiler">
      
                </div> 

                <div class="dati">
                    <span id="loginSpan">Login</span>
                    <form name="login" method="post">
                        <div class="username">
                            <label>
                                Username
                                <input type="text" name="username">
                            </label>
                        </div>

                        <div class="password">
                            <label>
                                Password
                                <input type="password" name="password">
                            </label>
                        </div>

                        <div>
                            <input type="submit" value="Accedi" id="button">
                        </div>
                    </form>
                
                <?php
                if(isset($error))
                {
                    echo"<span class='error'>$error</span>";
                }
                    ?>
                    
                    <div id="register">
                    <p>
                    Non hai un account? <a href="signup.php">Registrati</a>
                    </p>
                    </div>
                </div>
            
                <div class="spoiler">
                    
                </div>
            </div>
        </section>
    </body>
</html>