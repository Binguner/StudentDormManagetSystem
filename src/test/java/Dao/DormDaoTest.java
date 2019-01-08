package Dao;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DormDaoTest {

    private Connection connection;
    @Test
    public void getConnection(){
         String Driver = "com.mysql.cj.jdbc.Driver";
         String username = "root";
         String password = "16321632";
         String URL = "jdbc:mysql://106.15.199.8:1521/StuentDormManagerDB";
         try {
             Class.forName(Driver);
             connection = DriverManager.getConnection(URL);
             System.out.println("ok");
         } catch (ClassNotFoundException | SQLException e) {
             e.printStackTrace();
             System.out.println("wrong");

         }
         //return connection;
    }

    @Test
    public void getDormList() {

    }
}