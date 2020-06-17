
<%@page import="java.sql.*;" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Sign-Up</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Admin Sign-up</h2>
                        <form action="adsignup.jsp" method="POST" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass1" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="pass2" id="re_pass" placeholder="Re-write your password">
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" style="display: inline-block;
    background: darkorange;
    color: #fff;
    border-bottom: none;
    width: auto;
    padding: 15px 39px;
    border-radius:5px;
    margin-top: 25px;
    cursor: pointer;" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/newaddmin.png" alt="sing up image"></figure>
                        <a href="adlogin.jsp" class="signup-image-link">I am already registered</a>
                    </div>
                </div>
            </div>

      

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html> 
<%  
    out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
if(request.getParameter("email")!= null) {
String n=request.getParameter("name");
        String e=request.getParameter("email");
        String p=request.getParameter("pass1");
        String pa=request.getParameter("pass2");
        if(p.equals(pa)) {
        try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
            PreparedStatement ps=cn.prepareStatement("insert into admin(name,email,password)values(?,?,?)");
            ps.setString(1,n);
            ps.setString(2,e);
            ps.setString(3,p);
            ps.executeUpdate();
            out.println("<script>Swal.fire({icon: 'success',title: 'Successfully Registered',showConfirmButton: false,timer: 1500})</script>");

        response.sendRedirect("adlogin.jsp");
            }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        }
        else {
        out.println("Password doesnt match");
        }
    }



%>