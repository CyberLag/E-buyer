/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.eshopper.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Pranab
 */
public class Database {

    public Connection connection = null;

    private final String USER_NAME = "storedb";
    private final String PASSWORD = "sust";
    private final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";

    public boolean connect() {
        try {
            Class.forName(DRIVER_NAME);
            connection = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
