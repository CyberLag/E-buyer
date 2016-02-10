<%@page import="oracle.net.aso.p"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.eshopper.connection.Database" %>

<HTML>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>e-SHOPPER</title>
    </head>
    <BODY>
        <%

            try {
                Database db = new Database();
                db.connect();
                Statement stmt = db.connection.createStatement();
                Statement stmt1 = db.connection.createStatement();
                session.invalidate();
        %>
                    <div style="margin-left: 500">
                    <br><br>You have been logged out
                    <button type="button" onclick="location.href = 'http://localhost:8084/e-SHOPPER/login.jsp'" style="display:inline-block;">LOGIN</button>
                    <button type="button" onclick="location.href = 'http://localhost:8084/e-SHOPPER/index.jsp'" style="display:inline-block;">HOME</button>
                    </div>
                    <%
               
            } catch (Exception e) {
                out.println("Exception : " + e.getMessage() + "");
            }
 

        %>  
    </BODY>
</HTML>
        
