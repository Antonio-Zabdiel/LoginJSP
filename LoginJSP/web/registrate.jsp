<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="clases.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Declaración de las variables 
    String nombre="";
    String apellido="";
    String correo="";
    String telefono="";
    String direccion="";
    String contrasenna="";
    
    // Verificar el método por que se reciben los datos
    //out.println("El método que se está utilizando es: "+request.getMethod());
    
    // Se comprueba que haya parametros definidos y con valores
    if(request.getMethod()=="GET" && request.getParameter("nombre") != null){
        
        //Se establecen las variables para realizar la consulta SQL
        System.out.println("*****************INSERTAR JSP**************************");
        Connection conn = ConexionBD.conectarBaseDatos();
        Statement st = null;
        ResultSet rs = null;
    
        //Se asignan valores a las variables, de acuerdo con los parametros recibidos
        nombre = request.getParameter("nombre");
        apellido = request.getParameter("apellido");
        correo = request.getParameter("correo");
        telefono = request.getParameter("telefono");
        direccion = request.getParameter("direccion");
        contrasenna = request.getParameter("contrasenna");
        
        String query="";
        try{
            // Se crea un Statement, para realizar la consulta
            st = conn.createStatement();
            
            // Se arma el query
            //query ="INSERT INTO producto (id_producto, nombre, cantidad) values("+id_producto+",'"+nombre+"',"+cantidad+");";
            query ="INSERT INTO usuario(usr_nombre,usr_apellido,usr_correo,usr_telefono,usr_direccion,usr_contrasenna) VALUES('"+nombre+"','"+apellido+"','"+correo+"','"+telefono+"','"+direccion+"','"+contrasenna+"');";
            //INSERT INTO usuario(usr_nombre,usr_apellido,usr_correo,usr_telefono,usr_direccion,usr_contrasenna) VALUES ('nombre','apellido','correo','numero','direccion','contrasenna');
            //out.println("<br>El Query Ejecutado es: <br>"+query);
            // Se ejecuta el query
            st.execute(query);
            
        }catch(Exception e){
            out.println("<br>No se pudo completar la operación: <br>"+e.getMessage()+"<br>");
            out.println(query);
        }
        /*
        * Se debe cerrar la conexión si o sí 
        * hay Resultset o un Statement.
        */
        finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqlEx) {
            } // ignore
            rs = null;
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException sqlEx) {
                } // ignore
                st = null;
            }
        }
        
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--materialize-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="icon" href="img/logo50.ico">
        <title>Registro</title>
    </head>
    <body bgcolor="#F8FEFE">
        <div class="card-panel teal lighten-2">
            <center>
                <h6>registrate</h6>
            </center>
        </div>
        <form id="formulario_registro" action="registrate.jsp" method="get">
            <p>Nombre:</p>
            <input type="text" minlength="2" maxlength="50" name="nombre" id="nombre">
            
            <p>Apellido:</p>
            <input type="text" minlength="2" maxlength="50" name="apellido" id="apellido">
            
            <p>Correo electronico:</p>
            <input type="text" minlength="5" maxlength="100" name="correo" id="correo">
            
            <p>telefono:</p>
            <input type="text" minlength="10" maxlength="10" name="telefono" id="telefono">
            
            <p>direccion</p>
            <input type="text" minlength="1" maxlength="500" name="direccion" id="direccion">
            
            <p>Contraseña:</p>
            <input type="password" minlength="8" maxlength="50" name="contrasenna" id="contrasenna">
            
            <button class="btn waves-effect waves-light" type="submit" name="validar_registrar" onclick="validar();">
                registrar<i class="material-icons right">send</i>
            </button>
        </form>
        
        <script>
            function validar(){
                if (document.forms.formulario_registro.nombre.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                else if (document.forms.formulario_registro.apellido.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                else if (document.forms.formulario_registro.telefono.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                else if (document.forms.formulario_registro.correo.value==""){
                    alert("todos los campos deben ser llenados");
                }
                
                else if (document.forms.formulario_registro.contrasenna.value==""){
                    alert("todos los campos deben ser llenados");
                }
                else{
                    alert("se ha registrado correctamente");
                }
                
            }
                
        </script>
        
    </body>
</html>
