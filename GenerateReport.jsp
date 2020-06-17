<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
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
    <title>BookSwap</title>

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
        
                            
                         <a href="GenerateReport.jsp"><img src="AdminImage/<%=filename%>" style="border-radius:50%;height:200px;width:400px" ></a>   
                        
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
                    <li><a href="Admin.jsp">My Dashboard</a></li>
                    <li><a href="adregistrations.jsp">Registrations</a></li>
                    <li><a href="ViewUserUploads.jsp">Uploads</a></li>
                    <li><a href="">Feedbacks</a></li>
                    <li><a href="">Messages</a></li>
                    <li><a href="UpdateAdminProfile.jsp">Update Profile</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">Generate Report</a>
                <a href="#" class="btn amado-btn active">View User</a>
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
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Report Generation</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <% try {    
           
            PreparedStatement ps=cn.prepareStatement("select * from bookswap");
            ResultSet rs=ps.executeQuery();
           while(rs.next()) {
                String id=rs.getString("id");
                String name=rs.getString("name");
                String email=rs.getString("email");
                
                
                
            %>

                                    <tr>
                                        <td class="cart_product_img">
                                           <h5><%=id%></h5>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5><%=name%></h5>
                                        </td>
                                        <td class="price">
                                            <span><%=email%></span>
                                        </td>
                                        
                                        <td class="price">
                                            <a href="Generatereport?email=<%=email%>"><button class="btn btn-primary" onclick="confirm('file has been downloaded')">Generate</button></a>
                                        </td>
                                        
                                    </tr>
                                    
                                    <%
                
                
            }
        }
        
        
        catch(Exception u)
        {
        out.println("Error occured"+u.getMessage());
        }
        %>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    <%@page  import="com.itextpdf.text.*"%>
    <%@page  import="com.itextpdf.text.pdf.*"%>
    <%@page  import="java.io.FileOutputStream"%>
    <%
        String email=(String)session.getAttribute("email");
        try {
		String file_name="E:\\AdminPdf\\a.pdf";
		Document document=new Document();
		
		PdfWriter.getInstance(document, new FileOutputStream(file_name));
		document.open();
		Paragraph para=new Paragraph("Report");
		document.add(para);
		document.add(new Paragraph(" "));
		
		PdfPTable table=new PdfPTable(2);
		PdfPCell c1=new PdfPCell(new Phrase("Title"));
		table.addCell(c1);
		
		PdfPCell c2=new PdfPCell(new Phrase("Description"));
		table.addCell(c2);
		if(!cn.isClosed()) {
			PreparedStatement ps=cn.prepareStatement("select * from bookswap where email='"+email+"'");
			ResultSet rs2=ps.executeQuery();
			if(rs2.next()) {
				Paragraph p1=new Paragraph("Id :"+rs2.getInt("id"));
                                document.add(p1);
                                Paragraph p2=new Paragraph("Name :"+rs2.getString("name"));
                                document.add(p2);
                                Paragraph p3=new Paragraph("Email :"+rs2.getString("email"));
                                document.add(p3);
                                Paragraph p5=new Paragraph("Address :"+rs2.getString("address")+" , "+rs2.getString("street")+" ,"+rs2.getString("state")+" ,"+rs2.getString("country")+" , "+rs2.getString("zipcode"));
                                document.add(p5);
                                Paragraph p6=new Paragraph("Phone :"+rs2.getString("phone"));
                                document.add(p6);
                }
                                PreparedStatement ps1=cn.prepareStatement("select * from upload where email='"+email+"'");
			ResultSet rs1=ps1.executeQuery();
			
                                while(rs1.next()) {
				table.setHeaderRows(1);
				table.addCell(rs1.getString("title"));
				table.addCell(rs1.getString("description"));
				//table.addCell(rs1.getString("name"));
				
                                }

			document.add(table);
		}
                
		document.close();
		out.println("done");
		}
                catch(Exception e) {
			out.println(e.getMessage());
		}
		

        
        %>
    
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