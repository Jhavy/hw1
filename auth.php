<?php
    session_start();
    function checkAuth() {
        if(isset($_SESSION['_user_ID'])) {
            return $_SESSION['_user_ID'];
        } 
        else 
        {
            return 0;
        }   
    }
?>