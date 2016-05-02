/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Rogger
 */
public class Conexion {

    String url = "jdbc:mysql://localhost:3306/viviendas?user=root&password=root";

    public Connection getConexion() {
        java.sql.Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            try {
                con = DriverManager.getConnection(url);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }

    public boolean getLoginClientes(String u, String p) {
        // TODO Auto-generated method stub
        boolean ok = false;

        Connection con;
        con = getConexion();

        try {

            String strsql = "SELECT * FROM clientes";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getString("correo").equalsIgnoreCase(u) && rs.getString("clave").equalsIgnoreCase(p)) {
                    ok = true;
                }
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
            ok = false;
        }
        return ok;
    }

    public boolean getLoginOperarios(String u, String p) {
        // TODO Auto-generated method stub
        boolean ok = false;

        Connection con;
        con = getConexion();

        try {

            String strsql = "SELECT * FROM operarios";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                if (rs.getString("correo").equalsIgnoreCase(u) && rs.getString("clave").equalsIgnoreCase(p)) {
                    ok = true;
                }
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println(e);
            ok = false;
        }
        return ok;
    }

    public byte[] obtenImagenProducto(int idProducto) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pr = null;
        byte[] buffer = null;
        try {
            cn = getConexion();
            String sql = "SELECT foto FROM viviendas.viviendas where id= ?";
            pr = cn.prepareStatement(sql);
            pr.setInt(1, idProducto);
            rs = pr.executeQuery();
            while (rs.next()) {
                Blob bin = rs.getBlob("foto");
                if (bin != null) {
                    InputStream inStream = bin.getBinaryStream();
                    int size = (int) bin.length();
                    buffer = new byte[size];
                    int length = -1;
                    int k = 0;
                    try {
                        inStream.read(buffer, 0, size);
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        } catch (Exception ex) {
            return null;
        } finally {
            cn = null;
            rs = null;
            pr = null;
        }
        return buffer;
    }
    
    public boolean registro(String dir, String desc, float precio, String file) {

        boolean ok = false;
        int len1;

        try {

            Connection conn = getConexion();

            String query = "INSERT INTO viviendas"
                    + "(direccion"
                    + ",descripcion"
                    + ",precio"
                    + ",foto"
                    + ",estado)"
                    + "     VALUES"
                    + "('" + dir + "'"
                    + ",'" + desc + "'"
                    + "," + precio + ""
                    + ",?,'Activa')";

            File f1 = new File(file);

            FileInputStream fis1 = new FileInputStream(f1);

            len1 = (int) f1.length();

            PreparedStatement ps = conn.prepareStatement(query);

            //method to insert a stream of bytes
            /**
             * ** archivo1 ***
             */
            ps.setBinaryStream(1, fis1, len1);
            ps.executeUpdate();
            ok = true;
            ps.close();
            conn.close();
        } catch (Exception ex) {
            ok = false;
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ok;
    }

}
