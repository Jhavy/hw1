document.querySelector(".username input").addEventListener("blur",checkUsername);
document.querySelector(".password input").addEventListener("blur",checkPassword);
document.querySelector(".confirm_password input").addEventListener("keyup",checkConfirmPassword);
const formStatus = {};
document.getElementById('submit').disabled=true;

function checkUsername(event)
{
    const user=event.currentTarget.value;
    
    if(!/^[a-zA-Z0-9_]{4,15}$/.test(user))
    {
        // Nome utente non valido
        formStatus.username=false;
        document.querySelector("#error_user").classList.remove("hidden");
    }
    else{
        // Effettua fetch verso il db per vedere se l'username è libero
        // ************************************************************
        fetch("check_username.php?q="+encodeURIComponent(user)).then(onResponse).then(jsonCheckUsername);
        document.querySelector("#error_user").classList.add("hidden");
    }
    checkForm();
}

function onResponse(response) {
    if (response.ok){
        return response.json();
    }
    else return null;
}

function jsonCheckUsername(json) {
    
    if(json.presente)
    {
        // Username già in uso
        formStatus.username=false;
        document.querySelector("#error_user2").classList.remove("hidden");
    }
    else{
        // Username libero
        formStatus.username=true;
        document.querySelector("#error_user2").classList.add("hidden");
    }
    checkForm();
}


function checkPassword(event)
{
    const passwordIn=event.currentTarget.value;
    if(passwordIn.length > 5)
    {
        formStatus.password=true;
        document.querySelector("#error_pw1").classList.add("hidden");
    }
    else{
        formStatus.password=false;
        document.querySelector("#error_pw1").classList.remove("hidden");
    }
    checkForm();
}

function checkConfirmPassword(event)
{
    const passwordConf=event.currentTarget.value;
    
    if(passwordConf== document.querySelector(".password input").value)
    {
        // le pw corrispondono
        formStatus.confirmPassword=true;
        document.querySelector("#error_pw2").classList.add("hidden");
    }
    else{
        // le pw non corrispondono
        formStatus.confirmPassword=false;
        document.querySelector("#error_pw2").classList.remove("hidden");
    }
    checkForm();
}

function checkForm()
{
    if(Object.keys(formStatus).length !== 3 || Object.values(formStatus).includes(false))
    {
        document.getElementById('submit').disabled=true;
    }
    else{
        document.getElementById('submit').disabled=false;
    }
}
