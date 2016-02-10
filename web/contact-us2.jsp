<%-- 
    Document   : loginm
    Created on : Nov 17, 2014, 9:10:04 PM
    Author     : Pranab
--%>

<%@page import="oracle.net.aso.p"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.eshopper.connection.Database" %>




<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Contact Us | e-SHOPPER</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        <%
            try {
                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
                Statement stmt5 = db.connection.createStatement();
                String qry5 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "'";
                ResultSet rs5 = stmt5.executeQuery(qry5);
                rs5.next();

        %>
        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 ">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="http://localhost:8084/e-SHOPPER/contact-us.jsp"><i class="fa fa-phone"></i> +8801738896778 </a></li>
                                    <li><a href="http://localhost:8084/e-SHOPPER/contact-us.jsp"><i class="fa fa-envelope"></i> eshopperinfo@gmail.com</a></li>
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
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp" class="active">Home</a></li>
                                </ul>
                            </div>
                            <form style="font-size:17px; text-align:right;" name="input" action="http://localhost:8084/e-SHOPPER/search.jsp" method="post">
                            <input name="found_something" type="hidden" value="0" > Find Product: 
                            <input style="width:300px" type="text" name="product" placeholder="Search your product">
                            <input type="submit" value="Search" style="background-color: #FF9933;color:#FFFFFF">
                        </form>
                        </div>
                        
                    </div>
                </div>
            </div><!--/header-bottom-->
            
        </header><!--/header-->

        <div id="contact-page" class="container">
            <div class="bg">
                <div class="row">    		
                    <h2 class="title text-center">Contact <strong>Us</strong></h2>  
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <div class="breadcrumbs">
                                <ol class="breadcrumb" style="font-size: 17px;">
                                    <li><a href="http://localhost:8084/e-SHOPPER/contact-us.jsp">CONTACT US</a> </li>
                                </ol>
                            </div>
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
                    <div class="col-sm-9 padding-right">
                    <img src="images/Contactus.png" alt="" style="width:100%;"/>
                    <div class="contact-info">

                        <p>e-SHOPPER Store Sales and Customer Support:</p>
                        <p>Call 1-877-696-7786</p><br>
                        <p>e-SHOPPER Complete, Assure, Premium Tech Support, or Signature support:</p>
                        <p>Call 1-877-696-7786</p><br>
                        <p>e-SHOPPER products bought elsewhere and online Answer Desk:</p>
                        <p>Call 1-800-642-7676</p><br>
                        <p>Support is available 24 hours a day, 7 days a week</p>

                        <br>
                        <h2 class="title text-center">Contact Info</h2>
                            <address>
                                <p>e-SHOPPER Inc.</p>
                                <p>House No. 3, Nikunjo R/A, West Pathantula</p>
                                <p>Madina Market, Sylhet.</p>
                                <p>Mobile: +2346 17 38 93</p>
                                <p>Fax: 1-714-252-0026</p>
                                <p>Email: eshopperinfo@gmail.com</p>
                            </address>
                    </div>
                </div>
                    </div>
                
            </div>	
        </div><!--/#contact-page-->

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
                                    <li><a href="privacypolicy.jsp">Privecy Policy</a></li>
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
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript" src="js/gmaps.js"></script>
        <script src="js/contact.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

        <%            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>

    </body>
</html>