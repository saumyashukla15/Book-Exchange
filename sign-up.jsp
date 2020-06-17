<!DOCTYPE html>




<%@page import="java.sql.*;"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form action="sign-up.jsp" method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="phone"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="phone" id="phone" placeholder="Your Phone Number"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="sign-in.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

 <%
    
     if(request.getParameter("email")!=null)
       { 
        String server="jdbc:mysql://127.0.0.1:3306/bookswap";
        String username="root";
        String password="1234";
              
           String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
                
    
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn=DriverManager.getConnection(server,username,password);
    if(!cn.isClosed()){

                    PreparedStatement ps=cn.prepareStatement("insert into bookswap(name,phone,address,email,password)values(?,?,?,?,?)");
                    ps.setString(1,name);
                    ps.setString(2,phone);
                    ps.setString(3,address);
                    ps.setString(4,email);
                    ps.setString(5,pass);
                    ps.executeUpdate();
                    
                   
                }
                cn.close();
            }
            catch(Exception e){
                out.println("error"+e.getMessage());
            }
       }
%>