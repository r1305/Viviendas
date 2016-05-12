/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.Viviendas;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author Rogger
 */
public class Conexion {

    String url = "jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_8db68c53d43a83f?user=b3c1f1d9e47f4b&password=2bf408d7";

    //String url = "jdbc:mysql://localhost:3306/heroku_8db68c53d43a83f?user=b3c1f1d9e47f4b&password=2bf408d7";
    //String url = "jdbc:mysql://localhost:3306/viviendas?user=root&password=root";
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

    public boolean delete(int id) {
        boolean ok = false;
        try (Connection conn = getConexion()) {
            String query = "delete from casas where id="+id;

            PreparedStatement ps = conn.prepareStatement(query);
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

    public String getNombre(String u) {
        // TODO Auto-generated method stub
        String nombre = "";

        Connection con;
        con = getConexion();

        try {

            String strsql = "select * from clientes where correo='" + u + "'";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                nombre = rs.getString("nombre");
            }
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
            nombre = "";
        }
        return nombre;
    }

    public String getNombreOperarios(String u) {
        // TODO Auto-generated method stub
        String nombre = "";

        Connection con;
        con = getConexion();

        try {

            String strsql = "select * from operarios where correo='" + u + "'";
            PreparedStatement pstm = con.prepareStatement(strsql);

            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                nombre = rs.getString("nombre");
            }
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
            nombre = "";
        }
        return nombre;
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
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
            ok = false;
        }
        return ok;
    }

    public List<Viviendas> getViviendasActivas() {
        List<Viviendas> l = new ArrayList<>();
        Connection cn;
        ResultSet rs;
        PreparedStatement pr;
        byte[] buffer = null;
        Viviendas v = null;
        try {
            cn = getConexion();
            String sql = "SELECT * FROM casas where estado='Activa'";
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();

            while (rs.next()) {
                v = new Viviendas();

                v.setId(rs.getInt("id"));
                v.setDescripción(rs.getString("descripcion"));
                v.setDirección(rs.getString("direccion"));
                v.setPrecio(rs.getFloat("precio"));
                v.setRuta(rs.getString("foto"));
                l.add(v);

            }
            pr.close();
            rs.close();
            cn.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }

        return l;
    }

    public List<Viviendas> getViviendas() {
        List<Viviendas> l = new ArrayList<>();
        Connection cn;
        ResultSet rs;
        PreparedStatement pr;
        byte[] buffer = null;
        Viviendas v = null;
        try {
            cn = getConexion();
            String sql = "SELECT * FROM casas order by estado";
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();

            while (rs.next()) {
                v = new Viviendas();

                v.setId(rs.getInt("id"));
                v.setDescripción(rs.getString("descripcion"));
                v.setDirección(rs.getString("direccion"));
                v.setPrecio(rs.getFloat("precio"));
                v.setEstado(rs.getString("estado"));
                v.setRuta(rs.getString("foto"));
                l.add(v);
            }
            rs.close();
            pr.close();
            cn.close();
        } catch (Exception ex) {
            System.out.println(ex);

        }

        return l;
    }

    public Viviendas getVivienda(int id) {
        Viviendas v = new Viviendas();
        Connection cn;
        ResultSet rs;
        PreparedStatement pr;
        try {
            cn = getConexion();
            String sql = "SELECT * FROM casas where id=" + id;
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();

            while (rs.next()) {
                v = new Viviendas();

                v.setId(rs.getInt("id"));
                v.setDescripción(rs.getString("descripcion"));
                v.setDirección(rs.getString("direccion"));
                v.setPrecio(rs.getFloat("precio"));
                v.setEstado(rs.getString("estado"));
                v.setRuta(rs.getString("foto"));
            }
            rs.close();
            pr.close();
            cn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return v;
    }

    public byte[] obtenImagenProducto(int idProducto) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pr = null;
        byte[] buffer = null;
        try {
            cn = getConexion();
            String sql = "SELECT foto FROM casas where id= ?";
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
            rs.close();
            pr.close();
            cn.close();
        } catch (Exception ex) {
            System.out.println(ex);;
        }
        return buffer;
    }

    public boolean registro(String dir, String desc, float precio, String file) {

        boolean ok = false;

        try (Connection conn = getConexion()) {
            String query = "INSERT INTO casas"
                    + "(direccion"
                    + ",descripcion"
                    + ",precio"
                    + ",foto"
                    + ",estado)"
                    + "     VALUES"
                    + "('" + dir + "'"
                    + ",'" + desc + "'"
                    + "," + precio + ""
                    + ",'" + file + "','Activa')";

            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeUpdate();
            ok = true;
            ps.close();
        } catch (Exception ex) {
            ok = false;
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ok;
    }

    public boolean update(String dir, String desc, float precio, String file, int id) {

        boolean ok = false;
        try {

            Connection conn = getConexion();

            String query = "update casas set direccion='" + dir + "',descripcion='" + desc + "',precio=" + precio + ",foto='" + file + "' where id=" + id;

            PreparedStatement ps = conn.prepareStatement(query);

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

    public boolean updateEstado(String estado, int id) {

        boolean ok = false;
        try {

            Connection conn = getConexion();

            String query = "update casas set estado='" + estado + "' where id=" + id;

            PreparedStatement ps = conn.prepareStatement(query);
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
