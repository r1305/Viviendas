
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Julian
 */
public class Test {

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
    
    

    public String obtenImagenProducto(int idProducto) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pr = null;
        String ruta = "";
        byte[] buffer = null;
        try {
            cn = getConexion();
            String sql = "SELECT foto FROM viviendas.casas where id= ?";
            pr = cn.prepareStatement(sql);
            pr.setInt(1, idProducto);
            rs = pr.executeQuery();
            while (rs.next()) {
                Blob bin = rs.getBlob("foto");
                if (bin != null) {
                    InputStream inStream = bin.getBinaryStream();
                    int size = (int) bin.length();
                    buffer = new byte[size];

                    // convert byte array back to BufferedImage
                    int length = -1;
                    int k = 0;
                    try {
                        inStream.read(buffer, 0, size);
                        InputStream in = new ByteArrayInputStream(buffer);
                        BufferedImage bImageFromConvert = ImageIO.read(in);

                        ImageIO.write(bImageFromConvert, "jpg", new File(
                                "C:\\Users\\Julian\\Documents\\"
                                + "NetBeansProjects\\Netbeans2016-1\\Documents\\"
                                + "NetBeansProjects\\Trabajo2\\web\\image\\"
                                + idProducto + ".jpg"));
                        ruta = idProducto + ".jpg";
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);;
        } finally {
            try {
                cn.close();
                rs.close();
                pr.close();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        return ruta;
    }
    
    public List<Viviendas> getViviendasActivas(){
        List<Viviendas> l=new ArrayList<>();
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement pr = null;
        byte[] buffer = null;
        
        try {
            cn = getConexion();
            String sql = "SELECT * FROM viviendas.casas where estado='Activa'";
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();
            while (rs.next()) {
                
                Viviendas v=new Viviendas();
                v.setId(rs.getInt("id"));
                v.setDescripción(rs.getString("descripcion"));
                v.setDirección(rs.getString("direccion"));
                v.setPrecio(rs.getFloat("precio"));
                
                Blob bin = rs.getBlob("foto");
                if (bin != null) {
                    InputStream inStream = bin.getBinaryStream();
                    int size = (int) bin.length();
                    buffer = new byte[size];

                    // convert byte array back to BufferedImage
                    int length = -1;
                    int k = 0;
                    try {
                        inStream.read(buffer, 0, size);
                        InputStream in = new ByteArrayInputStream(buffer);
                        BufferedImage bImageFromConvert = ImageIO.read(in);

                        ImageIO.write(bImageFromConvert, "jpg", new File(
                                "C:\\Users\\Julian\\Documents\\"
                                + "NetBeansProjects\\Netbeans2016-1\\Documents\\"
                                + "NetBeansProjects\\Trabajo2\\web\\image\\"
                                + v.getId() + ".jpg"));
                        v.setRuta("image/"+v.getId() + ".jpg");
                    } catch (IOException ex) {
                        ex.printStackTrace();
                    }
                }
                l.add(v);
            }
        } catch (Exception ex) {
            System.out.println(ex);;
        } finally {
            try {
                cn.close();
                rs.close();
                pr.close();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        }
        
        return l;
    }

    public static void main(String[] args) {
        // TODO code application logic here
        Test t = new Test();

        byte[] imageInByte;
        /*BufferedImage originalImage = ImageIO.read(new File(
         "C:\\Users\\Julian\\Desktop\\casa3.jpg"));

         // convert BufferedImage to byte array
         ByteArrayOutputStream baos = new ByteArrayOutputStream();
         ImageIO.write(originalImage, "jpg", baos);
         baos.flush();
         imageInByte = baos.toByteArray();*/
        /*baos.close();*/
        //System.out.println(t.obtenImagenProducto(5));
        System.out.println(t.getViviendasActivas());

        // convert byte array back to BufferedImage
			/*InputStream in = new ByteArrayInputStream(imageInByte);
         BufferedImage bImageFromConvert = ImageIO.read(in);

         ImageIO.write(bImageFromConvert, "jpg", new File(
         "C:\\Users\\Julian\\Desktop\\"));*/
    }

}
