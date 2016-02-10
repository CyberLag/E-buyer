<%-- 
    Document   : cart
    Created on : Nov 5, 2014, 8:35:56 PM
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
<html lang="en">
    <head>

        <style type="text/css">
            #what{ 
                background-color :orange;
                height:30px;
                width:40px;
                font-size: 18px;
            }

            .hell
            { 
                height:30px;
                width:70px;
                text-align: center;
                font-size: 20px;
            }
        </style>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Wishlist | e-SHOPPER</title>
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
            //out.print(request.getParameter("fromlog"));
            try {
      
                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
                Statement stmt3 = db.connection.createStatement();
                Statement stmt4 = db.connection.createStatement();
                
                Statement stmt6 = db.connection.createStatement();
                ResultSet rs6=stmt6.executeQuery("select max(email)+1 as mx from cart");
                rs6.next();
                
                //out.print(rs6.getString("mx"));
                if(session.getAttribute("cartid")==null||(!(session.getAttribute("cartid").toString().compareTo("99999999")<0&&session.getAttribute("cartid").toString().compareTo("0")>0)))
                {
                    session.setAttribute("cartid",rs6.getString("mx"));
                }
                
                if (request.getParameter("cart_in") != null) {
                    String qry3 = "insert into cart values ( '" + session.getAttribute("cartid") + "'," + request.getParameter("cart_in") + ",1)";
                    //out.print(qry3);
                    ResultSet rs3 = stmt3.executeQuery(qry3);
                    request.setAttribute("cart_in", null);
                    String qry4 = "delete from wishlist where email like '" + session.getAttribute("userid") + "' and product_code>=" + request.getParameter("cart_in") + " and product_code<=" + request.getParameter("cart_in");
                    //out.print(qry3);
                    ResultSet rs4 = stmt4.executeQuery(qry4);
                }
                if (request.getParameter("wishlist_out") != null) {

                    String qry4 = "delete from wishlist where email like '" + session.getAttribute("userid") + "' and product_code>=" + request.getParameter("wishlist_out") + " and product_code<=" + request.getParameter("wishlist_out");
                    //out.print(qry3);
                    ResultSet rs4 = stmt4.executeQuery(qry4);
                    request.setAttribute("wishlist_out", null);
                }

                String check_mail = new String();

                ResultSet rs;

                check_mail = "select distinct(product_code) from wishlist where email like '" + session.getAttribute("userid") + "'";
                // out.println(check_mail);
                rs = stmt.executeQuery(check_mail);

             //out.print(rs6.getInt("subtotal"));
                 // while(rs.next())
                // out.print(rs.getString("count(*)"));
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
                        </div>
                    </div>
                    <div class="breadcrumbs">
                        <ol class="breadcrumb" style="margin-left: 48px; font-size: 17px;">
                            <li><a href="http://localhost:8084/e-SHOPPER/wishlist.jsp">WISHLIST</a>
                        </ol>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->

        <section id="cart_items">
            <div class="container">

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity"></td>
                                <td class="total"></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                String product_code = new String();
                                while (rs.next()) {
                                    //out.print("PPP");
                                    ResultSet rs2;
                                    String products = "";
                                    products = "select * from product where product_code=" + rs.getString("product_code");
                                    //out.print(check_mail);
                                    Statement stmt2 = db.connection.createStatement();
                                    rs2 = stmt2.executeQuery(products);
                                    product_code = rs.getString("product_code");
                                    while (rs2.next()) {
                                        String source = new String();
                                        source = "images/" + rs2.getString("product_code") + ".jpg";


                            %>

                            <tr >
                                <td class="cart_product">
                                    <a href=""><img style="height:100px;width:100px;" src="<%=source%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h5><%=rs2.getString("product_descrip")%></h5>
                                    <p>Product ID: <%=rs2.getString("product_code")%></p>
                                </td>
                                <td class="cart_price">
                                    <p>Tk.<%=rs2.getInt("product_sell_price")%></p>
                                </td>
                                <%
                                Statement stmt7 = db.connection.createStatement();
                String qry7 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "' and product_code="+product_code;
                ResultSet rs7 = stmt7.executeQuery(qry7);
                rs7.next();
                                if(rs7.getInt("count(*)")==0){
                                %>
                                <td>
                                    <form style="float: right" action="wishlist.jsp" method="post">

                                        <input type="hidden" name="cart_in" value=<%=product_code%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </form>
                                </td>
                                <%}else{%>
                                <td></td>
                                <%}%>
                                <td>
                                    <form style="float: right" action="wishlist.jsp" method="post">

                                        <input type="hidden" name="wishlist_out" value=<%=product_code%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from wishlist</button>
                                    </form>
                                </td>

                            </tr>

                            <%}
                         }%>

                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <!--/#do_action-->

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
                        <p class="pull-left">Copyright © 2013 e-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

        <%            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>
    </body>
</html>