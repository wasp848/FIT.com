/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
    public static Connection getConnection()
    {
        String url = "jdbc:mysql://fit.cnr7knlunduz.ap-south-1.rds.amazonaws.com:3306/fit";
        String username = "kaffitdotcom";
        String password = "kaffitdotcom";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            return con;
        } catch (Exception ex) {
            System.out.println("Database.getConnection() Error -->" + ex.getMessage());
            return null;
        }
    }
    
    public static void close(Connection con)
    {
        try {
            con.close();
        }
        
        catch (Exception ex) {
            
        }
    }
}
