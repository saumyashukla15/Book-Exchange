
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
    <title>Book Swap</title>

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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop.html">Shop</a></li>
                    <li><a href="product-details.html">Product</a></li>
                    <li><a href="cart.html">Cart</a></li>
                    <li class="active"><a href="checkout.html">Checkout</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">%Discount%</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart.html" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Favourite</a>
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>New Upload</h2>
                            </div>
<% try {    
        String e=session.getAttribute("email").toString();
        
           int id=Integer.parseInt(request.getParameter("idupload"));
           session.setAttribute("ids",id);
            PreparedStatement ps=cn.prepareStatement("select * from upload where email='"+e+"'");
            ResultSet rs=ps.executeQuery();
            if(rs.next()) {
                String title=rs.getString("title");
                String description=rs.getString("description");
                 %>
               
  
                            <form action="EditBook.jsp" method="post" >
                                <div class="row">
                                    <h3>Title</h3>
                                     <div class="col-12 mb-3">
                                         <input type="text" class="form-control" value="<%=title%>" placeholder="Title" name="title">
                                    </div>
                                    <h3>Description</h3>
                                     <div class="col-12 mb-3">
                                        <textarea name="description" class="form-control w-100" id="comment" cols="30" rows="10" placeholder="Add Desciptipn"><%=description%></textarea>
                                    </div>
                                    <div class="col-12 mb-3">
                                        
                                <input type="submit" class="btn amado-btn w-100" value="Update">
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
            
           if(request.getParameter("title")!=null) { 
                        
        try {
            String e1=session.getAttribute("email").toString();
            String abc=session.getAttribute("ids").toString();
           int id=Integer.parseInt(abc);

            String title1=request.getParameter("title");
            String description1=request.getParameter("description");
               out.println(e1+""+title1+""+description1);      
            PreparedStatement ps1=cn.prepareStatement("update upload set title=?,description=? where email='"+e1+"' and idupload='"+id+"'");
            ps1.setString(1,title1);
            ps1.setString(2,description1);
            
ps1.executeUpdate();
out.println("successfully updated");
out.println("<meta http-equiv='Refresh' content='0; url=EditBook.jsp'/>");
            
        }catch(Exception d) {
            out.println("error"+d.getMessage());
        }}
        %>
        
    
<!--                             <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cover Photo of BOOK</h5><br>
                            <span></span>
                                     <span class="hiddenFileInput">
                                <input type="file" name="filename"/>
                                </span>                   
                        </div>
                    </div>       -->
                          
                                </div>
                        </div>
                    </div>
    </div>
                   
       
              
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
   
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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