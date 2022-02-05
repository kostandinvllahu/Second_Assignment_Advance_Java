/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author user
 */
public class dbUtil {
    public static boolean DEBUG = true;
    public static String ERROR = "";
    //1/1/2021
    private static final String DateFormat = "MM/dd/YYYY";
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://38.17.53.110:14079/COVID_DATA", "admin", "Qcd1jtBI");
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static String getDate() {
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern(DateFormat);
        String d = myDateObj.format(myFormatObj);
        return d;
    }

}
