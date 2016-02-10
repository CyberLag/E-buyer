<%-- 
    Document   : index
    Created on : Oct 22, 2014, 12:41:42 AM
    Author     : Al-Amin
--%>

<%@page import="java.lang.*"%>
<%@page import="oracle.net.aso.p"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.eshopper.connection.Database" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Search | e-SHOPPER </title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body> 
        <%
            Connection conn = null;
            try {
                int printed = 0;
                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
                Statement stmt1 = db.connection.createStatement();
                Statement stmt2 = db.connection.createStatement();
                Statement stmt3 = db.connection.createStatement();
                Statement stmt4 = db.connection.createStatement();
                //  String key=request.getParameter("key");
                
                 Statement stmt6 = db.connection.createStatement();
                        ResultSet rs6 = stmt6.executeQuery("select max(email)+1 as mx from cart");
                        rs6.next();

                        //out.print(rs6.getString("mx"));
                        if (session.getAttribute("cartid") == null || (!(session.getAttribute("cartid").toString().compareTo("99999999") < 0 && session.getAttribute("cartid").toString().compareTo("0") > 0))) {
                            session.setAttribute("cartid", rs6.getString("mx"));
                        }

                        String lower = new String();
                        lower = request.getParameter("product");
                       // out.print(lower);
                        lower = lower.toLowerCase();
                        if (lower.length() == 0) {
                            lower = ""
                                    + "####################";
                    %><br><br><%out.println("NO RESULTS FOUND");
                            printed = 1;
                        }
                       // out.print("PPPP");

                        String arr[] = new String[110];
                        arr = lower.split(" ");

                        
;                        String qry1 = "select * from PRODUCT where lower(product_descrip) like '%" + arr[0] + "%'";
                        for (int i = 1; i < arr.length; i++) {
                            qry1 += " or lower(product_descrip) like '%" + arr[i] + "%'";
                        }
                        ResultSet rs1 = stmt1.executeQuery(qry1);
                        String total_res = new String();
                        total_res = "select count(*) from PRODUCT where lower(product_descrip) like '%" + lower + "%'";
                        
                        
                        if (request.getParameter("cart_in") != null) {
                            String qry3 = "insert into cart values ( '" + session.getAttribute("cartid") + "'," + request.getParameter("cart_in") + ",1)";
                            // out.print(qry3);
                            ResultSet rs3 = stmt3.executeQuery(qry3);
                            request.setAttribute("cart_in", null);
                        }
                        if (request.getParameter("cart_out") != null) {

                            String qry3 = "delete from cart where email like '" + session.getAttribute("cartid") + "' and product_code=" + request.getParameter("cart_out");
                            //out.print(qry3);
                            ResultSet rs3 = stmt3.executeQuery(qry3);
                            request.setAttribute("cart_out", null);
                        }
                        if (request.getParameter("wishlist_in") != null) {
                            String qry4 = "insert into wishlist values ( '" + session.getAttribute("userid") + "'," + request.getParameter("wishlist_in") + ")";
                           // out.print(qry4);
                            ResultSet rs4 = stmt4.executeQuery(qry4);
                            request.setAttribute("wishlist_in", null);
                        }
                        if (request.getParameter("wishlist_out") != null) {

                            String qry4 = "delete from wishlist where email like '" + session.getAttribute("userid") + "' and product_code=" + request.getParameter("wishlist_out");
                            //out.print(qry3);
                            ResultSet rs4 = stmt4.executeQuery(qry4);
                            request.setAttribute("wishlist_out", null);
                        }
                        
                        Statement stmt5 = db.connection.createStatement();
                String qry5 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "'";
                ResultSet rs5 = stmt5.executeQuery(qry5);
                rs5.next();
        %>

        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 ">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="#"><i class="fa fa-phone"></i> +8801738896778 </a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i> eshopperinfo@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="http://facebook.com"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="http://twitter.com"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="http://linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="http://drrible.com"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header_top-->
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
                        </div>
                        <div class="btn-group pull-right">			
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <%//String temp = session.getAttribute("userid").toString();
                                            if (session.getAttribute("userid") != null && (session.getAttribute("userid").toString().equals("admin@eshopper.com"))) {%>
                                <li><a href="stats.jsp"><i class="fa fa-file"></i>Stats</a></li>
                                <li><a href="update.jsp"><i class="fa fa-pencil-square-o"></i> Upadate</a></li>
                                <%}%>
                                <li><a href="wishlist.jsp"><i class="fa fa-star"></i> Wishlist</a></li>
                                    <%//String temp = session.getAttribute("userid").toString();
                                           if (session.getAttribute("userid") != null && (!session.getAttribute("userid").toString().endsWith("0"))) {%>

                                <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart(<%=rs5.getInt("count(*)")%>)</a></li>
                                <li><a href="account.jsp"><%=session.getAttribute("userid")%></a></li>
                                <li><a href="login.jsp"><i class="fa fa-unlock"></i> Logout</a></li>
                                    <%} else {%>
                                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i> Cart(<%=rs5.getInt("count(*)")%>)</a></li>
                                <li><a href="login.jsp"><i class="fa fa-crosshairs"></i> Register</a></li>
                                <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                    <%}%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle--> 

        <div class="header-bottom"><!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <form style="font-size:17px; text-align:right" name="input" action="http://localhost:8084/e-SHOPPER/search.jsp" method="post">
                            <input name="found_something" type="hidden" value="0" > Find Product: 
                            <input style="width:300px" type="text" name="product" placeholder="Search your product">
                            <input type="submit" value="Search" style="background-color: #FF9933;color:#FFFFFF">
                        </form>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#sportswear">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Grocery
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="sportswear" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="http://localhost:8084/e-SHOPPER/fruitveg.jsp">Fruits & Vegetables </a></li>
                                                <li><a href="http://localhost:8084/e-SHOPPER/beverages.jsp">Beverages</a></li>
                                                <li><a href="http://localhost:8084/e-SHOPPER/breakfast.jsp">Breakfast </a></li>
                                                <li><a href="http://localhost:8084/e-SHOPPER/meatfish.jsp">Meat & Fish</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Dress
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="mens" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="mensdress.jsp">Mens Dress</a></li>
                                                <li><a href="womensdress.jsp">Womens Dress</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Beauty & Health
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="womens" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="health.jsp">Health Care</a></li>
                                                <li><a href="personal.jsp">Personal Care</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#office">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Office
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="office" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="printing.jsp">Printing</a></li>
                                                <li><a href="batteries.jsp">Batteries</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>


                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#women">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Baby Care
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="women" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="food.jsp">Food</a></li>
                                                <li><a href="care.jsp">Care</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="http://localhost:8084/e-SHOPPER/electronics.jsp">Electronics</a></h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="http://localhost:8084/e-SHOPPER/cosmetics.jsp">Cosmetics</a></h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="http://localhost:8084/e-SHOPPER/sweets.jsp">Sweets</a></h4>
                                    </div>
                                </div>
                            </div><!--/category-products-->
                        </div>
                    </div>

                    <%

                       

                        ResultSet rs = stmt.executeQuery(total_res);
                        String page_number = new String();
                        if (request.getParameter("found_something") != null) {
                            page_number = request.getParameter("found_something");
                        } else {
                            page_number = "0";
                        }

                        int from = 1;

                        for (int i = 1; i < page_number.length(); i++) {
                            from += 12;
                            for (int j = 0; j < 12; j++) {
                                rs1.next();
                            }

                        }
                        int to = 0, tot = 0;
                        while (rs.next()) {
                            tot = rs.getInt("count(*)");
                            to = Math.min(11 + from, tot);
                        }

                        int found_something = 0;

                        if (from <= to) {
                            out.println("Search results for \"" + request.getParameter("product") + "\": " + from + " to " + to + " out of " + tot);
                        }%>

                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <%if (!lower.startsWith("####################")) {%>
                            <h2 class="title text-center">Search Items</h2>
                            <%}
                                while (rs1.next()) {

                                    if (found_something == 12) {
                                        found_something++;
                                        break;
                                    }
                                    String name = " ";
                                    name = rs1.getString("product_descrip");
                                    String product_code = new String();
                                    product_code = rs1.getString("product_code");
                                    String price = new String();
                                    price = rs1.getString("product_sell_price");
                                    String source = new String();
                                    source = "images/" + product_code + ".jpg";
                                    //out.println(source);
                                    String qry2 = "select count(*) from cart where product_code='" + product_code + "' and email like '" + session.getAttribute("cartid") + "'";
                                    ResultSet rs2 = stmt2.executeQuery(qry2);
                                    rs2.next();
                                    
                                    String qry4;
                                    if (session.getAttribute("userid") != null) {
                                        qry4 = "select count(*) from wishlist where product_code='" + product_code + "' and email='" + session.getAttribute("userid") + "'";
                                    } else {
                                        qry4 = "select count(*) from wishlist where product_code='" + product_code + "' and email='########'";
                                    }
                                    ResultSet rs4 = stmt4.executeQuery(qry4);
                                    rs4.next();
                            %>


                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                              <%if (rs2.getString("count(*)").startsWith("0")) {
                                    %>


                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src=<%=source%>  alt="Swapno" />
                                            <h2><%out.print(price);%> taka<li style="font-size: 15px; font-style: italic; color: green"><%out.print(rs1.getString("unit"));%></li></h2>
                                            <p style="color: darkcyan"><%out.print(name.substring(0, Math.min(20, name.length())));%></p>
                                            <!--CART-->
                                            <form action="search.jsp" method="post">

                                                <input type="hidden" name="cart_in" value=<%=product_code%>>
                                                <input  type="hidden" name="product" value=<%=lower%>>
                                                <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </form>

                                        </div>




                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2><%out.print(price);%> taka</h2>
                                                <p><%out.print(name);%></p>
                                                <form action="search.jsp" method="post">

                                                    <input type="hidden" name="cart_in" value=<%=product_code%>>
                                                    <input  type="hidden" name="product" value=<%=lower%>>
                                                    <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>



                                    <%} else {%>

                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src=<%=source%>  alt="Swapno" />
                                            <h2><%out.print(price);%> taka<li style="font-size: 15px; font-style: italic; color: green"><%out.print(rs1.getString("unit"));%></li></h2>
                                            <p style="color: darkcyan"><%out.print(name.substring(0, Math.min(20, name.length())));%></p>
                                            <!--CART-->
                                            <form action="search.jsp" method="post">

                                                <input type="hidden" name="cart_out" value=<%=product_code%>>
                                                <input  type="hidden" name="product" value=<%=lower%>>
                                                <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from cart</button>
                                            </form>

                                        </div>




                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2><%out.print(price);%> taka</h2>
                                                <p><%out.print(name);%></p>
                                                <form action="search.jsp" method="post">

                                                    <input type="hidden" name="cart_out" value=<%=product_code%>>
                                                    <input  type="hidden" name="product" value=<%=lower%>>
                                                    <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from cart</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>

                                    <%}
                                        if (rs4.getString("count(*)").startsWith("0")) {
                                    %>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><form action="<%if (session.getAttribute("userid") != null) {%>search.jsp<%} else {%>login.jsp<%}%>" method="post">

                                                    <input type="hidden" name="wishlist_in" value=<%=product_code%>>
                                                    <input  type="hidden" name="product" value=<%=lower%>>
                                                    <button type="submit" class="btn btn-default add-to-cart">Add to wishlist</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>

                                    <%} else {%>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><form action="search.jsp" method="post">

                                                    <input type="hidden" name="wishlist_out" value=<%=product_code%>>
                                                    <input  type="hidden" name="product" value=<%=lower%>>
                                                    <button type="submit" class="btn btn-default add-to-cart">Remove from wishlist</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <%
                                
                                    found_something++;
                                }
                                if(found_something==0 && printed==0){
                                    %>
                                    <p>NO RESULT FOUND</p>
                            <%}
                                if (found_something > 12) {
                                    page_number += "0";
                            %>
                            <form action="search.jsp" method="post">
                                <input name="found_something" type="hidden" value=<%=page_number%>>
                                <input  type="hidden" name="product" value=<%=lower%>>
                                <button style="float: right; margin-left: 120px"class="btn btn-default check_out" name="subject" value="page_number" type="submit">MORE</button>

                            </form>



                            <%}
                                } catch (Exception e) {
                                     out.println("Exception : " + e.getMessage() + "");
                                }
                            %>
                        </div><!--features_items-->
                    </div>
                </div>
            </div>                            
        </section>



        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="contact-us.jsp">Contact Us</a></li>
                                    <li><a href="faq.jsp">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="term.jsp">Terms of Use</a></li>
                                    <li><a href="#">Privecy Policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="info.jsp">Company Information</a></li>
                                    <li><a href="about-us.jsp">About Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2015 e-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Developed as <span> Project 300 </span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

