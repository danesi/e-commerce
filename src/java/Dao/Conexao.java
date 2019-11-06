/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author 2017000850
 */
public class Conexao {
    public static Connection getConnection() throws ClassNotFoundException{
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection("jdbc:postgresql://localhost:5432/ecommerce", "postgres", "ciet");
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return null;
        }
    }
}
