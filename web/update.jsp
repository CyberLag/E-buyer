
<%--
    Document   : cart
    Created on : Nov 5, 2014, 8:35:56 PM
    Author     : Al-Amin
--%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Update DB | e-SHOPPER</title>
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
           try 
            {
                String product_pic2=new String();
                //out.print(".."+session.getAttribute("userid")+"..");
                // response.sendRedirect("src/java/NewClass");
                if (session.getAttribute("userid") == null){ //|| (!session.getAttribute("userid").equals("admin@eshopper.com"))) {
                    response.sendRedirect("index.jsp");
                }
                
                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
               Statement stmt10 = db.connection.createStatement();
                    ResultSet rs10;
                    String qry10="select customer_id from customer where email='"+session.getAttribute("userid")+"'";
                    
                    rs10 = stmt10.executeQuery(qry10);
                    rs10.next();
                    int customer_id=rs10.getInt("customer_id");
                    
                    
                   
// out.print(request.getParameter("subcategory"));
                if (request.getParameter("insert") != null) {
                    //out.print("Product Inserted in Database");
                    Statement stmt5 = db.connection.createStatement();
                    String insert_prod = new String();

                    
                    
                    
                    Statement stmt6 = db.connection.createStatement();
                    ResultSet rs6;
                    String qry6="select max(product_code)+1 as mx from customer_product where customer_id="+customer_id;
                    rs6 = stmt6.executeQuery(qry6);
                    rs6.next();
                    insert_prod = "insert into customer_product values ("+customer_id+"," + rs6.getInt("mx") + ",'" + request.getParameter("insert") + "'," + request.getParameter("sell_price") + "," + request.getParameter("purchase_price") + ",'" + request.getParameter("exp_date") + "',0," + request.getParameter("stock_rem") + "," + request.getParameter("subcategory") + ",'" + request.getParameter("unit") + "')";
                    //out.print(insert_prod);
                  
                    stmt5.executeQuery(insert_prod);

                }
                if (request.getParameter("delete_from_db") != null) {
                    Statement stmt7 = db.connection.createStatement();
                    String delete_prod = new String();
                    delete_prod = "delete from customer_product where  product_code=" + request.getParameter("delete_from_db")+" and customer_id="+ customer_id;
                    //out.print(delete_prod);
                    stmt7.executeQuery(delete_prod);
                } else if (request.getParameter("update_db") != null) {
                    Statement stmt4 = db.connection.createStatement();
                    String update_prod = new String();
                    update_prod = "update customer_product set product_sell_price=" + request.getParameter("sell_price") + " , product_purchase_price=" + request.getParameter("purchase_price") + " , product_stock_remaining=" + request.getParameter("stock_rem") + " where product_code=" + request.getParameter("update_db")+" and customer_id="+ customer_id;
                    //out.print(update_prod);
                    stmt4.executeQuery(update_prod);
                }

                //String qry = new String();
                String delete_prod = new String();
                //ResultSet rs;
                //qry = "select * from product";

                Statement stmt3 = db.connection.createStatement();
                ResultSet rs3;
               // out.print(qry10);
                //if(request.getParameter("delete_from_cart")!=null)
                //{delete_prod="delete from cart where product_code="+request.getParameter("delete_from_cart")+" and email like '"+session.getAttribute("cartid")+"'";
                //out.println(delete_prod);
                //rs3 = stmt3.executeQuery(delete_prod);}
                //check_mail = "select * from cart where email like '" + session.getAttribute("cartid") + "'";
                //out.println(check_mail);
                //rs = stmt.executeQuery(qry);

                     // while(rs.next())
                // out.print(rs.getString("count(*)"));
        %>
        <header id="header"><!--header-->
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

                                    <li><a href="stats.jsp"><i class="fa fa-file"></i>Stats</a></li>
                                        <%//String temp = session.getAttribute("userid").toString();
                                            if (session.getAttribute("userid") != null && (!session.getAttribute("userid").toString().endsWith("0"))) {%>

                                    <li><a href="account.jsp"><i class="fa fa-user"></i><%=session.getAttribute("userid")%></a></li>
                                    <li><a href="login.jsp"><i class="fa fa-unlock"></i> Logout</a></li>
                                        <%} else {%>
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
                        <a href="update.jsp"> Update Database</a>
                    </ol>
                </div>


                <%if (request.getParameter("insert") != null) {%>
                Product Successfully Inserted Into Database  
                <%}
                %>
                <div class="table-responsive cart_info">

                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="price">Product Image</td>
                                <td class="price"></td>
                                <td class="price">Item Name</td>
                                <td class="price">Purchase Price</td>
                                <td class="price">Sell Price</td>
                                <td class="quantity">Stock Rem</td>
                                <td class="quantity">Exp.Date</td>
                                <td class="price">Subcategory</td>
                                <td class="price">Unit</td>

                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <!-- upload image section -->        
                                <td >
                                    <%
         //out.print((request.getRequestURL()).toString());
                                        if (request.getParameter("is_image_selected") == null || !request.getParameter("is_image_selected").startsWith("yes")) {
                                        //request.setAttribute("is_image_selected","yes");
                                    %>
                                    <form method="POST" action="update.jsp?is_image_selected=yes" enctype="multipart/form-data" style="width: 110px; padding-top: 5px; height: 65px;">
                                        <%
                                            String saveFile = new String();
                                            String contentType = request.getContentType();
                                            if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                                                DataInputStream in = new DataInputStream(request.getInputStream());

                                                int formDataLength = request.getContentLength();
                                                byte dataBytes[] = new byte[formDataLength];
                                                int byteRead = 0;
                                                int totalBytesRead = 0;

                                                while (totalBytesRead < formDataLength) {
                                                    byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                                                    totalBytesRead += byteRead;
                                                }
                                                String file = new String(dataBytes);

                                                saveFile = file.substring(file.indexOf("filename=\"") + 10);
                                                saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                                                saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

                                                int lastIndex = contentType.lastIndexOf("=");

                                                String boundary = contentType.substring(lastIndex + 1, contentType.length());

                                                int pos;

                                                pos = file.indexOf("filename=\"");
                                                pos = file.indexOf("\n", pos) + 1;
                                                pos = file.indexOf("\n", pos) + 1;
                                                pos = file.indexOf("\n", pos) + 1;

                                                int boundaryLocation = file.indexOf(boundary, pos) - 4;

                                                int startPos = ((file.substring(0, pos)).getBytes()).length;
                                                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                                                Statement stmt9 = db.connection.createStatement();
                                                ResultSet rs9;
                                                rs9 = stmt9.executeQuery("select max(product_code)+1 as mx from customer_product where customer_id="+rs10.getString("customer_id"));
                                                rs9.next();

                                                saveFile = "C:/Users/User/Desktop/e-SHOPPER/web/images/"+customer_id+"_" + rs9.getString("mx") + ".jpg";
                                                //saveFile = "C:/uploadDir2/" + saveFile;
                                                //out.print(saveFile);
                                                File ff = new File(saveFile);

                                                try {
                                                    FileOutputStream fileOut = new FileOutputStream(ff);
                                                    fileOut.write(dataBytes, startPos, (endPos - startPos));
                                                    fileOut.flush();
                                                    fileOut.close();

                                                } catch (Exception e) {
                                                    out.println(e);
                                                }

                                            }
                                        %>
                                        <br><br><br>
.                                        <input type="file" name="file" value="" /><br>
                                         <input type="hidden" name="is_image_selected" value="yes">
                                        <input type="submit" value="Upload" name="submit" />
                                    </form>
                                    <%
                                    } else {

                                        String saveFile = new String();
                                        String contentType = request.getContentType();
                                        if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                                            DataInputStream in = new DataInputStream(request.getInputStream());

                                            int formDataLength = request.getContentLength();
                                            byte dataBytes[] = new byte[formDataLength];
                                            int byteRead = 0;
                                            int totalBytesRead = 0;

                                            while (totalBytesRead < formDataLength) {
                                                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                                                totalBytesRead += byteRead;
                                            }
                                            String file = new String(dataBytes);

                                            saveFile = file.substring(file.indexOf("filename=\"") + 10);
                                            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                                            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));

                                            int lastIndex = contentType.lastIndexOf("=");

                                            String boundary = contentType.substring(lastIndex + 1, contentType.length());

                                            int pos;

                                            pos = file.indexOf("filename=\"");
                                            pos = file.indexOf("\n", pos) + 1;
                                            pos = file.indexOf("\n", pos) + 1;
                                            pos = file.indexOf("\n", pos) + 1;

                                            int boundaryLocation = file.indexOf(boundary, pos) - 4;

                                            int startPos = ((file.substring(0, pos)).getBytes()).length;
                                            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                                            Statement stmt9 = db.connection.createStatement();
                                            ResultSet rs9;
                                           rs9 = stmt9.executeQuery("select max(product_code)+1 as mx from customer_product where customer_id="+customer_id);
                                                rs9.next();

                                                saveFile = "C:/Users/User/Desktop/e-SHOPPER/web/images/"+customer_id+"_" + rs9.getString("mx") + ".jpg";
                   //saveFile = "C:/uploadDir2/" + saveFile;
                                            //out.print(saveFile);
                                                product_pic2="images/"+customer_id+"_" + rs9.getString("mx") + ".jpg";
                                            File ff = new File(saveFile);

                                            try {
                                                FileOutputStream fileOut = new FileOutputStream(ff);
                                                fileOut.write(dataBytes, startPos, (endPos - startPos));
                                                fileOut.flush();
                                                fileOut.close();

                                            } catch (Exception e) {
                                                out.println(e);
                                            }

                                        }
                                    
                                    %>
                                    
                                    
                                    Image Selected.
                                     
                                           
                                    <form method="post" action="update.jsp">
                                        
                                        <input type="hidden" name="is_image_selected" value="no">
                                        <button type="submit">reset</button>

                                    </form>
                                    
                                    
                                    
                                </td>
                                <td class="cart_description"><img src=<%=product_pic2%> alt="ProductImage" style="height:150px;width:150px;"></div>
                                            </td>
                                            <%}%>
                                <!-- end of image upload section -->

                        <form action="update.jsp" method="post">

                            <td class="cart_description">

                                <input class="cart_quantity_input" type="text" name="insert" size="10" style="width:120px;">
                            </td>
                            <td class="cart_price">
                                <input class="cart_quantity_input" type="number" name="purchase_price" min="0" value="0" autocomplete="off" size="4" style="width:70px;">
                            </td>
                            <td class="cart_price">
                                <input class="cart_quantity_input" type="number" name="sell_price" min="0" value="0" autocomplete="off" size="4" style="width:70px;">
                            </td>
                            <td class="cart_quantity">
                                    <input class="cart_quantity_input" type="number" name="stock_rem" min="0" value="0" autocomplete="off" size="4" style="width:70px;">
                            </td>

                            <td class="cart_description">

                                <input type="date" name="exp_date" size="8" style="width:120px;">
                            </td>
                            


                            <td style="width:100px;"> 
                                <select name="subcategory">
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

                            <td style="width:80px;">
                                <select name="unit">
                                    <option value="/kg">/kg</option>
                                    <option value="/dozen">/dozen</option>
                                    <option value="/litre">/litre</option>
                                    <option value="/piece">/piece</option>
                                    <option value="/ream">/ream</option>

                                </select>
                            </td>




                            </tr>
                            <tr>
                                <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                <td style="float: right" class="cart_delete">
                                    <input type="hidden" name="is_image_selected" value="no">
                                    <button class="btn btn-default check_out" type="submit">INSERT NEW PRODUCT</button>

                                </td>
                            </tr>
                        </form>

                        </tbody>

                    </table>

                </div>
                <div style="margin: 10px; font-size: 22px; color: #00CC00">
                    <b>Sub-Categories :</b>
                </div>

                <%
                    String qry7 = new String();

                    ResultSet rs7;
                    qry7 = "select max(subcategory_id) as mxc from subcategory";

                    rs7 = stmt.executeQuery(qry7);
                    rs7.next();

                    int maxcat = rs7.getInt("mxc");
                    for (int iter = 1; iter <= maxcat; iter++) {

                        String qry8 = new String();

                        ResultSet rs8;
                        qry8 = "select subcategory_name from subcategory where subcategory_id=" + iter;

                        rs8 = stmt.executeQuery(qry8);
                        rs8.next();
                        String subcategory_name = rs8.getString("subcategory_name");

                        String qry = new String();

                        ResultSet rs;
                        qry = "select * from customer_product where subcategory_id=" + iter+" and customer_id="+customer_id+" and product_code>0";
                        rs = stmt.executeQuery(qry);
                        

                %>
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <details style="color:lightslategrey; font: bold">
                            <summary><h4 class="panel-title"><%out.print(subcategory_name);%></h4></summary>
                            <p>If your browser supports this element, it should allow you to expand and collapse these details.</p>
                            <div class="table-responsive cart_info">

                                <table class="table table-condensed">
                                    <thead>
                                        <tr class="cart_menu">
                                            <td class="price">Image</td>
                                            <td class="price">Item</td>
                                            <td class="price">Purchase Price</td>
                                            <td class="price">Sell Price</td>
                                            <td class="quantity">Stock Remaining</td>

                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <% int grand_total = 0;
                                            int extra = 0;
                                            while (rs.next()) {

                                                ResultSet rs2;
                                                String products = "";
                                                products = "select * from customer_product where product_code=" + rs.getString("product_code")+" and customer_id="+customer_id;
                                                //out.print(products);
                                                Statement stmt2 = db.connection.createStatement();
                                                rs2 = stmt2.executeQuery(products);
                                                String product_pic="images/"+customer_id+"_"+rs.getString("product_code")+".jpg";
                                                //out.print(product_pic);
%>
                                     <tr>        
                                              <%  while (rs2.next()) {
                                                    //String source = new String();
                                                    //source ="images/"+rs2.getString("product_code") + ".jpg";
                                                    //grand_total+=rs2.getInt("product_sell_price");
                                                    //extra=0;
                                                    //if(request.getParameter("update_cart")!=null)
                                                    //{// out.println(request.getParameter(rs2.getString("product_code")));
                                                    //    extra+=rs2.getInt("product_sell_price") * (Integer.parseInt((request.getParameter(rs2.getString("product_code"))))-1);
                                                    // }
                                                    // grand_total+=extra;
%>
                                    
                                    <form action="update.jsp" method="post">
                                        <tr>
                                            <td class="cart_description"><img src=<%=product_pic%> alt="ProductImage" style="height:150px;width:150px;"></div>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="index.jsp"> <%=rs2.getString("product_descrip")%></a></h4>
                                                <p>    Product ID: <%=rs2.getString("product_code")%></p>
                                            </td>
                                            <td class="cart_price">
                                                <input class="cart_quantity_input" type="number" name="purchase_price" min="0" value=<%=rs2.getString("product_purchase_price")%> autocomplete="off" size="8">
                                            </td>
                                            <td class="cart_price">
                                                <input class="cart_quantity_input" type="number" name="sell_price" min="0" value=<%=rs2.getString("product_sell_price")%> autocomplete="off" size="8">
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <input class="cart_quantity_input" type="number" name="stock_rem" min="0" value=<%=rs2.getString("product_stock_remaining")%> autocomplete="off" size="8">
                                                </div>  
                                            </td>

                                            <td>
                                                <input type="hidden" name="update_db" value=<%=rs2.getString("product_code")%>>

                                                <button class="btn btn-default check_out" type="submit">UPDATE</button>
                                            </td>
                                            <td>
                                                <button type="submit" class="btn btn-default check_out" name="delete_from_db" value=<%=rs2.getInt("product_code")%>>DELETE</button>
                                            </td>
                                        </tr>

                                    </form>

                                    
                                            
                                    
                                    <%}%>
                                    </tr>
                                   
                                    
                                    <%
                                    }
                                    
                                    %>
                                
                                    </tbody>

                                </table>
                            </div>
                    </div>
                </div>
                <%}
                
                %>
                </details>
                </div>
        </section> <!--/#cart_items-->
 

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
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <%            } catch (Exception e) {
               out.println("Exception : " + e.getMessage() + "");
            }
        %>
    </body>
</html>