<%@page  import="java.sql.*"%>
<%
            
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
        %>
        <html><head></head>
            <body>
<%
String search=request.getParameter("val");
try
{
   Class.forName("com.mysql.jdbc.Driver");
   Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookswap","root","1234");
   if(!cn.isClosed()){
       PreparedStatement ps=cn.prepareStatement("Select * from upload where title %'"+search+"'%");
       ResultSet rs=ps.executeQuery();
       while(rs.next()){
           String filename=request.getParameter("filename");
           
           %>
           <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="uploads/<%=filename%>" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p></p>
                            <h4></h4>
                        </div>
                    </a>
                </div>

                
           <%
       }
       
   }
   }
catch(Exception e){
    out.println(e.getMessage());
}
%>
            </body>
        </html>