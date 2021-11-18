package Example;
import java.sql.*;
import java.util.*;
public class ConnectionManager {
    static Connection con;
    static String url;
    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql:" + "//localhost:3306/cs157A-team6?autoReconnect=true&useSSL=false"; 
            // assuming "DataSource" is your DataSource name

            Class.forName("com.mysql.jdbc.Driver");
            
            try {            	
                con = DriverManager.getConnection(url,"root","root"); //MODIFY AS NEEDED
            }
            catch (SQLException ex)
            {
                ex.printStackTrace();
            }
        }
        catch(ClassNotFoundException e)
        {
        System.out.println(e);
        }
        return con;
    }
}