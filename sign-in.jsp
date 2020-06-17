<%@page import="java.sql.*;"%>
        <html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign-In</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
     <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
       function a(){
            swal("Done!", "Sign-In successfully!", "success");
        }
        </script>

    <div class="main">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="sign-up.jsp">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign In</h2>
                        <form action="sign-in.jsp" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="email" id="your_name" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="your_pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span><a href="genotp.jsp">Forgot Password</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" onclick="a()" value="Log in"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
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
              
           String email=request.getParameter("email");
           String pass=request.getParameter("pass");
           
                
    
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection(server,username,password);
    if(!cn.isClosed()){

                    PreparedStatement ps=cn.prepareStatement("select * from bookswap where email='"+email+"' AND password='"+pass+"'");
//                    ps.setString(1, email);
//                    ps.setString(2, pass);
                    ResultSet rs= ps.executeQuery();
                    if(rs.next()){
                        session.setAttribute("email",email);
                        response.sendRedirect("user.jsp");
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