/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Al-Amin
 */



import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import oracle.net.aso.p;

public class NewClass {
            public int getconn() throws SQLException, ClassNotFoundException{
            Connection conn = null;
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "storedb", "sust");
               // out.println("connected....!!");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from customer");
                return 111;
            }
}
