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
<%@page import="java.util.*" %>
<%@page import="com.eshopper.connection.Database" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Stats | e-SHOPPER</title>
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

        <!--  <form id='myform' method='POST' action='#'>
          <input type='button' value='-' class='qtyminus' field='quantity' />
          <input type='text' name='quantity' value='0' class='qty' />
          <input type='button' value='+' class='qtyplus' field='quantity' /> -->
        <form name="connect" method="post" action="/connect">
        </form>
        <%
            //out.print(request.getParameter("fromlog"));
            Connection conn = null;
            try {
                if (session.getAttribute("userid") == null || (session.getAttribute("userid").toString().length()<=4)) {
                    response.sendRedirect("http://localhost:8084/e-SHOPPER/index.jsp");
                }

                //out.print(".."+session.getAttribute("userid")+"..");
                // response.sendRedirect("http://localhost:8084/e-SHOPPER/src/java/NewClass");
                // if(session.getAttribute("userid") == null||(!session.getAttribute("userid").equals("admin@swapno.com")))
                // response.sendRedirect("http://localhost:8084/e-SHOPPER/index.jsp");
                double amntsold = 0.0, amntpurchased = 0.0;
                Database db = new Database();
                db.connect();
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
                                    <li><a href="update.jsp"><i class="fa fa-pencil-square-o"></i> Upadate</a></li>
                                        <%//String temp = session.getAttribute("userid").toString();
                                            if (session.getAttribute("userid") != null && (!session.getAttribute("userid").toString().endsWith("0"))) {%>

                                    <li><a href="account.jsp"><%=session.getAttribute("userid")%></a></li>
                                    <li><a href="login.jsp"><i class="fa fa-unlock"></i> Logout</a></li>
                                        <%} else {%>
                                    <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
                        </div>

                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->



        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb" style="font-size: 17px;">
                        <li><a href="index.jsp">Home</a> </li>
                        <i class=" fa fa-caret-right"></i></li>
                        <a href="http://localhost:8084/e-SHOPPER/stats.jsp"> STATS</a>
                    </ol>
                </div>

                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="price">Product Name</td>
                                <td class="price">Product Code</td>
                                <td class="price">Date & Time(from)</td>
                                <td class="price">Date & Time(to)</td>
                                <td class="price">Subcategory</td>
                                <td class="price">Customer Email</td>

                            </tr>
                        </thead>

                        <tbody>

                        <form action="stats.jsp" method="post">
                            <tr>

                                <td class="cart_description">
                                    <input class="cart_quantity_input" type="text" name="product_name" size="16">
                                </td>
                                <td class="cart_price">
                                    <input class="cart_quantity_input" type="number" name="product_code" min="0" value="0" autocomplete="off" size="8">
                                </td>
                                <td class="cart_description">

                                    <input type="datetime-local" name="start_date_time" size="16">
                                </td>
                                <td class="cart_description">

                                    <input type="datetime-local" name="end_date_time" size="16">
                                </td>

                                <td>
                                    <select name="subcategory">
                                        <option value="0">All</option>
                                        <option value="1">Fruits & Vegetables</option>
                                        <option value="2">Breakfast</option>
                                        <option value="3">Beverage</option>
                                        <option value="4">Meat & Fish</option>
                                        <option value="5">Batteries</option>
                                        <option value="6">Printing</option>
                                        <option value="7">Health Care</option>
                                        <option value="8">Personal Care</option>
                                        <option value="9">Cooking</option>
                                        <option value="10">Mens Dress</option>
                                        <option value="11">Womens Dress</option>
                                        <option value="12">Electrical</option>
                                        <option value="13">Sweets</option>
                                        <option value="14">Food</option>
                                        <option value="15">Care</option>
                                    </select>
                                </td>
                                <td class="cart_description">
                                    <input class="cart_quantity_input" type="text" name="customer_email" size="16">
                                </td>
                            </tr>
                            <tr>
                                <td></td><td></td><td></td><td></td><td></td>
                                <td style="" class="cart_delete">
                                    <button class="btn btn-default check_out" type="submit">VIEW STATS</button>
                                </td>
                            </tr>
                        </form>

                        </tbody>


                    </table>

                </div>

                <%
                    if (request.getParameter("product_code") != null) {
                        int flag = 0;
                        Statement stmt = db.connection.createStatement();
                        String query = new String();
                        query = "select * from logs";
//out.print(update_prod);
                        if (!request.getParameter("product_name").equals("")) {
                            String arr[] = new String[110];
                            arr = request.getParameter("product_name").toLowerCase().split(" ");
                            query += " where (lower(product_name) like '%" + arr[0] + "%'";
                            flag = 1;
                            for (int i = 1; i < arr.length; i++) {
                                query += " or lower(product_name) like '%" + arr[i] + "%'";
                            }
                            query += ")";
                        }
                        if (!request.getParameter("product_code").equals("0")) {
                            if (flag == 0) {
                                query += " where product_code=" + request.getParameter("product_code");
                                flag = 1;
                            } else {
                                query += " and product_code=" + request.getParameter("product_code");
                            }
                        }
                        if (!request.getParameter("start_date_time").equals("")) {
                            if (flag == 0) {
                                query += " where sell_date_time>='" + request.getParameter("start_date_time") + "'";
                                flag = 1;
                            } else {
                                query += " and sell_date_time>='" + request.getParameter("start_date_time") + "'";
                            }
                        }
                        if (!request.getParameter("end_date_time").equals("")) {

                            /*String dt= (new java.util.Date()).toString();
                             String arr[]=new String[10];
                             arr=dt.split(" ");
                             String datetime=arr[5]+"-";
                             if(arr[1].equals("Jan"))
                             datetime+="01";
                             else if(arr[1].equals("Feb"))
                             datetime+="02";
                             else if(arr[1].equals("Mar"))
                             datetime+="03";
                             else if(arr[1].equals("Apr"))
                             datetime+="04";
                             else if(arr[1].equals("May"))
                             datetime+="05";
                             else if(arr[1].equals("Jun"))
                             datetime+="06";
                             else if(arr[1].equals("Jul"))
                             datetime+="07";
                             else if(arr[1].equals("Aug"))
                             datetime+="08";
                             else if(arr[1].equals("Sep"))
                             datetime+="09";
                             else if(arr[1].equals("Oct"))
                             datetime+="10";
                             else if(arr[1].equals("Nov"))
                             datetime+="11";
                             else if(arr[1].equals("Dec"))
                             datetime+="12";
                             datetime+="-"+arr[2]+"T"+arr[3].substring(0, 5);
                             out.println("."+datetime+".");*/
                            if (flag == 0) {
                                query += " where sell_date_time<='" + request.getParameter("end_date_time") + "'";
                                flag = 1;
                            } else {
                                query += " and sell_date_time<='" + request.getParameter("end_date_time") + "'";
                            }
                        }
                        if (!request.getParameter("subcategory").equals("0")) {
                            if (flag == 0) {
                                query += " where subcategory=" + request.getParameter("subcategory");
                                flag = 1;
                            } else {
                                query += " and subcategory=" + request.getParameter("subcategory");
                            }
                        }
                        if (!request.getParameter("customer_email").equals("")) {
                            if (flag == 0) {
                                query += " where email like '" + request.getParameter("customer_email") + "'";
                                flag = 1;
                            } else {
                                query += " and email like '" + request.getParameter("customer_email") + "'";
                            }
                        }

                        // out.println(query);
                        out.println("Search Results:");
                        ResultSet rs;
                        rs = stmt.executeQuery(query);

                %>
                <div class="table-responsive cart_info">  <!--logs-->

                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="price">Product Name</td>
                                <td class="price">Product Code</td>
                                <td class="price">Subcategory</td>
                                <td class="price">Sell Date & Time</td>
                                <td class="price">Quantity Sold</td>
                                <td class="price">Purchase Price</td>
                                <td class="price">Sell Price</td>
                                <td class="price">Customer Email</td>
                            </tr>
                        </thead>

                        <tbody>
                            <%                           while (rs.next()) {

                                    amntsold += rs.getInt("sell_price");
                                    amntpurchased += rs.getInt("purchase_price");
                            %>
                            <tr>

                                <td class="cart_description">
                                    <p><%=rs.getString("product_name")%></p>
                                </td>
                                <td class="cart_price">
                                    <p><%=rs.getInt("product_code")%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getString("subcategory")%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getString("sell_date_time").substring(0, 10) + " - " + rs.getString("sell_date_time").substring(11, 16)%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getInt("quantity_sold")%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getInt("purchase_price")%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getInt("sell_price")%></p>
                                </td>
                                <td class="cart_description">
                                    <p><%=rs.getString("email")%></p>
                                </td>
                            </tr>

                            <%}%>
                        </tbody>


                    </table>

                </div>
                <%}%>





            </div>
        </section> <!--/#cart_items-->



        <section style="margin-left: 650px" id="do_action">
            <div class="container">
                <div class="row">

                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Total Sold Amount<span  id="subtotal"><%=amntsold%>/-</span></li>
                                <li>Total Purchase Price of the Sold Products <span id="vat"><%=amntpurchased%>/-</span></li>
                                <li>Total Profit <span><%out.print(amntsold - amntpurchased);%>/-</span></li>
                                <li>Tax Paid <span id="total"><%out.print(amntsold * .05);%>/-</span></li>
                                <li>Total Profit After Tax<span><%out.print(amntsold - amntpurchased - amntsold * .05);%>/-</span></li>
                                <li>Total Profit(in percentage)<span><%out.print((amntsold - amntpurchased - amntsold * .05) / amntpurchased * 100);%>%</span></li>
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
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <%            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>
    </body>
</html>