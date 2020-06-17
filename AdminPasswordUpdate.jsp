
<!DOCTYPE html>
<%@ page import="java.sql.*;" %>
                 
         <%
            
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
        %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Update Details</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    

</head>

<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
      



                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="UpdateUserInfo.jsp">Update Profile</a></li>
                    <li><a href="UpdatePassword.jsp">Update Password</a></li>
                    
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="Upload.jsp" class="btn amado-btn mb-15">Upload</a>
                <a href="#" class="btn amado-btn active">New Request</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
           
        </header>
        <!-- Header Area End -->

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h3>Update Profile</h3>
                            </div>
<% try {    
           String e= session.getAttribute("email").toString();
                
            PreparedStatement ps=cn.prepareStatement("select * from admin where email='"+e+"'");
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                String name=rs.getString("name");
                String phone=rs.getString("phone");
                String email=rs.getString("email");
                String dob=rs.getString("dob");
                String password=rs.getString("Description");
            %>
               
                            <form action="AdminPasswordUpdate.jsp" method="post">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <input type="text" name="name" class="form-control" id="name"  placeholder=" Name" value="<%=name%>" required>
                                    </div><br>
                                   <div class="col-12 mb-3">
                                        <input type="email"  name="email" class="form-control" id="email" placeholder="Email" value="<%=email%>" >
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="text" name="phone" class="form-control" id="phone"  placeholder="Phone No" value="<%=phone%>" >
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <input type="date"  name="dob" class="form-control"   >
                                    </div>
                                    
                                    
                                    <div class="col-12 mb-3">
                                        <textarea name="Description" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="About Me"></textarea>
                                    </div>

                                 <div class="col-12">
                                        <div class="custom-control custom-checkbox d-block mb-2">
                                            <input type="checkbox" class="custom-control-input" id="customCheck2" required>
                                            <label class="custom-control-label" for="customCheck2">Save Info</label>
                                        </div>
                                         <div class="cart-btn mt-100">
                                <input type="submit" class="btn amado-btn w-100" value="Update">
                            </div>
                                        
                                    </div>
                                     </div>
                                    </form>
                        </div>
                               
               
                        </div>
                    
    <%
             
            }
        }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        %>
        <% 
            
           if(request.getParameter("email")!=null) { 
               
    
               String email2= session.getAttribute("email").toString();
        try {
            String name1=request.getParameter("name");
            String phone4=request.getParameter("phone");
            String dob=request.getParameter("dob");
             
            String descritipn=request.getParameter("description");
         
            PreparedStatement ps1=cn.prepareStatement("update admin set name=?,phone=?,dob=?,description where email='"+email2+"'");
            ps1.setString(1,name1);
            ps1.setString(2,phone4);
            ps1.setString(3,dob);
            ps1.setString(4,description);
            
            
ps1.executeUpdate();
out.println("successfully updated");
out.println("<meta http-equiv='Refresh' content='0; url=UpdateUserInfo.jsp'/>");
            
        }catch(Exception u) {
            out.println("error"+u.getMessage());
        }}
        %>
        
       
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                        
                            <h5>Profile Picture</h5>
                            <%
        
        String email=session.getAttribute("email").toString();
        try
        {
         Statement st=cn.createStatement();
         String sql="SELECT filename FROM admin where email='"+email+"'";
         ResultSet rs=st.executeQuery(sql);
         while(rs.next())
         {
             String filename=rs.getString("filename");
            %>
        
                            
                             
                        <img src="images/<%=filename%>" style="border-radius:50%" >
                        <%
         }
        }
        catch(Exception e)
        {
            out.println("The error is:"+e.getMessage());
        }
        
        %>
        <style>                
        .hiddenFileInput > input{
  height: 100%;
  width: 100;
  opacity: 0;
  cursor: pointer;
}
.hiddenFileInput{
  border: 1px solid #ccc;
  width: 100px;
  height: 100px;
  display: inline-block;
  overflow: hidden;
  cursor: pointer;
  
  
  /*for the background, optional*/
  background: center center no-repeat;
  background-size: 50% 50%;
  background-image:  url(images\edit.png);
</style>

        <div class="payment-method">
                            <!-- Cash on delivery -->
                            <form action="FileUploadAdminServlet" method="post" enctype="multipart/form-data">
                                <i class="hiddenFileInput">
                                <input type="file" name="filename" class="fa fa-edit" style="font-size:24px" aria-hidden="true"><br>
                                </i>
                                <input type="submit" class="btn amado-btn w-100" value="update">
                              
                            </form>    
                            
                            </div>

<!--                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">Checkout</a>
                            </div>-->
                        
                        </div>
                    </div>
                </div>
        </div>
        </div>
</div>

        
   
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
    <section class="newsletter-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center">
                <!-- Newsletter Text -->
                <div class="col-12 col-lg-6 col-xl-7">
                    <div class="newsletter-text mb-100">
                        <h2>Subscribe for a <span>25% Discount</span></h2>
                        <p>Nulla ac convallis lorem, eget euismod nisl. Donec in libero sit amet mi vulputate consectetur. Donec auctor interdum purus, ac finibus massa bibendum nec.</p>
                    </div>
                </div>
                <!-- Newsletter Form -->
                <div class="col-12 col-lg-6 col-xl-5">
                    <div class="newsletter-form mb-100">
                        <form action="#" method="post">
                            <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved |
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-8">
                    <div class="single_widget_area">
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <nav class="navbar navbar-expand-lg justify-content-end">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                <div class="collapse navbar-collapse" id="footerNavContent">
                                    <ul class="navbar-nav ml-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.html">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="shop.html">Shop</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="product-details.html">Product</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="cart.html">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="checkout.html">Checkout</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>

