
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verification</title>
    </head>
    <body>
        <h1>Enter your otp here</h1>
        <form action="verify.jsp" method="post">
            <input type="text" placeholder="enter otp" name="otp">
            <input type="submit">
        </form>
    </body>
</html>-->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verification</title>


    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">


    <link rel="stylesheet" href="css/style.css">
</head>
<body>
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/updatepassword.png" alt="sing up image"></figure>
                        
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Enter otp here</h2>
                        <form action="verify.jsp" method="POST" class="register-form" id="login-form">
                             <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-smartphone-setting"></i></label>
                                <input type="password" name="otp" id="pass" placeholder="Enter otp"/>
                            </div>
                     
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Submit"/>
                            </div>
                        </form>
                    </div>
                
            </div>
            </div>
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
<%
if(request.getParameter("otp")!=null) {
    String motp=session.getAttribute("otp").toString();
    String uotp=request.getParameter("otp");
    if(motp.equals(uotp)) {
        response.sendRedirect("pass.jsp");
    }
    else {
    out.println("Mismatch otp");
    }
}
%>