<%-- 
    Document   : editar
    Created on : 10 ene 2020, 0:08:06
    Author     : oga
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <div class="row justify-content-center">
            <div class="col-md-6">
        <%
                 
                    
                    String cod = request.getParameter("cod");
                    
                    
                Connection cnx =null;
                Statement sta=null;
                ResultSet rs =null;
                
                 try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/crudjsp?user=root&password=1990");
                
                   sta=cnx.createStatement();
                   rs=sta.executeQuery("select * from usuario where CodUser ='"+cod+"'");
                   
                  while(rs.next()){
                   
                %>
                <form action="">
                    <div class="form-group">
                        <label for="codigo">CODIGO</label>
                        <input type="text" value="<%=rs.getString(1)%>" class="form-control" name="codigo" aria-describedby="emailHelp" readonly="readonly">

                    </div>
                    <div class="form-group">
                        <label for="nombre">NOMBRE</label>
                        <input type="text" value="<%=rs.getString(2)%>" class="form-control" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="edad">EDAD</label>
                        <input type="text" class="form-control" value="<%=rs.getString(3)%>" name="edad">
                    </div>                   
                    <div class="form-group">
                        <label for="sexo">SEXO</label>
                        <input type="text" value="<%=rs.getString(4)%>" class="form-control" name="sexo">
                    </div>
                    <div class="form-group">
                        <label for="pass">CONTRASEÑA</label>
                        <input type="text" class="form-control" value="<%=rs.getString(5)%>" name="pass">
                    </div>                   
                    <button type="submit" name=btngrabar class="btn btn-primary">Editar</button>
                </form>
               <%
                
                   }
}
                    catch(Exception e){
                    
                    }

                  if(request.getParameter("btngrabar")!=null){
                    
                    String codu = request.getParameter("codigo");
                    String nombre = request.getParameter("nombre");
                    int edad = Integer.parseInt(request.getParameter("edad"));
                    String sexo = request.getParameter("sexo");
                    String pass = request.getParameter("pass");
              
               sta.executeUpdate("update usuario set nomUsur='"+nombre+"',edad="+edad+",sexo='"+sexo+"',passUser='"+pass+"' where CodUser='"+codu+"'" );
               request.getRequestDispatcher("index.jsp").forward(request,response);

}
               
               %> 
             

            </div>
        </div>
    </body>
</html>
