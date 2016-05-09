/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Rogger
 */
public class Dao {
    
    String url = "jdbc:mysql://localhost:3306/datos?user=root&password=root";
    
    private Connection getConnection() {
        Connection con = null;
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
    public int getRows(){
        Connection con;
        con=getConnection();
        int rows=0;
        
        try {
            
            String strsql = "SELECT * FROM solicitud_compras where estado='pendiente'";
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                
                    rows+=1;
            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
            rows=0;
        }
            return rows;//devuelve el tipo de persona que se logea
    }
    
    public String login(String u,String p) {
        // TODO Auto-generated method stub
		String logeado = "";
		
		Connection con;
                con=getConnection();
        
        try {
            
            String strsql = "SELECT usuario,contraseña,tipo FROM empleados where usuario='"+u+"'";
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(rs.getString("contraseña").equals(p)){
                    logeado=rs.getString("tipo");
                }
            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
            logeado="";
        }
            return logeado;//devuelve el tipo de persona que se logea
    }
    
    public boolean registrarEmpleado(String nombre,String user,String clave,String dni,String ap,
                                    String am,String dist,String dir,String tlf,String email) {
        // TODO Auto-generated method stub
		boolean registro = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into empleados  values (?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            int d=Integer.parseInt(dni);
            pstm.setInt(1, d);
            pstm.setString(2, nombre);
            pstm.setString(3, am);
            pstm.setString(4, ap);
            pstm.setString(5, dir);
            pstm.setString(6, dist);
            pstm.setString(7, tlf);
            pstm.setString(8, email);
            pstm.setString(9, user);
            pstm.setString(10, clave);
            pstm.executeUpdate();
            con.close();
            registro=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            registro=false;
        }
            return registro;
    }
    
    public boolean registrarProducto(String nombre,String desc,String tipo,String marca) {
        // TODO Auto-generated method stub
		boolean registro = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into productos (nombre,descripcion,tipo,marca) values (?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);

            pstm.setString(1, nombre);
            pstm.setString(2, desc);
            pstm.setString(3, tipo);
            pstm.setString(4, marca);
            pstm.executeUpdate();
            con.close();
            registro=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            registro=false;
        }
            return registro;
    }
    
    public boolean registrarOrden(String fecha,String ruc,String prov) {
        // TODO Auto-generated method stub
		boolean registro = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into orden_de_compras (fechaEntrega,ruc,nombreProv) values (?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            int r=Integer.parseInt(ruc);
            pstm.setString(1, fecha);
            pstm.setInt(2, r);
            pstm.setString(3, prov);
            pstm.executeUpdate();
            con.close();
            registro=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            registro=false;
        }
            return registro;
    }
    
    public boolean registrarSolicitudCompra(String fecha,String sol,String area,String prioridad,String prod,String cant) {
        // TODO Auto-generated method stub
		boolean registro = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into solicitud_compras  values (?,?,?,?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            int nSol=Integer.parseInt(sol);
            int c=Integer.parseInt(cant);
            pstm.setInt(1, nSol);
            pstm.setString(2, fecha);
            pstm.setString(3, area);
            pstm.setString(4, prioridad);
            pstm.setString(5, "pendiente");
            pstm.setString(6, prod);
            pstm.setInt(7, c);
            pstm.executeUpdate();
            con.close();
            registro=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            registro=false;
        }
            return registro;
    }
    
    public boolean actualizarSolicitud(String fecha,String sol,String area,String prioridad) {
        // TODO Auto-generated method stub
		boolean update = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            int s=Integer.parseInt(sol);
            
            String strsql = "Update solicitud_compras set "
                    + "fechaSolicitud='"+fecha+"',"
                    + "area='"+area+"',"
                    + "prioridad='"+prioridad+"' where numSolicitud="+s;
            PreparedStatement pstm = con.prepareStatement(strsql);
                               
            pstm.executeUpdate();
            con.close();
            update=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            update=false;
        }
		return update;
    }
    
    public boolean aprobarSolicitud(String sol) {
        // TODO Auto-generated method stub
		boolean update = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            int s=Integer.parseInt(sol);
            
            String strsql = "Update solicitud_compras set "
                    + "estado='aceptado' where numSolicitud="+sol;
            PreparedStatement pstm = con.prepareStatement(strsql);
                               
            pstm.executeUpdate();
            con.close();
            update=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            update=false;
        }
		return update;
    }
    
    public boolean rechazarSolicitud(String sol) {
        // TODO Auto-generated method stub
		boolean update = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            int s=Integer.parseInt(sol);
            
            String strsql = "Update solicitud_compras set "
                    + "estado='rechazado' where numSolicitud="+sol;
            PreparedStatement pstm = con.prepareStatement(strsql);
                               
            pstm.executeUpdate();
            con.close();
            update=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            update=false;
        }
		return update;
    }
    
}
