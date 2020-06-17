
<!DOCTYPE html>
<html lang="en">
    <%@ page import="java.sql.*;" %>
                 
         <%
            
       
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bookswap","root","1234");
        %>
    
<head>
    <style>
        .small-box{border-radius:2px;position:relative;display:block;margin-bottom:20px;box-shadow:0 1px 1px rgba(0,0,0,0.1)}.small-box>.inner{padding:10px}.small-box>.small-box-footer{position:relative;text-align:center;padding:3px 0;color:#fff;color:rgba(255,255,255,0.8);display:block;z-index:10;background:rgba(0,0,0,0.1);text-decoration:none}.small-box>.small-box-footer:hover{color:#fff;background:rgba(0,0,0,0.15)}.small-box h3{font-size:38px;font-weight:bold;margin:0 0 10px 0;white-space:nowrap;padding:0}.small-box p{font-size:15px}.small-box p>small{display:block;color:#f9f9f9;font-size:13px;margin-top:5px}.small-box h3,.small-box p{z-index:5px}.small-box .icon{-webkit-transition:all .3s linear;-o-transition:all .3s linear;transition:all .3s linear;position:absolute;top:-10px;right:10px;z-index:0;font-size:90px;color:rgba(0,0,0,0.15)}.small-box:hover{text-decoration:none;color:#f9f9f9}.small-box:hover .icon{font-size:95px}@media (max-width:767px){.small-box{text-align:center}.small-box .icon{display:none}.small-box p{font-size:12px}}.box{position:relative;border-radius:3px;background:#ffffff;border-top:3px solid #d2d6de;margin-bottom:20px;width:100%;box-shadow:0 1px 1px rgba(0,0,0,0.1)}
    .bg-red,.callout.callout-danger,.alert-danger,.alert-error,.label-danger,.modal-danger .modal-body{background-color:#dd4b39 !important}.bg-yellow,.callout.callout-warning,.alert-warning,.label-waring,.modal-warning .modal-body{background-color:#f39c12 !important}.bg-aqua,.callout.callout-info,.alert-info,.label-info,.modal-info .modal-body{background-color:#00c0ef !important}.bg-blue{background-color:#0073b7 !important}
    .bg-green,.callout.callout-success,.alert-success,.label-success,.modal-success .modal-body{background-color:#00a65a !important}</style>
    
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
                <a href="index.html"><img src="img/bg-img/logo.png" alt=""></a>
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
                <a href="index.html"><img src="img/bg-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                 <div class="cart-fav-search mb-100">
                
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="ViewUsers.jsp">View Users</a></li>
                    <li><a href="ViewUserUploads.jsp">User Uploads</a></li>
                    <li class="active"><a href="MyUploads.jsp">Settings</a></li>
                    <li><a href="SignOut.jsp">New Feedback</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="GenerateReport.jsp" class="btn amado-btn mb-15">Send Report</a>
                <a href="" class="btn amado-btn active">New Request</a>
            </div>
            <!-- Cart Menu -->
           
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        

        <!-- Header Area End -->

        <div class="products-catagories-area clearfix" style="padding:50px">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-12">
                        <div class="cart-title mt-50">
                            <h2>Total Uploads</h2>
                        </div>
                        <br>
                        <div class="cart-table clearfix">
                            
                            <table class="table table-responsive" style="width: 100%;layout:fixed">
                                <thead style="background-color: orange">
                                    <tr>
                                      
                                        <th>Book</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Email</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <% try {    
          
                
            PreparedStatement ps=cn.prepareStatement("select * from upload" );
            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
                String filename=rs.getString("filename");
                String title=rs.getString("title");
                String description=rs.getString("description");
                String email=rs.getString("email");
//                
            %>
                                <tbody style="font-size: 15px;font-family: serif">
                                    <tr>
                                        <td class="cart_product_img" >
                                            <img src="uploads/<%=filename%>" width="500" height="500"/>
                                        </td>
                                        
                                <td class="title" style="text-align: justify">
                                           <%=rs.getString("title")%>
                                </td>
                                        <td class="description" style="text-align: justify">
                                            <%=rs.getString("description")%>
                                        </td>
                                        <td class="email" style="text-align: justify">
                                            <%=rs.getString("email")%>
                                        </td>
                                        <td><a  href="DeleteServlet?email=<%=email%>&title=<%=title%>"><button class="btn btn-primary">Delete</button></a></td>
                                    </tr>
                                   
                                  
                                 
                                </tbody>
                                <%
             
            }
        }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        %>


                            </table>
                        </div>
                    </div>
                 
                </div>
            </div>
        </div>
    </div>
        
    <!-- ##### Newsletter Area End ##### -->
-->

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