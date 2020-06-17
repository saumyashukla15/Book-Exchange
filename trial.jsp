<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ page import="java.sql.*;" 
                 %>
         <%
            
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
        %>

<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>

        

        <%
String title=request.getParameter("val");
try {
 if(!cn.isClosed()) {
 
 PreparedStatement ps1=cn.prepareStatement("select * from upload where title LIKE '%"+title+"%' ");
 ResultSet rs1=ps1.executeQuery();
 while(rs1.next()) {
 
 String filename=rs1.getString("filename");

%>

    
    <a href="">
                    <img src="uploads/<%=filename%>" alt="" style="hieght:700px,width:400px">
                        <!-- Hover Content -->
                        
                    </a>
                       


                        
                <%
                }
                
            }
        }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        %>
                           
       
 

    </body>
</html>
                