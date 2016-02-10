<%-- 
    Document   : checkout
    Created on : Jan 28, 2015, 12:14:38 PM
    Author     : Al-Amin
--%>

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
        <title>Checkout | E-Shopper</title>
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
            try {
                Database db = new Database();
                db.connect();
                

                if (session.getAttribute("cartid") == null) {
                    response.sendRedirect("index.jsp");
                }

                Statement stmt = db.connection.createStatement();
                ResultSet rs = stmt.executeQuery("select count(*) as cnt from cart where email like '" + session.getAttribute("cartid") + "'");
                rs.next();
                if (rs.getInt("cnt") == 0) {
                    response.sendRedirect("index.jsp");
                }
                if (request.getParameter("slip") == null || request.getParameter("slip").length() < 1) {
                    response.sendRedirect("index.jsp");
                }

                if (request.getParameter("slip") != null) {
                    stmt.executeQuery("delete from cart where email like '" + session.getAttribute("cartid") + "'");
                }

                String arr[] = new String[100010];
                arr = request.getParameter("slip").split("-");

                String dt = (new java.util.Date()).toString();
                //out.println(dt);    
                String arr2[] = new String[10];
                arr2 = dt.split(" ");
                String datetime = arr2[5] + "-";
                if (arr2[1].equals("Jan")) {
                    datetime += "01";
                } else if (arr2[1].equals("Feb")) {
                    datetime += "02";
                } else if (arr2[1].equals("Mar")) {
                    datetime += "03";
                } else if (arr2[1].equals("Apr")) {
                    datetime += "04";
                } else if (arr2[1].equals("May")) {
                    datetime += "05";
                } else if (arr2[1].equals("Jun")) {
                    datetime += "06";
                } else if (arr2[1].equals("Jul")) {
                    datetime += "07";
                } else if (arr2[1].equals("Aug")) {
                    datetime += "08";
                } else if (arr2[1].equals("Sep")) {
                    datetime += "09";
                } else if (arr2[1].equals("Oct")) {
                    datetime += "10";
                } else if (arr2[1].equals("Nov")) {
                    datetime += "11";
                } else if (arr2[1].equals("Dec")) {
                    datetime += "12";
                }
                datetime += "-" + arr2[2] + "T" + arr2[3].substring(0, 5);
                   //out.println("."+datetime+".");

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
                                <li><a href="contact-us.jsp"><i class="fa fa-phone"></i> +8801738896778 </a></li>
                                <li><a href="contact-us.jsp"><i class="fa fa-envelope"></i> eshopperinfo@gmail.com</a></li>
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
                                            if (session.getAttribute("userid") != null && (session.getAttribute("userid").toString().length()>4)) {%>
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
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="index.jsp" class="active">Home</a></li>
                            </ul>
                        </div>
                        <form style="font-size:17px; text-align:right;" name="input" action="search.jsp" method="post">
                            <input name="found_something" type="hidden" value="0" > Find Product: 
                            <input style="width:300px" type="text" name="product" placeholder="Search your product">
                            <input type="submit" value="Search" style="background-color: #FF9933;color:#FFFFFF">
                        </form>
                    </div>
                </div>
                <div class="breadcrumbs">
                        <ol class="breadcrumb" style="margin-left: 48px; font-size: 17px;">
                            <li><a href="checkout.jsp">CHECKOUT</a>
                        </ol>
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
                                                <li><a href="fruitveg.jsp">Fruits & Vegetables </a></li>
                                                <li><a href="beverages.jsp">Beverages</a></li>
                                                <li><a href="breakfast.jsp">Breakfast </a></li>
                                                <li><a href="meatfish.jsp">Meat & Fish</a></li>
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
                                        <h4 class="panel-title"><a href="electronics.jsp">Electronics</a></h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="cosmetics.jsp">Cosmetics</a></h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a href="sweets.jsp">Sweets</a></h4>
                                    </div>
                                </div>
                            </div><!--/category-products-->
                        </div>
                    </div>
                    <div class="col-sm-9 padding-right">
                        <div class="contact-info" style="font-size: 17px;">

                            <img src="images/checkout.jpg" alt="" />
                            <br>Success! Your goods are on the way!
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="do_action">
            <div class="container">
                <div class="row">

                    <div class="col-sm-16">
                        <div class="total_area">
                            <p style="color: darkblue; margin-left: 480px;"> <font size="3">SWAPNO SUPERSTORES PVT. LTD</font><br></p>
                            <p style="color: black; margin-left: 525px">Nikunjo, Modina Market,<br></p>
                            <p style="color: black; margin-left: 580px">Sylhet<br></p>
                            <p style="color: black; margin-left: 490px">___________________________________<br><br></p>
                            <p style="color: darkred; margin-left: 540px;"> <font size="3">Shopping Invoice</font><br><br></p>
                            <p style="color: darkgreen; margin-left: 530px;"> <font size="1"><%= new java.util.Date()%></font><br><br></p>                        
                            <ul>
                                <section id="cart_items">   
                                    <div class="container">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <div class="table-responsive cart_info"style=width:1070px;">                                
                                                    <table class="table table-condensed">
                                                        <thead>
                                                            <tr class="cart_menu">
                                                                <td class="description">Product</td>
                                                                <td class="price">Unit Price</td>
                                                                <td class="price">Quantity Purchased</td>
                                                                <td class="price">Price</td>
                                                            </tr>
                                                        <br><br>
                                                        </thead>
                                                        <%  double total_price = 0.0;
                                                            for (int i = 0; i < arr.length; i += 2) {
                                                                Statement stmt2 = db.connection.createStatement();
                                                                String qry2 = "select * from product where product_code=" + arr[i];
                                                                ResultSet rs2 = stmt2.executeQuery(qry2);
                                                                rs2.next();
                                                                long per_price = rs2.getInt("product_sell_price") * Integer.parseInt(arr[i + 1]);
                                                                total_price += per_price;
                                                                //out.print("LLLLLLL");
                                                                Statement stmt3 = db.connection.createStatement();
                                                                stmt3.executeQuery("insert into logs values('" + rs2.getString("product_descrip") + "'," + rs2.getInt("product_code") + "," + rs2.getInt("subcategory_id") + ",'" + datetime + "'," + arr[i + 1] + "," + rs2.getInt("product_purchase_price") + "," + rs2.getInt("product_sell_price") + ",'" + session.getAttribute("userid") + "')");
                                                        %>   

                                                        <tbody>
                                                            <tr >

                                                                <td class="cart_description">
                                                                    <p><%=rs2.getString("product_descrip")%></p>
                                                                </td>
                                                                <td class="cart_price">
                                                                    <p><%=rs2.getInt("product_sell_price")%></p>
                                                                </td>
                                                                <td class="cart_price">
                                                                    <p><%=arr[i + 1]%></p>
                                                                </td>
                                                                <td class="cart_price">
                                                                    <p><%=per_price%></p>
                                                                </td>
                                                            </tr>

                                                        </tbody>



                                                        <%
                                                            }

                                                        %>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </ul>

                            <ul>
                                <li>Sub Total <span  id="subtotal"><%=total_price%></span></li>
                                <li>VAT(2.5%) <span id="vat"><%out.print(total_price - total_price * .975);%></span></li>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span id="total"><%out.print(total_price + total_price - total_price * .975);%></span></li>
                                <li>Total(rounded) <span id="payable"><%out.print(Math.round(total_price + total_price - total_price * .975));%></span></li>
                                </span></li>
                            </ul>             
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#do_action-->


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

        <%
                request.setAttribute("slip", null);
            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>
    </body>
</html>