/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Henry Wong
 * @email hwongu@hwongu.net
 */
public class Conexion {
    
    protected Connection cn = null;
    protected PreparedStatement pr = null;
    protected ResultSet rs = null;
    
    
    public Connection obtenerConexion() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/sesion14", "root", "12345678");
    }
}
