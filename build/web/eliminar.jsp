<%-- 
    Document   : eliminar
    Created on : 9 ene 2020, 18:59:52
    Author     : oga
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        
        
        
           <%
                   
                    
                    String cod = request.getParameter("cod");
                    
                    
                Connection cnx =null;
                Statement sta=null;
                ResultSet rs =null;
                
                 try{
                Class.forName("com.mysql.jdbc.Driver");
                cnx=DriverManager.getConnection("jdbc:mysql://localhost/crudjsp?user=root&password=1990");
                
                   sta=cnx.createStatement();
                   sta.executeUpdate("delete from usuario where CodUser='"+cod+"'");
                   request.getRequestDispatcher("index.jsp").forward(request,response);
                    }catch(Exception e){
                    out.println(e+"error");
                    }

                %>
    </body>
</html>
