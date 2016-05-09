/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author Brian
 */
public class Conexion {
    protected Connection cn = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;
    
    public Connection ObtenerConexion() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/Catalogo", "root", "12345678");
    }
}
