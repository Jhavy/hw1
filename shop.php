<?php
    require 'auth.php';
    $userID=checkAuth();
    if ($userID==0) {
        header("Location: login.php");
        exit;
    }

    require 'dbconfig.php';

    
    if(!empty($_POST["id_prodotto"]))
    {
        $id_prodotto=$_POST["id_prodotto"];
        $nome_prodotto=$_POST["nome_prodotto"];
        $qta_prodotto=$_POST["qta_prodotto"];

        $qta_tot=0;
        foreach($qta_prodotto as $qta_articolo)
        {
            $qta_tot=$qta_tot + ((int) $qta_articolo);
        }

        //INSERIRE NEL DB L'ORDINE, ARRIVANO IN POST 3 ARRAY, ID_PRODOTTO, NOME_PRODOTTO E QTA_PRODOTTO
        $conn=mysqli_connect($dbconfig['host'],$dbconfig['user'],$dbconfig['password'],$dbconfig['name'])
      or die(mysqli_error($conn));


        //Inserire dati nella tabella ORDINE: id=codice dell'insert, id_user prende la var di sessione, e qta_acquistati dipende 
        //dalla lunghezza degli array arrivati in POST

        $query="SELECT * FROM ordine";
        $res=mysqli_query($conn, $query);
        $id_ordine=mysqli_num_rows($res);

        $query2="INSERT INTO ordine VALUES($id_ordine,$userID,$qta_tot)";
        mysqli_query($conn,$query2);

        //Adesso inseriamo i dati nella tabella subOrdine
            
        $i=0;
        foreach($id_prodotto as $articolo)
        {
            
            $id_articolo=(int)$id_prodotto[$i];
            $nome_articolo=$nome_prodotto[$i];
            $nome_articolo=mysqli_real_escape_string($conn, $nome_articolo);
            $qta_articolo=(int)$qta_prodotto[$i]; 
            
            $query3="INSERT INTO subOrdine VALUES($id_ordine,$id_articolo,'".$nome_articolo."',$qta_articolo)";
           
            mysqli_query($conn,$query3);
            $i++;
        } 
        

      mysqli_close($conn);
      header("Location: ordini.php");
        exit;
    }
    
?>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Shop</title>
        <link rel='stylesheet' href='styles/shop.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@500&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
        <script src="scripts/shop.js" defer></script>
    </head>

    <body>
            <header>
                <div></div>
                <nav>
                    <div id='links'>
                        <a href='home.php'>Home</a>
                        <a href='teams.php'>teams</a>
                        <a href='standings.php'>Standings</a>
                        <a href='shop.php' id="shop">Shop</a>
                        <a href='ordini.php'>orders</a>
                        
                        
                        
                    </div>
                    <div id='loghi'>
                    <img class='logo' src='images/fim.png'>
                    <img class='logo' src='images/logo.svg'>
                    </div>
                    <div id='menu'>
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </nav>

                <div class="logout">
                    <?php
                    echo "<span> 
                    Salve ".$_SESSION['_username']."
                    </span>";
                    ?>
                    <a href="logout.php">  logout </a>
                </div>

                <div id='title'>
                    <div class='line'></div>
                    <h1>Tickets 2021</h1>
                    <div class='line'></div>
                </div>

                <a id="ordini" href="ordini.php">I miei ordini</a>
            </header>

            

        <section>
        <div id="modal-view" class="hidden"></div>

            <img src="images/carrello.png" id="carrelloPulsante">
            <div id="carrello" class="hidden"></div>
            
            <div id="productList">
            
            </div> 

        </section>
       

        <footer>
            
            <h1>
                dieei unict
            </h1>
            <p>
                    Jhaveil Calvino - O46002117
            </p>
        </footer>
    </body>
</html>