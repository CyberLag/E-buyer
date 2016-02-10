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
                font-size: 18px;
            }
        </style>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cart | e-SHOPPER</title>
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
                Statement stmt1 = db.connection.createStatement();
                Statement stmt = db.connection.createStatement();
                Statement stmt5 = db.connection.createStatement();

                Statement stmt8 = db.connection.createStatement();
                ResultSet rs8 = stmt8.executeQuery("select max(email)+1 as mx from cart");
                rs8.next();

                //out.print(rs6.getString("mx"));
                if (session.getAttribute("cartid") == null || (!(session.getAttribute("cartid").toString().compareTo("99999999") < 0 && session.getAttribute("cartid").toString().compareTo("0") > 0))) {
                    session.setAttribute("cartid", rs8.getString("mx"));
                }

                String check_mail = new String();
                String delete_prod = new String();
                String fullcart = new String();
                //out.print(request.getParameter("namejs"));
                ResultSet rs;
                Statement stmt3 = db.connection.createStatement();
                ResultSet rs3;
                ResultSet rs6;
                Statement stmt6 = db.connection.createStatement();
                if (request.getParameter("delete_from_cart") != null) {
                    delete_prod = "delete from cart where product_code=" + request.getParameter("delete_from_cart") + " and email like '" + session.getAttribute("cartid") + "'";
                    //out.println(delete_prod);
                    rs3 = stmt3.executeQuery(delete_prod);
                }
                check_mail = "select * from cart where email like '" + session.getAttribute("cartid") + "'";
                //out.println(check_mail);
                rs = stmt.executeQuery(check_mail);

                fullcart = "select sum(product_sell_price * quantity) as subtotal from cart join product using(product_code) where email like '" + session.getAttribute("cartid") + "'";
                rs6 = stmt6.executeQuery(fullcart);
                rs6.next();

                Statement stmt7 = db.connection.createStatement();
                String qry7 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "'";
                ResultSet rs7 = stmt7.executeQuery(qry7);
                rs7.next();
             //out.print(rs6.getInt("subtotal"));
                String qry5 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "'";
                ResultSet rs5 = stmt5.executeQuery(qry5);
                rs5.next();
                 // while(rs.next())
                // out.print(rs.getString("count(*)"));
        %>


        <script>
            var subtotal = 0;
            var x = [], val = [];
            var tot = 0;

            function complete_purchase()
            {
                var name = "";
                var iter = 0;
                for (iter = 0; iter <= 100000; iter++)
                {
                    if (x[iter] > 0 && x[iter] <= 100000010)
                    {
                        name += (iter + "-" + x[iter] + "-");
                    }
                }
                window.location.replace("checkout.jsp?slip=" + name);
            }


            function myFunction_plus(id, a) {
                //   rs6=stmt6.executeQuery(fullcart);
                //  rs6.next();


                //  rs6=stmt6.executeQuery(fullcart);
                //  rs6.next();

                if (!(x[id] >= 0 && x[id] <= 100000010))
                {
                    x[id] = 1;
                    val[id] = a;

                    tot += a;
                }
                else
                    x[id]++, tot += val[id];

                // subtotal += 59;

                document.getElementById("demo" + id).innerHTML = x[id];
                document.getElementById("demo1" + id).innerHTML = "tk. " + x[id] * a;
                document.getElementById("subtotal").innerHTML = tot;
                document.getElementById("vat").innerHTML = tot * 25 / 1000;
                document.getElementById("total").innerHTML = tot + (tot * 25 / 1000);
                document.getElementById("payable").innerHTML = Math.round(tot + (tot * 0.025));

                // int cnt=0;

                // var i=parseInt(0);        
                // for(;i<100;i++){
                //     
                //        cnt++;
                //     
                // }    
                // if((x[id] > 0 && x[id] <= 100000010)){
                // Statement stmt8 = conn.createStatement();
                // String qry8 = "update cart set quantity=quantity+1 where email like '" + session.getAttribute("cartid") + "' and product_code=13";
                // ResultSet rs8 = stmt8.executeQuery(qry8);

                //   }

            }
            function myFunction_minus(id, a) {
                if (!(x[id] >= 0 && x[id] <= 100000010))
                    x[id] = 0;
                if (x[id] > 0)
                    x[id]--, tot -= val[id];
                // subtotal += 59;
                document.getElementById("demo" + id).innerHTML = x[id];
                document.getElementById("demo1" + id).innerHTML = "tk. " + x[id] * a;
                document.getElementById("subtotal").innerHTML = tot;
                document.getElementById("vat").innerHTML = tot * 25 / 1000;
                document.getElementById("total").innerHTML = tot + (tot * 25 / 1000);
                document.getElementById("payable").innerHTML = Math.round(tot + (tot * 0.025));
                // rs6=stmt6.executeQuery(fullcart);


            }

        </script>


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
                        <ol class="breadcrumb" style="margin-left: 48px;font-size: 17px;">
                            <li><a href="http://localhost:8084/e-SHOPPER/cart.jsp">CART</a>
                        </ol>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->

        <section id="cart_items">
            <div class="container">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <div class="table-responsive cart_info">
                            <table class="table table-condensed">
                                <thead>
                                    <tr class="cart_menu">
                                        <td class="image">Item</td>
                                        <td class="description"></td>
                                        <td class="price">Price</td>
                                        <td class="quantity">Quantity</td>
                                        <td class="total">Total</td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>

                                    <% int grand_total = 0;
                                        int extra = 0;
                                        while (rs.next()) {

                                            ResultSet rs2;
                                            String products = "";
                                            products = "select * from product where product_code=" + rs.getString("product_code");
                                            //out.print(check_mail);
                                            Statement stmt2 = db.connection.createStatement();
                                            rs2 = stmt2.executeQuery(products);
                                            //int count=0;
                                            while (rs2.next()) {
                                                // count++;
                                                String source = new String();
                                                source = "images/" + rs2.getString("product_code") + ".jpg";
                                                grand_total += rs2.getInt("product_sell_price");
                                                extra = 0;
                                                if (request.getParameter("update_cart") != null) {// out.println(request.getParameter(rs2.getString("product_code")));
                                                    extra += rs2.getInt("product_sell_price") * (Integer.parseInt((request.getParameter(rs2.getString("product_code")))) - 1);
                                                }
                                                grand_total += extra;
                                                //session.setAttribute("product_code", rs2.getString("product_code"));
                                                // out.print(session.getAttribute("product_code"));
                                    %>


                                <script type="text/javascript" language="JavaScript">
                                    myFunction_plus('<%=rs2.getString("product_code")%>',<%=rs2.getInt("product_sell_price")%>);
                                </script>
                                <tr >
                                    <td class="cart_product">
                                        <img style="height:100px;width:100px;" src="<%=source%>" alt="">
                                    </td>
                                    <td class="cart_description">
                                        <h5><%=rs2.getString("product_descrip")%></a></h5>
                                        <p>Product ID: <%=rs2.getString("product_code")%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>Tk.<%=rs2.getInt("product_sell_price")%></p>
                                    </td>

                                    <td class="cart_quantity">
                                        <table style="margin-left: 100px;" >
                                            <td > <button id="what" onclick="myFunction_minus('<%=rs2.getString("product_code")%>',<%=rs2.getInt("product_sell_price")%>)"> - </button></td>
                                            <form>
                                                <td  class="hell"> 
                                                    <div id="demo<%=rs2.getString("product_code")%>" > 1 </div>
                                                </td>
                                            </form> 
                                            <td ><button id="what" onclick="myFunction_plus('<%=rs2.getString("product_code")%>',<%=rs2.getInt("product_sell_price")%>)"> + </button></td>

                                </tr>

                            </table>
                            </td>
                            <td class="cart_total" style="width:150px;">
                                <div id="demo1<%=rs2.getString("product_code")%>" class="cart_total_price"  > tk. <%=rs2.getInt("product_sell_price")%> </div> 
                            </td>
                            <form>
                                <td class="cart_delete">
                                    <button type="submit" class="btn btn-default add-to-cart" name="delete_from_cart" value=<%=rs2.getInt("product_code")%>>Remove</button>
                                </td>
                            </form>

                            </tr>

                            <%}
                                }%>

                            </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <section style="margin-left: 650px" id="do_action">
            <div class="container">
                <div class="row">

                    <div class="col-sm-6">
                        <div class="total_area">
                            <ul>
                                <li>Cart Sub Total <span  id="subtotal"><%out.print(rs6.getInt("subtotal"));%>/-</span></li>
                                <li>VAT(2.5%) <span id="vat"><%out.print(rs6.getInt("subtotal") * 0.025);%>/-</span></li>
                                <li>Shipping Cost <span>Free</span></li>
                                <li>Total <span id="total"><%out.print(rs6.getInt("subtotal") + (rs6.getInt("subtotal") * 0.025));%>/-</span></li>
                                <li>Total Payable(rounded) <span id="payable"><%out.print(Math.round(rs6.getInt("subtotal") + (rs6.getInt("subtotal") * 0.025)));%>/-</span></li>
                            </ul>

                            <button style="float: right" class="btn btn-default check_out" onclick="complete_purchase()">Check Out</button>
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
                                    <li><a href="help.jsp">Online Help</a></li>
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
                                    <li><a href="#">Billing System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#">Company Information</a></li>
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