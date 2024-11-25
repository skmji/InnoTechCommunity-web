


package com.tech.bolgs.helper;




import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    private static String dbUrl;
    private static String dbUser;
    private static String dbPassword;
    private static Connection connection;

    // Static block to initialize database configuration
    static {
        // Set the database URL
        dbUrl = "jdbc:mysql://mysql:3306/techblog?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

        // Use environment variables if set, otherwise fallback to default values
        dbUser = System.getenv("DB_USER") != null ? System.getenv("DB_USER") : "your_username"; // Replace 'your_username'
        dbPassword = System.getenv("DB_PASSWORD") != null ? System.getenv("DB_PASSWORD") : "your_password"; // Replace 'your_password'

        // Log warnings if default values are being used
        if (System.getenv("DB_USER") == null || System.getenv("DB_PASSWORD") == null) {
            System.err.println("Environment variables DB_USER and DB_PASSWORD are not set. Using default credentials.");
        }
    }

    public static Connection getCon() {
        if (connection == null) {
            synchronized (ConnectionProvider.class) {
                if (connection == null) {
                    try {
                        // Load the MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        // Establish the connection
                        connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                        System.out.println("Database connection established successfully.");
                    } catch (ClassNotFoundException e) {
                        System.err.println("MySQL JDBC Driver not found. Ensure the driver library is included in the project.");
                        e.printStackTrace();
                    } catch (SQLException e) {
                        System.err.println("Failed to establish a connection to the database. Check your URL, username, and password.");
                        e.printStackTrace();
                    }
                }
            }
        }
        return connection;
    }
}
