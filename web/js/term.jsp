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

            <p><b>Terms of use</b>
<p>By using Chaldal.com (also referred to as Chaldal or “website”) you agree to these conditions. Please read them carefully.
            <p><b>Communication</b>
<p>When you use Chaldal.com, or contact us via phone or email, you consent to receive communication from us. You authorize us to communicate with you by posting disclosures on the site, by email or by phone.  Additionally any disclosures posted on the site, or sent to you by email fulfill the legal obligation of communication made in writing.
<p><b>Eligibility</b>
<p>If you are a minor i.e. under the age of 18 years, you shall not register as a user of the Chaldal.com and shall not transact on or use the website. As a minor if you wish to use or transact on website, such use or transaction may be made by your legal guardian or parents on the website. Chaldal reserves the right to terminate your membership and / or refuse to provide you with access to the website if it is brought to Chaldal’s notice or if it is discovered that you are under the age of 18 years.
<p><b>Your Account and Responsibilities</b>
<p>If you use the website, you will be responsible for maintaining the confidentiality of your username and password and you will be responsible for all activities that occur under your username. You agree that if you provide any information that is untrue, inaccurate, not current or incomplete or we have reasonable grounds to suspect that such information is untrue, inaccurate, not current or incomplete, or not in accordance with the this Terms of Use, we have the right to suspend or terminate your membership on the website.
<p><b>Charges</b>
<p>Membership on the website is free for users. Chaldal does not charge any fee for browsing and buying on the website. Chaldal reserves the right to change its fee policy from time to time. In particular, Chaldal may at its sole discretion introduce new services and modify some or all of the existing services offered on the website. In such an event, Chaldal reserves the right to introduce fees for the new services offered or amend/introduce fees for existing services, as the case may be. Changes to the fee policy will be posted on the website and such changes will automatically become effective immediately after they are posted on the website.
<p><b>Copyright</b>
<p>The material (including the content, and any other content, software or services) contained on Chaldal.com are the property of Chaldal Limited, its subsidiaries, affiliates and/or third party licensors. No material on this site may be copied, reproduced, republished, installed, posted, transmitted, stored or distributed without written permission from Chaldal Limited.
You may not use any “deep-link”, “page-scrape”, “robot”, “spider” or other automatic device, program, algorithm or methodology, or any similar or equivalent manual process, to access, acquire, copy or monitor any portion of the website or any content, or in any way reproduce or circumvent the navigational structure or presentation of the website or any content, to obtain or attempt to obtain any materials, documents or information through any means not purposely made available through the website. We reserve our right to bar any such activity.
<p><b>Cookies </b>
<p>This site uses cookies, which means that you must have cookies enabled on your computer in order for all functionality on this site to work properly. A cookie is a small data file that is written to your hard drive when you visit certain Web sites. Cookie files contain certain information, such as a random number user ID that the site assigns to a visitor to track the pages visited. A cookie cannot read data off your hard disk or read cookie files created by other sites. Cookies, by themselves, cannot be used to find out the identity of any user.
<p><b>Product Descriptions</b>
<p>Chaldal attempts to be as accurate as possible. However, Chaldal does not warrant that product descriptions or other content of any Chaldal is accurate, complete, reliable, current, or error-free. If a product offered by Chaldal itself is not as described, your sole remedy is to return it in unused condition.
<p><b>Pricing</b>
<p>Except where noted otherwise, the list price or suggested price displayed for products on Chaldal represents the full retail price listed on the product itself, suggested by the manufacturer or supplier, or estimated in accordance with standard industry practice; or the estimated retail value for a comparably featured item offered elsewhere. The list price or suggested price is a comparative price estimate and may or may not represent the prevailing price in every area on any particular day.
With respect to items sold by Chaldal, we cannot confirm the price of an item until you order. Despite our best efforts, a small number of the items in our catalog may be mispriced. If the correct price of an item sold by Chaldal is higher than our stated price, we will, at our discretion, either contact you for instructions before shipping or cancel your order and notify you of such cancellation.
<p><b>Return & Refund Policy</b>
<p>A user may return any unopened or defective item within 7 days of receiving the item. Chaldal, at its own discretion, will refund the value of that item.
<p>Following products may not be eligible for return or replacement:
Damages due to misuse of product
Incidental damage due to malfunctioning of product
Any consumable item which has been used/installed
Products with tampered or missing serial/UPC numbers
Any damage/defect which are not covered under the manufacturer's warranty</p>
Any product that is returned without all original packaging and accessories, including the box, manufacturer's packaging if any, and all other items originally included with the product/s delivered</p>
<p><b>Privacy Policy</b></p>
<p>When you use our Website, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, smooth and customized experience. This allows us to provide services and features that most likely meet your needs, and to customize our website to make your experience safer and easier. More importantly, while doing so, we collect personal information from you that we consider necessary for achieving this purpose.
Below are some of the ways in which we collect and store your information:
We receive and store any information you enter on our website or give us in any other way. We use the information that you provide for such purposes as responding to your requests, customizing future shopping for you, improving our stores, and communicating with you.
We also store certain types of information whenever you interact with us. For example, like many websites, we use "cookies," and we obtain certain types of information when your web browser accesses chaldal.com or advertisements and other content served by or on behalf of chaldal.com on other websites.
To help us make e-mails more useful and interesting, we often receive a confirmation when you open e-mail from Chaldal if your computer supports such capabilities.
Information about our customers is an important part of our business, and we are not in the business of selling it to others. 
We release account and other personal information when we believe release is appropriate to comply with the law; enforce or apply our Terms of Use and other agreements; or protect the rights, property, or safety of Chaldal.com, our users, or others. This includes exchanging information with other companies and organizations for fraud protection.
<p><b>Modifications</b>
<p>Chaldal reserves the right to modify these Terms and Conditions. Such modifications shall be effective immediately upon posting on Chaldal.com. You are responsible for the reviewing of such modifications. Your continued access or use of Chaldal.com shall be deemed your acceptance of the modified terms and conditions.
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