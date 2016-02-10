<%-- 
    Document   : faq
    Created on : Nov 18, 2014, 8:01:16 PM
    Author     : Pranab
--%>

<%@page import="oracle.net.aso.p"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>  
        <title>Home | Swapno</title>
        <link href="css/imagestyle.css" rel="stylesheet">
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
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "storedb", "sust");
                // out.println("connected....!!");
                Statement stmt = conn.createStatement();

        %>
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 ">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="#"><i class="fa fa-phone"></i> +8801738896778 </a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i> swapnoinfo@gmail.com</a></li>
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
                                <li><a href="#"><i class="fa fa-user"></i> Account</a></li>
                                <li><a href="#"><i class="fa fa-star"></i> Wishlist</a></li>
                                <li><a href="register.jsp"><i class="fa fa-crosshairs"></i> Register</a></li>
                                <li><a href="cart.html"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                <li><a href="login.jsp"><i class="fa fa-lock"></i> Login</a></li>
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
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="index.jsp" class="active">Home</a></li>

                                <li class="dropdown"><a href="#">Blog<i class="fa fa-angle-down"></i></a>
                                    <ul role="menu" class="sub-menu">
                                        <li><a href="blog.html">Blog List</a></li>
                                        <li><a href="blog-single.html">Blog Single</a></li>
                                    </ul>
                                </li> 
                                <li><a href="contact-us.jsp">Contact</a></li>
                            </ul>
                        </div>
                        <form style="font-size:17px; text-align:right;" name="input" action="http://localhost:8084/Test2/search.jsp" method="get">
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
                                    <li><a href="http://localhost:8084/Test2/fruitveg.jsp">Fruits & Vegetables </a></li>
                                    <li><a href="http://localhost:8084/Test2/beverages.jsp">Beverages</a></li>
                                    <li><a href="http://localhost:8084/Test2/breakfast.jsp">Breakfast </a></li>
                                    <li><a href="http://localhost:8084/Test2/meatfish.jsp">Meat & Fish</a></li>
                                    <li><a href="http://localhost:8084/Test2/snacks.jsp">Snacks </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#mens">
                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                    Mens Dress
                                </a>
                            </h4>
                        </div>
                        <div id="mens" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul>
                                    <li><a href="#">Fendi</a></li>
                                    <li><a href="#">Guess</a></li>
                                    <li><a href="#">Valentino</a></li>
                                    <li><a href="#">Dior</a></li>
                                    <li><a href="#">Versace</a></li>
                                    <li><a href="#">Armani</a></li>
                                    <li><a href="#">Prada</a></li>
                                    <li><a href="#">Dolce and Gabbana</a></li>
                                    <li><a href="#">Chanel</a></li>
                                    <li><a href="#">Gucci</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordian" href="#womens">
                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                    Womens Dress
                                </a>
                            </h4>
                        </div>
                        <div id="womens" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul>
                                    <li><a href="#">Fendi</a></li>
                                    <li><a href="#">Guess</a></li>
                                    <li><a href="#">Valentino</a></li>
                                    <li><a href="#">Dior</a></li>
                                    <li><a href="#">Versace</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Electronics</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Cosmetics</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Households</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Interiors</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Clothing</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Bags</a></h4>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="http://localhost:8084/Test2/fruitveg.jsp">Shoes</a></h4>
                        </div>
                    </div>
                </div><!--/category-products-->
                <div class="shipping text-center"><!--shipping-->
                    <img src="images/home/shipping.jpg" alt="" />
                </div><!--/shipping-->
            </div>
        </div>
        <div class="col-sm-9 padding-right">
        <div class="contact-info" style="font-size: 17px;">

            <p><b>Frequently Asked Questions</b></p>
            <p><b>Q. How does the site work?</b></p>
            <p>A. You browse the site or use our search engine to find your desired products. You then add them to your shopping bag and click on place order. You let us know your address, select a delivery time – and voila, you are done.  A Chaldal representative then delivers your order right to your home or office.</p>
            <p><b>Q. How much do deliveries cost?</b></p>
            <p>A. We offer free deliveries all over Dhaka city.</p>
            <p><b>Q. How can I contact you?</b></p>
            <p>A. You can always call 01919-123123 or mail us at founders@chaldal.com.</p>
            <p><b>Q. How long do the deliveries take?</b></p>
            <p>A. We deliver on the same day, as long as you order by 3 pm. Most of our deliveries happen within 5 hours of ordering. You can also specify a convenient time and we will send the products during that time.</p>
            <p><b>Q. What are your delivery hours?</b></p>
            <p>A. We deliver from 10 am to 10 pm every day. You can choose the timing to be either “10 am - 3 pm” or “3 pm - 7 pm” or “7 pm to 10 pm” when you place your order.</p>
            <p><b>Q. How do I know when my order is here?</b></p>
            <p>A. A Chaldal representative will call you as soon as they are at your house to let you know about your delivery.</p>
            <p><b>Q. How do I pay?</b></p>
            <p>A. We aceept cash on delivery. Don’t worry, our Chaldal representatives should always carry enough change. At your request, we can also send a credit card machine with our delivery representative. You can simply swipe your card when you receive the order.</p>
            <p><b>Q. Do you serve my area?</b></p>
            <p>A. We are currently serving all of Dhaka city, except certain parts of Old town.</p>
            <p><b>Q. I can’t find the product I am looking for. What do I do?</b></p>
            <p>A. We are always open to new suggestions and will add an item to our inventory just for you. You can call 01919-123123 to tell a Chaldal representative to source it for you or mail us at founders@chaldal.com to add this item to the inventory.</p>
            <p><b>Q. My order is wrong. What do I do?</b></p>
            <p>A. Immediately call 01919-123123 and let us know the problem.</p>
            <p><b>Q. What if the item is out of stock?</b></p>
            <p>A. We will try our best to source what you need. If we cannot find it, we will call you and let you know what substitutes are available.</p>
            <p><b>Q. What happens during a hartal?</b></p>
            <p>A. We work during hartals. That’s how dedicated we are.</p>
            <p><b>Q. Why should we buy from you when I have a store nearby?</b></p>
            <p>A. Well, that is up to you but you can also be a couch potato like our founders and have your items delivered to your house for free. Our prices are sometimes lower than that of major superstores in the city. We also carry a larger variety than the average corner-store. So, there is really no reason to not buy from us.</p>
            <p><b>Q. What about the prices?</b></p>
            <p>A. Our prices are our own but we try our best to offer them to you at or below market prices. Our prices are likely to be the same as that of major superstores. If you feel that any product is priced unfairly, please let us know.</p>
            <p><b>Q. How do you deliver?</b></p>
            <p>A. Depends. By foot. By rickshaw. By car. By truck. Our goal is to get all your products to you on time.</p>
            <p><b>Q. What is your policy on refunds?</b></p>
            <p>A. You may get a refund within seven (7) days on unopened or spoilt good. Please contact us at 01919-123123.</p>
            <p><b>Q.  Can I order over the phone?</b></p>
            <p>A. Absolutely. Our hotline is 01919-123123</p>
            <p><b>Q. What about quality?</b></p>
            <p>A. We try our best to source the best quality items for you but if you are dissatisfied, you can always send them back with the delivery person. If you forget to do that, you can call us within 3 days and we will replace the item for free.</p>
            <p><b>Q. How are you sourcing your products?</b></p>
            <p>A. We have deals with a few whole-sellers and importers. We are also building relationships with some manufacturers so that we can source our goods directly.</p>
            <p><b>Q. Should I tip the delivery representative?</b></p>
            <p>A. Tips are not required. But our delivery team members appreciate recognition for their hard work. Delivery representatives keep the entire tip amount.</p>
        </div>
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
                                    <li><a href="#">Online Help</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Order Status</a></li>
                                    <li><a href="#">Change Location</a></li>
                                    <li><a href="#">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Terms of Use</a></li>
                                    <li><a href="#">Privecy Policy</a></li>
                                    <li><a href="#">Refund Policy</a></li>
                                    <li><a href="#">Billing System</a></li>
                                    <li><a href="#">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Company Information</a></li>
                                    <li><a href="#">Careers</a></li>
                                    <li><a href="#">Store Location</a></li>
                                    <li><a href="#">Affillate Program</a></li>
                                    <li><a href="#">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>Get Update</h2>
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2015 E-SHOPPER Inc. All rights reserved.</p>
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

        <%            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>
    </body>
</html>