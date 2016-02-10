package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Random;
import java.lang.*;
import oracle.net.aso.p;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import com.eshopper.connection.Database;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>Home | e-SHOPPER </title>\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/prettyPhoto.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/price-range.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/animate.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/main.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"css/responsive.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/ico/favicon.ico\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"144x144\" href=\"images/ico/apple-touch-icon-144-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"114x114\" href=\"images/ico/apple-touch-icon-114-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" sizes=\"72x72\" href=\"images/ico/apple-touch-icon-72-precomposed.png\">\n");
      out.write("        <link rel=\"apple-touch-icon-precomposed\" href=\"images/ico/apple-touch-icon-57-precomposed.png\">\n");
      out.write("    </head>\n");
      out.write("    <body> \n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            try {

                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
                Statement stmt1 = db.connection.createStatement();
                Statement stmt2 = db.connection.createStatement();
                Statement stmt3 = db.connection.createStatement();
                Statement stmt4 = db.connection.createStatement();

                Statement stmt6 = db.connection.createStatement();

                ResultSet rs6 = stmt6.executeQuery("select max(email)+1 as mx from cart");
                rs6.next();

                if (session.getAttribute("cartid") == null || (!(session.getAttribute("cartid").toString().compareTo("99999999") < 0 && session.getAttribute("cartid").toString().compareTo("0") > 0))) {
                    session.setAttribute("cartid", rs6.getString("mx"));
                }
                //out.print(session.getAttribute("cartid"));
                //  String key=request.getParameter("key");
                Statement stmt7 = db.connection.createStatement();
                ResultSet rs7 = stmt7.executeQuery("select max(subcategory_id) as mxsc from subcategory");
                rs7.next();
                
                
                //out.print(rs7.getInt("mxsc"));
                
               // Random rn = new Random();
              //  int val=rn.nextInt();
              //  if(val<0)
              //      val*=-1;
              //  int scid =1 + (val % rs7.getInt("mxsc"));
                //out.print(scid);
                
              //  String qry1 = "select * from PRODUCT where subcategory_id="+scid;
              //  ResultSet rs1 = stmt1.executeQuery(qry1);
                Statement stmt8 = db.connection.createStatement();
                String qry8="select product_code,sum(quantity_sold) as sm from logs group by product_code order by sm desc";
                ResultSet rs8 = stmt8.executeQuery(qry8);
                
               // String total_res = new String();
                //total_res = "select count(*) from PRODUCT where subcategory_id="+scid;
                if (request.getParameter("cart_in") != null) {
                    String qry3 = "insert into cart values ( '" + session.getAttribute("cartid") + "'," + request.getParameter("cart_in") + ",1)";
                    //out.print(qry3);
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
                    //out.print(qry4);
                    ResultSet rs4 = stmt4.executeQuery(qry4);
                    request.setAttribute("wishlist_in", null);
                }
                if (request.getParameter("wishlist_out") != null) {

                    String qry4 = "delete from wishlist where email like '" + session.getAttribute("userid") + "' and product_code=" + request.getParameter("wishlist_out");
                    //out.print(qry3);
                    ResultSet rs4 = stmt4.executeQuery(qry4);
                    request.setAttribute("wishlist_out", null);
                }
             //   ResultSet rs = stmt.executeQuery(total_res);
             //   String page_number = new String();
             //   if (request.getParameter("found_something") != null) {
              //      page_number = request.getParameter("found_something");
           //     } else {
            //        page_number = "0";
             //   }

            //    int from = 1;

           //     for (int i = 1; i < page_number.length(); i++) {
           //         from += 9;
             //       for (int j = 0; j < 9; j++) {
             //           rs1.next();
             //       }

              //  }
             //   int to = 0, tot = 0;
              //  while (rs.next()) {
              //      tot = rs.getInt("count(*)");
              //      to = Math.min(8 + from, tot);
               // }

              //  int found_something = 0;

                Statement stmt5 = db.connection.createStatement();
                String qry5 = "select count(*) from cart where email like '" + session.getAttribute("cartid") + "'";
                ResultSet rs5 = stmt5.executeQuery(qry5);
                rs5.next();
              
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"header_top\"><!--header_top-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-6 \">\n");
      out.write("                        <div class=\"contactinfo\">\n");
      out.write("                            <ul class=\"nav nav-pills\">\n");
      out.write("                                <li><a href=\"contact-us.jsp\"><i class=\"fa fa-phone\"></i> +8801738896778 </a></li>\n");
      out.write("                                <li><a href=\"contact-us.jsp\"><i class=\"fa fa-envelope\"></i> eshopperinfo@gmail.com</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-6\">\n");
      out.write("                        <div class=\"social-icons pull-right\">\n");
      out.write("                            <ul class=\"nav navbar-nav\">\n");
      out.write("                                <li><a href=\"http://facebook.com\"><i class=\"fa fa-facebook\"></i></a></li>\n");
      out.write("                                <li><a href=\"http://twitter.com\"><i class=\"fa fa-twitter\"></i></a></li>\n");
      out.write("                                <li><a href=\"http://linkedin.com\"><i class=\"fa fa-linkedin\"></i></a></li>\n");
      out.write("                                <li><a href=\"http://drrible.com\"><i class=\"fa fa-dribbble\"></i></a></li>\n");
      out.write("                                <li><a href=\"http://plus.google.com\"><i class=\"fa fa-google-plus\"></i></a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div><!--/header_top-->\n");
      out.write("        <div class=\"header-middle\"><!--header-middle-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-4\">\n");
      out.write("                        <div class=\"logo pull-left\">\n");
      out.write("                            <a href=\"index.jsp\"><img src=\"images/home/logo.png\" alt=\"\" /></a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"btn-group pull-right\">\t\t\t\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-sm-8\">\n");
      out.write("                        <div class=\"shop-menu pull-right\">\n");
      out.write("                            <ul class=\"nav navbar-nav\">\n");
      out.write("                                ");
//String temp = session.getAttribute("userid").toString();
                                            if (session.getAttribute("userid") != null && (session.getAttribute("userid").toString().length()>4)) {
      out.write("\n");
      out.write("                                <li><a href=\"stats.jsp\"><i class=\"fa fa-file\"></i>Stats</a></li>\n");
      out.write("                                <li><a href=\"update.jsp\"><i class=\"fa fa-pencil-square-o\"></i> Upadate</a></li>\n");
      out.write("                                ");
}
      out.write("\n");
      out.write("                                <li><a href=\"wishlist.jsp\"><i class=\"fa fa-star\"></i> Wishlist</a></li>\n");
      out.write("                                    ");
//String temp = session.getAttribute("userid").toString();
                                        if (session.getAttribute("userid") != null && (!session.getAttribute("userid").toString().endsWith("0"))) {
      out.write("\n");
      out.write("\n");
      out.write("                                <li><a href=\"cart.jsp\"><i class=\"fa fa-shopping-cart\"></i> Cart(");
      out.print(rs5.getInt("count(*)"));
      out.write(")</a></li>\n");
      out.write("                                <li><a href=\"account.jsp\">");
      out.print(session.getAttribute("userid"));
      out.write("</a></li>\n");
      out.write("                                <li><a href=\"login.jsp\"><i class=\"fa fa-unlock\"></i> Logout</a></li>\n");
      out.write("                                    ");
} else {
      out.write("\n");
      out.write("                                <li><a href=\"login.jsp\"><i class=\"fa fa-shopping-cart\"></i> Cart(");
      out.print(rs5.getInt("count(*)"));
      out.write(")</a></li>\n");
      out.write("                                <li><a href=\"login.jsp\"><i class=\"fa fa-crosshairs\"></i> Register</a></li>\n");
      out.write("                                <li><a href=\"login.jsp\"><i class=\"fa fa-lock\"></i> Login</a></li>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div><!--/header-middle--> \n");
      out.write("\n");
      out.write("        <div class=\"header-bottom\"><!--header-bottom-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-9\">\n");
      out.write("                        <div class=\"navbar-header\">\n");
      out.write("                            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("                                <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"mainmenu pull-left\">\n");
      out.write("                            <ul class=\"nav navbar-nav collapse navbar-collapse\">\n");
      out.write("                                <li><a href=\"index.jsp\" class=\"active\"> Home </a></li>\n");
      out.write("                            </ul>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <form style=\"font-size:17px; text-align:right\" name=\"input\" action=\"search.jsp\" method=\"post\">\n");
      out.write("                            <input name=\"found_something\" type=\"hidden\" value=\"0\" > Find Product: \n");
      out.write("                            <input style=\"width:300px\" type=\"text\" name=\"product\" placeholder=\"Search your product\">\n");
      out.write("                            <input type=\"submit\" value=\"Search\" style=\"background-color: #FF9933;color:#FFFFFF\">\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div><!--/header-bottom-->\n");
      out.write("\n");
      out.write("        <section id=\"slider\"><!--slider-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-12\">\n");
      out.write("                        <div id=\"slider-carousel\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("                            <ol class=\"carousel-indicators\">\n");
      out.write("                                <li data-target=\"#slider-carousel\" data-slide-to=\"0\" class=\"active\"></li>\n");
      out.write("                                <li data-target=\"#slider-carousel\" data-slide-to=\"1\"></li>\n");
      out.write("                                <li data-target=\"#slider-carousel\" data-slide-to=\"2\"></li>\n");
      out.write("                            </ol>\n");
      out.write("\n");
      out.write("                            <div class=\"carousel-inner\">\n");
      out.write("                                <div class=\"item active\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <br><br><br>\n");
      out.write("                                        <a href=\"mensdress.jsp\"><button type=\"button\" style=\"margin-left:50px;\" class=\"btn btn-default get\">Get it now</button></a>\n");
      out.write("                                        \n");
      out.write("                                        <h2>50% Sale on T-Shirt </h2> \n");
      out.write("                                        \n");
      out.write("                                        <p> Polo Brand T-Shirt is on 50% Sale </p>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        \n");
      out.write("                                        <img src=\"images/home/girl1.jpg\" class=\"girl img-responsive\" alt=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <br><br><br>\n");
      out.write("                                        <a href=\"beverages.jsp\"><button type=\"button\" style=\"margin-left:10px;\" class=\"btn btn-default get\">Get it now</button></a>\n");
      out.write("                                        \n");
      out.write("                                        <h2>10 Tk off </h2>\n");
      out.write("                                        <p> Coca-Cola 1 Liter is at 41 Tk only </p>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <img src=\"images/home/girl2.jpg\" class=\"girl img-responsive\" alt=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"item\">\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <br><br><br>\n");
      out.write("                                        <a href=\"personal.jsp\"><button type=\"button\" style=\"margin-left:20px;\" class=\"btn btn-default get\">Get it now</button></a>\n");
      out.write("                                        \n");
      out.write("                                        <h2>Free Brash </h2>\n");
      out.write("                                        <p> A Flexible Brash is Free with 250 gm Colgate </p>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"col-sm-6\">\n");
      out.write("                                        <img src=\"images/home/girl3.jpg\" class=\"girl img-responsive\" alt=\"\" />\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <a href=\"#slider-carousel\" class=\"left control-carousel hidden-xs\" data-slide=\"prev\">\n");
      out.write("                                <i class=\"fa fa-angle-left\"></i>\n");
      out.write("                            </a>\n");
      out.write("                            <a href=\"#slider-carousel\" class=\"right control-carousel hidden-xs\" data-slide=\"next\">\n");
      out.write("                                <i class=\"fa fa-angle-right\"></i>\n");
      out.write("                            </a>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section><!--/slider-->\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-3\">\n");
      out.write("                        <div class=\"left-sidebar\">\n");
      out.write("                            <div class=\"breadcrumbs\">\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <h2>Category</h2>\n");
      out.write("                            <div class=\"panel-group category-products\" id=\"accordian\"><!--category-productsr-->\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\">\n");
      out.write("                                            <a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#sportswear\">\n");
      out.write("                                                <span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>\n");
      out.write("                                                Grocery\n");
      out.write("                                            </a>\n");
      out.write("                                        </h4>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div id=\"sportswear\" class=\"panel-collapse collapse\">\n");
      out.write("                                        <div class=\"panel-body\">\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"fruitveg.jsp\">Fruits & Vegetables </a></li>\n");
      out.write("                                                <li><a href=\"beverages.jsp\">Beverages</a></li>\n");
      out.write("                                                <li><a href=\"breakfast.jsp\">Breakfast </a></li>\n");
      out.write("                                                <li><a href=\"meatfish.jsp\">Meat & Fish</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\">\n");
      out.write("                                            <a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#mens\">\n");
      out.write("                                                <span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>\n");
      out.write("                                                Dress\n");
      out.write("                                            </a>\n");
      out.write("                                        </h4>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div id=\"mens\" class=\"panel-collapse collapse\">\n");
      out.write("                                        <div class=\"panel-body\">\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"mensdress.jsp\">Mens Dress</a></li>\n");
      out.write("                                                <li><a href=\"womensdress.jsp\">Womens Dress</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\">\n");
      out.write("                                            <a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#womens\">\n");
      out.write("                                                <span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>\n");
      out.write("                                                Beauty & Health\n");
      out.write("                                            </a>\n");
      out.write("                                        </h4>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div id=\"womens\" class=\"panel-collapse collapse\">\n");
      out.write("                                        <div class=\"panel-body\">\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"health.jsp\">Health Care</a></li>\n");
      out.write("                                                <li><a href=\"personal.jsp\">Personal Care</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\">\n");
      out.write("                                            <a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#office\">\n");
      out.write("                                                <span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>\n");
      out.write("                                                Office\n");
      out.write("                                            </a>\n");
      out.write("                                        </h4>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div id=\"office\" class=\"panel-collapse collapse\">\n");
      out.write("                                        <div class=\"panel-body\">\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"printing.jsp\">Printing</a></li>\n");
      out.write("                                                <li><a href=\"batteries.jsp\">Batteries</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\">\n");
      out.write("                                            <a data-toggle=\"collapse\" data-parent=\"#accordian\" href=\"#women\">\n");
      out.write("                                                <span class=\"badge pull-right\"><i class=\"fa fa-plus\"></i></span>\n");
      out.write("                                                Baby Care\n");
      out.write("                                            </a>\n");
      out.write("                                        </h4>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div id=\"women\" class=\"panel-collapse collapse\">\n");
      out.write("                                        <div class=\"panel-body\">\n");
      out.write("                                            <ul>\n");
      out.write("                                                <li><a href=\"food.jsp\">Food</a></li>\n");
      out.write("                                                <li><a href=\"care.jsp\">Care</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\"><a href=\"electronics.jsp\">Electronics</a></h4>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\"><a href=\"cosmetics.jsp\">Cosmetics</a></h4>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel panel-default\">\n");
      out.write("                                    <div class=\"panel-heading\">\n");
      out.write("                                        <h4 class=\"panel-title\"><a href=\"sweets.jsp\">Sweets</a></h4>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div><!--/category-products-->\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    \n");
      out.write("\n");
      out.write("                    <div class=\"col-sm-9 padding-right\">\n");
      out.write("                        <div class=\"features_items\"><!--features_items-->\n");
      out.write("                            <h2 class=\"title text-center\">Popular Items</h2>\n");
      out.write("                            ");

                                        int cnt=0;
                                while (rs8.next() && cnt<9) {
                                    cnt++;
                                    //out.print("select unit from product where product_code="+rs8.getInt("product_code"));
                                    Statement stmt9 = db.connection.createStatement();
                                    ResultSet rs9 = stmt9.executeQuery("select product_descrip,product_sell_price,unit from product where product_code="+rs8.getInt("product_code"));
                                    rs9.next();
                                    
                                    String name = " ";
                                    name = rs9.getString("product_descrip");
                                    String product_code = new String();
                                    product_code = rs8.getString("product_code");
                                    String price = new String();
                                    price = rs9.getString("product_sell_price");
                                    String source = new String();
                                    source = "images/" + product_code + ".jpg";
                                    //out.println(source);
                                    String qry2 = "select count(*) from cart where product_code=" + product_code + " and email like '" + session.getAttribute("cartid") + "'";
                                    ResultSet rs2 = stmt2.executeQuery(qry2);
                                    rs2.next();

                                    //
                                    String qry4;
                                    if (session.getAttribute("userid") != null) {
                                        qry4 = "select count(*) from wishlist where product_code=" + product_code + " and email='" + session.getAttribute("userid") + "'";
                                    } else {
                                        qry4 = "select count(*) from wishlist where product_code=" + product_code + " and email='########'";
                                    }
                                    ResultSet rs4 = stmt4.executeQuery(qry4);
                                    rs4.next();
                                    
                            
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"col-sm-4\">\n");
      out.write("                                <div class=\"product-image-wrapper\">\n");
      out.write("\n");
      out.write("                                    ");
if (rs2.getString("count(*)").startsWith("0")) {
                                    
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <div class=\"single-products\">\n");
      out.write("                                        <div class=\"productinfo text-center\">\n");
      out.write("                                            <img src=");
      out.print(source);
      out.write("  alt=\"Swapno\" />\n");
      out.write("                                            <h2>");
out.print(price);
      out.write(" taka<li style=\"font-size: 15px; font-style: italic; color: green\">");
out.print(rs9.getString("unit"));
      out.write("</li></h2>\n");
      out.write("                                            <p style=\"color: darkcyan\">");
out.print(name.substring(0, Math.min(20, name.length())));
      out.write("</p>\n");
      out.write("                                            <!--CART-->\n");
      out.write("                                            <form action=\"index.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                <input type=\"hidden\" name=\"cart_in\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                <button type=\"submit\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</button>\n");
      out.write("                                            </form>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <div class=\"product-overlay\">\n");
      out.write("                                            <div class=\"overlay-content\">\n");
      out.write("                                                <h2>");
out.print(price);
      out.write(" taka</h2>\n");
      out.write("                                                <p>");
out.print(name);
      out.write("</p>\n");
      out.write("                                                <form action=\"index.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                    <input type=\"hidden\" name=\"cart_in\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                    <button type=\"submit\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</button>\n");
      out.write("                                                </form>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    ");
} else {
      out.write("\n");
      out.write("\n");
      out.write("                                    <div class=\"single-products\">\n");
      out.write("                                        <div class=\"productinfo text-center\">\n");
      out.write("                                            <img src=");
      out.print(source);
      out.write("  alt=\"Swapno\" />\n");
      out.write("                                            <h2>");
out.print(price);
      out.write(" taka<li style=\"font-size: 15px; font-style: italic; color: green\">");
out.print(rs9.getString("unit"));
      out.write("</li></h2>\n");
      out.write("                                            <p style=\"color: darkcyan\">");
out.print(name.substring(0, Math.min(20, name.length())));
      out.write("</p>\n");
      out.write("                                            <!--CART-->\n");
      out.write("                                            <form action=\"index.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                <input type=\"hidden\" name=\"cart_out\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                <button type=\"submit\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Remove from cart</button>\n");
      out.write("                                            </form>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                        <div class=\"product-overlay\">\n");
      out.write("                                            <div class=\"overlay-content\">\n");
      out.write("                                                <h2>");
out.print(price);
      out.write(" taka</h2>\n");
      out.write("                                                <p>");
out.print(name);
      out.write("</p>\n");
      out.write("                                                <form action=\"index.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                    <input type=\"hidden\" name=\"cart_out\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                    <button type=\"submit\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Remove from cart</button>\n");
      out.write("                                                </form>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    ");
}
                                        if (rs4.getString("count(*)").startsWith("0")) {
                                    
      out.write("\n");
      out.write("                                    <div class=\"choose\">\n");
      out.write("                                        <ul class=\"nav nav-pills nav-justified\">\n");
      out.write("                                            <li><form action=\"");
if (session.getAttribute("userid") != null) {
      out.write("index.jsp");
} else {
      out.write("login.jsp");
}
      out.write("\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                    <input type=\"hidden\" name=\"wishlist_in\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                    <button type=\"submit\" class=\"btn btn-default add-to-cart\">Add to wishlist</button>\n");
      out.write("                                                </form>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    ");
} else {
      out.write("\n");
      out.write("                                    <div class=\"choose\">\n");
      out.write("                                        <ul class=\"nav nav-pills nav-justified\">\n");
      out.write("                                            <li><form action=\"index.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                                                    <input type=\"hidden\" name=\"wishlist_out\" value=");
      out.print(product_code);
      out.write(">\n");
      out.write("                                                    <button type=\"submit\" class=\"btn btn-default add-to-cart\">Remove from wishlist</button>\n");
      out.write("                                                </form>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                    ");
}
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            ");

                                   
                                }
                                //out.println(found_something);
                            
      out.write("\n");
      out.write("\n");
      out.write("                            ");

                                } catch (Exception e) {
                                    out.println("Exception : " + e.getMessage() + "");
                                }
                            
      out.write("\n");
      out.write("                        </div><!--features_items-->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>                            \n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <footer id=\"footer\"><!--Footer-->\n");
      out.write("            <div class=\"footer-top\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer-widget\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-sm-2\">\n");
      out.write("                            <div class=\"single-widget\">\n");
      out.write("                                <h2>Service</h2>\n");
      out.write("                                <ul class=\"nav nav-pills nav-stacked\">\n");
      out.write("                                    <li><a href=\"contact-us.jsp\">Contact Us</a></li>\n");
      out.write("                                    <li><a href=\"faq.jsp\">FAQ’s</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"col-sm-2\">\n");
      out.write("                            <div class=\"single-widget\">\n");
      out.write("                                <h2>Policies</h2>\n");
      out.write("                                <ul class=\"nav nav-pills nav-stacked\">\n");
      out.write("                                    <li><a href=\"term.jsp\">Terms of Use</a></li>\n");
      out.write("                                    <li><a href=\"privacypolicy.jsp\">Privecy Policy</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-2\">\n");
      out.write("                            <div class=\"single-widget\">\n");
      out.write("                                <h2>About Shopper</h2>\n");
      out.write("                                <ul class=\"nav nav-pills nav-stacked\">\n");
      out.write("                                    <li><a href=\"info.jsp\">Company Information</a></li>\n");
      out.write("                                    <li><a href=\"about-us.jsp\">About Us</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"footer-bottom\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <p class=\"pull-left\">Copyright © 2015 e-SHOPPER Inc. All rights reserved.</p>\n");
      out.write("                        <p class=\"pull-right\">Developed as <span> Project 300 </span></p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </footer><!--/Footer-->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <script src=\"js/jquery.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.scrollUp.min.js\"></script>\n");
      out.write("        <script src=\"js/price-range.js\"></script>\n");
      out.write("        <script src=\"js/jquery.prettyPhoto.js\"></script>\n");
      out.write("        <script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
