<%-- 
    Document   : nuevo
    Created on : 9 ene 2020, 1:31:05
    Author     : oga
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center">AGREGAR USUARIO</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">

                <form action="">
                    <div class="form-group">
                        <label for="codigo">CODIGO</label>
                        <input type="text" class="form-control" name="codigo" aria-describedby="emailHelp">

                    </div>
                    <div class="form-group">
                        <label for="nombre">NOMBRE</label>
                        <input type="text" class="form-control" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="edad">EDAD</label>
                        <input type="text" class="form-control" name="edad">
                    </div>                   
                    <div class="form-group">
                        <label for="sexo">SEXO</label>
                        <input type="text" class="form-control" name="sexo">
                    </div>
                    <div class="form-group">
                        <label for="pass">CONTRASEÑA</label>
                        <input type="text" class="form-control" name="pass">
                    </div>                   
                    <button type="submit" name=btngrabar class="btn btn-primary">Grabar Usuario</button>
                </form>
                
                <%
                    if(request.getParameter("btngrabar")!=null){
                    
                    String cod = request.getParameter("codigo");
                    String nombre = request.getParameter("nombre");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String sexo = request.getParameter("sexo");
                    String pass = request.getParameter("pass");
                    
                Connection cnx =null;
                Statement sta=null;
                ResultSet rs =null;
                
                 try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/crudjsp?user=root&password=1990");
                
                   sta=cnx.createStatement();
                   sta.executeUpdate("insert into usuario values('"+cod+"','"+nombre+"',"+edad+",'"+sexo+"','"+pass+"')");
                   request.getRequestDispatcher("index.jsp").forward(request,response);
                    }catch(Exception e){
                    out.println(e+"error");
                    }
}
                %>

            </div>
        </div>
    </body>
</html>
