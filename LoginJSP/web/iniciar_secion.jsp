<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!--materialize-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--icono-->
        <link rel="icon" href="img/logo50.ico">
        <title>Inicio de sesion</title>
    </head>
    <body bgcolor="#F8FEFE">
        <div class="card-panel teal lighten-2">
            <center>
                <h6>iniciar sesión</h6>
            </center>
        </div>
        <!--action="seguridad/validar_sesion.jsp" method="post" name="form_sesion"-->
        <form id="formulario_inicio" action="loginprocess.jsp" method="post" name="iniciar secion">
            <p>Nombre:</p>
            <input type="text" minlength="1" maxlength="50" name="nombre_in" id="nombre_in">
            <p>Correo electronico:</p>
            <input type="text" minlength="5" maxlength="60" name="correo_in" id="correo_in">
            <p>Contraseña:</p>
            <input type="password" minlength="8" maxlength="50" name="contrasenna_in" id="contrasenna_in">
            <button class="btn waves-effect waves-light" type="submit" name="iniciar_cesion" onclick="validar2();">Iniciar sesión
                <i class="material-icons right">send</i
            </button>
        </form>
        
        <script>
            function validar2()
            {              
                if (document.forms.formulario_inicio.correo_in.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                if (document.forms.formulario_inicio.contrasenna_in.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                if (document.forms.formulario_inicio.nombre_in.value==""){
                    alert("todos los campos deben ser llenados");
                }
            }
        </script>
    </body>
</html>
