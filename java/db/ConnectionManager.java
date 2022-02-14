package view.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class ConnectionManager {
    static Connection con;
    private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "taka";
    private static final String DB_PASSWORD = "SYSTEM";
                
    
    public static Connection getConnection() throws SQLException {
        try {
				
		Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE ", "taka","SYSTEM");
				
		try {
			con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
            System.out.println("Connected");
		}catch(SQLException e){
			e.printStackTrace();
				}
	}catch(ClassNotFoundException e) {
		e.printStackTrace();
	}
	return con;
        
    }
}