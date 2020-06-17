<%@page import="java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Your Password</title>


    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">


    <link rel="stylesheet" href="css/style.css">
</head>

            
                    <div class="container">
                <div class="signin-content">
               
                    <div class="signin-image">
                        <figure><img src="images/updatepassword.png" alt="sing up image"></figure>
                        
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Update your password</h2>
                        <form action="pass.jsp" method="POST" class="register-form" id="login-form">
                             <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass1" id="pass" placeholder="Enter new Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="pass2" id="re_pass" placeholder="Re-write your password">
                            </div>
                           
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Change"/>
                            </div>
                        </form>
                    </div>
  

            
                </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>

</html>


<%      if(request.getParameter("pass1")!=null) {
        String pass1=request.getParameter("pass1");
        String pass2=request.getParameter("pass2");
        if(pass1.equals(pass2)) {
            String email=session.getAttribute("email").toString();
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookswap","root","1234");
           if(!cn.isClosed()) {
            PreparedStatement ps=cn.prepareStatement("update bookswap set password='"+pass1+"' where email='"+email+"' ");
            ps.executeUpdate();
            
            response.sendRedirect("sign-in.jsp");
        }}
        catch(Exception e)
        {
        out.println(e.getMessage());
        }
        
        }
        else
            out.println("Password Mismatch");
}


%>