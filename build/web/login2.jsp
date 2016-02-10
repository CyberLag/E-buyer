<%@page import="oracle.net.aso.p"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.eshopper.connection.Database" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login |  e-SHOPPER</title>
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
                String check_mail = new String();
                String check_mail2 = "0";
                String pass = new String();
                String header=new String();
                if(request.getHeader("Referer")==null)
                {
                    header="http://localhost:8084/e-SHOPPER/index.jsp";
                }
                else
                {
                    header=request.getHeader("Referer");
                }
                //session.setAttribute("cartid",99999999);
                
                //out.print(session.getAttribute("cartid"));
                ResultSet rs;
                if (header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp")) {
                    //out.println("connected....!!");

                    check_mail = "select count(*) from customer where email='" + request.getParameter("email") + "'";
                    rs = stmt.executeQuery(check_mail);
                    check_mail2 = "";
                    while (rs.next()) {
                        check_mail2 = rs.getString("count(*)");
                    }
                    //out.println("--"+check_mail2+"--");
                    String check_pass = "select password_ from customer where email='" + request.getParameter("email") + "'";
                    rs = stmt.executeQuery(check_pass);
                    while (rs.next()) {
                        pass = rs.getString("password_");
                    }
                }

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
                                    <li><a href="wishlist.jsp"><i class="fa fa-star"></i> Wishlist</a></li>
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a></li>
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
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
        <%         if ((!header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp")) || (header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp") && (check_mail2.startsWith("0")||pass.compareTo(request.getParameter("pwd")) != 0) && request.getParameter("fromlog").startsWith("yeslog")) || (header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp") && (!check_mail2.startsWith("0")) && (!request.getParameter("fromlog").startsWith("yeslog")))) {
                if (header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp") && ( request.getParameter("fromlog").startsWith("yeslog"))) {
                   
        %>
        <div style="margin-left: 500px"><br><br><br><br><br>Wrong email/password. Try Again</div>

        <%} else if ((header.startsWith("http://localhost:8084/e-SHOPPER/login.jsp") && (!check_mail2.startsWith("0")) && (!request.getParameter("fromlog").startsWith("yeslog")))) {%>

        <div style="margin-left: 500px"><br><br><br><br><br>Email Already Registered. Try Again</div>


        <%}
        else if(session.getAttribute("userid")!=null){
        session.setAttribute("userid", null);
        %>
        <div style="margin-left: 500px"><br><br><br><br><br>Logged out, hope to see you soon :)</div>    
        <%}%>	
        <section id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h2>Login to your account</h2>
                            <form action="login.jsp" method="POST">
                                <input type="email" name="email" placeholder="e-mail"/>
                                <input type="password" name="pwd" placeholder="password" />
                                <input type="hidden" name="fromlog" value="yeslog">
                                <!--<span>
                                    <input type="checkbox" class="checkbox"> 
                                    Keep me signed in
                                </span>-->
                                <button type="submit">Login</button>
                            </form>
                        </div><!--/login form-->
                    </div>
                    <div class="col-sm-1">
                        <h2 class="orclass">OR</h2>
                    </div>
                    <div class="col-sm-4">
                        <div class="signup-form"><!--sign up form-->
                            <h2>New User Signup!</h2>
                            <form action="login.jsp" method="POST">
                                <input type="text" name="fullname" placeholder="Name"/>
                                <input type="text" name="address" placeholder="House/Street"/>
                                <input type="text" name="city" placeholder="City"/>
                                <input type="email" name="email" placeholder="Email Address"/>
                                <input type="password" name="pwd" placeholder="Password"/>
                                <input type="hidden" name="fromlog" value="nolog">
                                <button type="submit" class="btn btn-default">Signup</button>
                            </form>
                        </div><!--/sign up form-->
                    </div>
                </div>
            </div>
        </section><!--/form-->
        <%        } else {
  
        if(check_mail2.startsWith("0")) {   
                
                rs =stmt.executeQuery("select max(customer_id)+1 from customer");
                String now_id=new String();
                while(rs.next())
                now_id=rs.getString("max(customer_id)+1");
                rs =stmt.executeQuery("select max(order_no)+1 from customer");
                String now_order=new String();
                while(rs.next())
                now_order=rs.getString("max(order_no)+1");
                String str="insert into customer values ( "+now_id+",'"+request.getParameter("address")+"','"+request.getParameter("city")+"','"+request.getParameter("fullname")+"',"+now_order+",'20-10-14','20-10-14',5,'"+request.getParameter("pwd")+"','"+request.getParameter("email")+"')";
               //out.println(str);
               stmt.executeQuery("insert into order_ values ( "+ now_order +", '18-09-14', 9)");
                stmt.executeQuery(str);
                
            }
            session.setAttribute("userid", request.getParameter("email"));%>    
        
        <%if(session.getAttribute("userid").equals("admin@eshopper.com")){
            //session.setAttribute("userid", null);
        %>
        <div style="margin-left: 500px"><br><br><br><br><br>You've logged in as Database Administrator
            <form action="update.jsp" method="post">
            <button style="float: up; margin-left: 120px" class="btn btn-default check_out" type="submit">Update Database</button>
            </form>
            <form action="stats.jsp" method="post">
            <button style="float: up; margin-left: 120px" class="btn btn-default check_out" type="submit">View Stats</button>
            </form></div>
            <br><br><br><br>
            <%}else{%>
            <div style="margin-left: 500px"><br><br><br><br><br>Success! Have a nice Shopping :)
            <form action="index.jsp" method="post">
            <button style="float: up; margin-left: 120px" class="btn btn-default check_out" type="submit">Start Shopping :)</button>
            </form>
            <br><br><br><br></div>
            
            <%}
        }
            %>

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                    </div>
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
                                    <li><a href="faq.jsp">FAQ?s</a></li>
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
                        <p class="pull-left">Copyright © 2013 e-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <%
            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
        %>

    </body>
</html>
