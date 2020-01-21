<%-- 
    Document   : index
    Created on : 8 ene 2020, 22:21:36
    Author     : oga
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/91471c0d24.js" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Image and text -->
        <nav class="navbar navbar-light bg-primary justify-content-center">
            <h1 >LISTADO DE USUARIO</h1>
        </nav>

        <div class="row justify-content-center mt-5">
         <div class="col-md-7">
              
            <table class="table">                
                <thead class="">
                    
                    <tr class="bg-success text-center">
                        <th colspan="5">MANTENIMIENTO DE USUARIOS</th>
                        <th> <a href="nuevo.jsp">
                                <i class="fas fa-user-plus fa-2x text-warning"></i></a></th>
                    </tr>
                    <tr class="thead-dark">
                        <th scope="col">CODIGO</th>
                        <th scope="col">NOMBRE</th>
                        <th scope="col">EDAD</th>
                        <th scope="col">SEXO</th>
                        <th scope="col">PASSWORD</th>
                        <th scope="col">ACCIONES</th>
                    </tr>
                    </tr>
                </thead>
               
                <% 
                Connection cnx =null;
                Statement sta=null;
                ResultSet rs =null;
                
                try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/crudjsp?user=root&password=1990");
                 
                sta=cnx.createStatement();
                rs=sta.executeQuery("select * from usuario");
                
                while (rs.next()){
                
                       %> 
                       
                        <tbody>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td> <a href="editar.jsp?cod=<%=rs.getString(1)%>"><i class="far fa-edit text-info fa-2x"></i></a> ||  <a href="eliminar.jsp?cod=<%=rs.getString(1)%>"> <i class="fas fa-user-times text-danger fa-2x"></i></a></td>
                    </tr>

                </tbody>
                       
                
                       <%
                }
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){
                
                }

              %>
                
            </table>

        </div>   
        </div>
        

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
