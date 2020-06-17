<%@page import="java.sql.*;"%>
        <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> Password Reset</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/Reset.jpg" alt="sing up image"></figure>
                        
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Reset Password</h2>
                        <form action="PasswordReset.jsp" method="POST" class="register-form" id="login-form">

                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="your_pass" placeholder="New Password"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="repass" id="your_pass" placeholder="Confirm New Password"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit"  id="signin" class="form-submit" value="Confirm Password"/>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>

<%
    
     if(request.getParameter("email")!=null)
       { 
        String server="jdbc:mysql://127.0.0.1:3306/bookswap";
        String username="root";
        String password="1234";
              
           String pass1=request.getParameter("pass");
           String pass2=request.getParameter("repass");
           String email=(String)session.getAttribute("email"); 

                
    
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection(server,username,password);
    if(!cn.isClosed()){
               if(pass1.equals(pass2)){
                    PreparedStatement ps=cn.prepareStatement("update bookswap set password=? where email='"+email+"'");
                    ps.setString(1, pass1);
//                    ps.setString(2, pass);
                    ResultSet rs= ps.executeQuery();
               
                    if(rs.next()){
                        response.sendRedirect("user.jsp");
                    
                }
               }
               else{
                        out.println("incorrect password");
                    }
                    
                   
                }
                cn.close();
            }
            catch(Exception e){
                out.println("error"+e.getMessage());
            }
       }
%>