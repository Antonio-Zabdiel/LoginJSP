<%@page import="bean.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page import="bean.LoginBean"%>
<%@page import="bean.LoginDao"%>

<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Login Accesso</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/landing-page.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
        <!--materialize-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <div class="content-section-a">

        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    
                    <hr class="section-heading-spacer">
                    
                    <div class="clearfix"></div>
                    
                    
<%
            boolean status=LoginDao.validate(obj);
            String  qry="SELECT * FROM usuario where usr_nombre=? and usr_correo=? and usr_contrasenna=?";
            Connection con=ConnectionProvider.getCon();
            PreparedStatement ps;
            ResultSet rs;
            String usuario=(String)request.getParameter("nombre_in");
            String email=(String)request.getParameter("correo_in");
            String password=(String)request.getParameter("contrasenna_in");
            ps=con.prepareStatement("SELECT * FROM usuario where usr_nombre=? and usr_correo=? and usr_contrasenna=?");
            ps.setString(1, usuario);
            ps.setString(2,email);
            ps.setString(3, password);
            rs=ps.executeQuery();
            


if(rs.next()){    
    session.setAttribute("session","TRUE");
    out.println("Felicidades, has ingresado correctamente\n" );
    response.sendRedirect("editar.jsp");//redireccion si se acepta+
%>
<br><br><a href="electronica.jsp">Ingresar</a>
<%
}
else
{
HttpSession sesion=request.getSession();
    
out.print("Email: " + email);
out.print("Usuario: " + usuario +"Sesion: " + sesion);
out.print("Pass: " + password);
out.print("Lo sentimos, correo y/o contraseña incorrecta, favor de revisar");
}
rs.close();

%>
                <br><br><a href="index.jsp">Regresar al inicio</a>
                            
                    <hr class="section-heading-spacer">
                    
                
                </div>
                
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/registro.jpg" alt="">
                </div>
                
            </div>

        </div>
        

    </div>
        
    </body>
</html>