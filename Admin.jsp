<%@page import="java.io.File"%>
<%@ page import="java.sql.*;" 
                 %>
         <%
            
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
        %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Admin</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <style>
        .small-box{border-radius:2px;position:relative;display:block;margin-bottom:20px;box-shadow:0 1px 1px rgba(0,0,0,0.1)}
        .small-box>.inner{padding:10px}
        .small-box>.small-box-footer{position:relative;text-align:center;padding:3px 0;color:#fff;color:rgba(255,255,255,0.8);display:block;z-index:10;background:rgba(0,0,0,0.1);text-decoration:none}
        .small-box>.small-box-footer:hover{color:#fff;background:rgba(0,0,0,0.15)}
        .small-box h3{font-size:38px;font-weight:bold;margin:0 0 10px 0;white-space:nowrap;padding:0}
        .small-box p{font-size:15px}
        .small-box p>small{display:block;color:#f9f9f9;font-size:13px;margin-top:5px}
        .small-box h3,.small-box p{z-index:5px}
        .small-box .icon{-webkit-transition:all .3s linear;-o-transition:all .3s linear;transition:all .3s linear;position:absolute;top:-10px;right:10px;z-index:0;font-size:90px;color:rgba(0,0,0,0.15)}
        .small-box:hover{text-decoration:none;color:#f9f9f9}
        .small-box:hover .icon{font-size:95px}@media (max-width:767px){.small-box{text-align:center}
        .small-box .icon{display:none}
        .small-box p{font-size:12px}}
        .bg-red,.callout.callout-danger,.alert-danger,.alert-error,.label-danger,.modal-danger .modal-body{background-color:#89E6C4 !important}
        .bg-yellow,.callout.callout-warning,.alert-warning,.label-waring,.modal-warning .modal-body{background-color:#d2d6de !important}
        .bg-aqua,.callout.callout-info,.alert-info,.label-info,.modal-info .modal-body{background-color:#FFD6B3 !important}
        .bg-blue,.callout.callout-info,.alert-info,.label-info,.modal-info .modal-body{background-color:#ffa0a0 !important}
        .bg-light-blue,.label-primary,.modal-primary .modal-body{background-color:#3c8dbc !important}
        .box{position:relative;border-radius:3px;background:#ffffff;border-top:3px solid #d2d6de;margin-bottom:20px;width:100%;box-shadow:0 1px 1px rgba(0,0,0,0.1)}
        
        
        .dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}
    </style>
    
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
                
                
                <%
        
        String email3=session.getAttribute("email").toString();
        try
        {
         Statement st=cn.createStatement();
         String sql="SELECT filename FROM admin where email='"+email3+"'";
         ResultSet rs=st.executeQuery(sql);
         while(rs.next())
         {
             String filename=rs.getString("filename");
            %>
        
                            
                         <a href="addash.jsp"><img src="admin/<%=filename%>" style="border-radius:50%;height:200px;width:400px" ></a>   
                        
                        <%
         }
        }
        catch(Exception e)
        {
            out.println("The error is:"+e.getMessage());
        }
        
        %>
                
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="Admin.jsp">My Dashboard</a></li>
                    <li><a href="ViewUsers.jsp">Registrations</a></li>
                    <li><a href="ViewUserUploads.jsp">Uploads</a></li>
                    <li><a href="">Feedbacks</a></li>
                    <li><a href="">Messages</a></li>
                    <li class="dropdown"><a>Settings</a>
                        <ul class="dropdown-content">
                            <li><a href="UpdateAdminProfile.jsp">Update Profile</a></li>
                            <li><a href="adsignup.jsp">Add Admin</a></li>
                            <li><a href="">Change Password</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="GenerateReport.jsp" class="btn amado-btn mb-15">Generate Report</a>
                <a href="#" class="btn amado-btn active">View User</a>
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
<% try {    
          Statement st1 = cn.createStatement();
      Statement st2 = cn.createStatement();
      String query1 = "select count(*) from bookswap";
      String query2 = "select count(*) from upload";
      ResultSet rs1 = st1.executeQuery(query1);
      ResultSet rs2 = st2.executeQuery(query2);
      rs1.next();
      int count1 = rs1.getInt(1);
      rs2.next();
      int count2 = rs2.getInt(1);
      %>
        <div class="products-catagories-area clearfix" style="padding:50px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3><%=count1%></h3>
                  <p>Registrations</p>
                </div>
                <div class="icon">
                  <i class="fa fa-user"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-blue">
                <div class="inner">
                  <h3><%=count2%><sub style="font-size: 10px"></sub></h3>
                  <p>Uploads</p>
                </div>
                <div class="icon">
                  <i class="fa fa-book"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3>44</h3>
                  <p>Messages</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3>65</h3>
                  <p>Unique Visitors</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->

                 <%
                
        }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        %>
              
  
                <div class="row">
<% try {    
           String e= session.getAttribute("email").toString();
            PreparedStatement ps=cn.prepareStatement("select * from upload order by id DESC LIMIT 9");
            ResultSet rs=ps.executeQuery();
           while(rs.next()) {
                String fn=rs.getString("filename");
                String t=rs.getString("title");
                
            %>
                    <!-- Single Product Area -->
                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img">
                                <img src="uploads/<%=fn%>" alt="">
                                <!-- Hover Thumb -->
<!--                                <img class="hover-img" src="img/product-img/product2.jpg" alt="">-->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"><%=t%></div>
                                    <p class="product-price"></p>
                                    
                                </div>
                                <!-- Ratings & Cart -->
                                
                            </div>
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

                    <!-- Single Product Area -->
                    
                </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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