/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.arqui;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    
    String url = "jdbc:mysql://localhost:3306/luzdelnorte?user=root&password=root";
    
    private Connection getConnection(){
		
		Connection con= null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			try {
				con= DriverManager.getConnection(url);
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
    //metodo para validar el numero de suministro
    public String validar(int numSuministro) {
        // TODO Auto-generated method stub
		String log = "";
		String p;
		Connection con;
                con=getConnection();
                      
                
		
		
        try {
            
            String strsql = "SELECT * FROM cliente where numSuministro=?";
            PreparedStatement pstm = con.prepareStatement(strsql);
            pstm.setInt(1, numSuministro);
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(rs.getInt(1) == numSuministro){
                	log="ok";         
                }else{
                	log="mal";
                }
            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
        }
		return log;
    }
    //aqui validas si es cliente o admin
    public String login(String u,String p) {
        // TODO Auto-generated method stub
		String logeado = "";
		
		Connection con;
                con=getConnection();
        
        try {
            
            String strsql = "SELECT * FROM cliente where usuario='"+u+"'";
            PreparedStatement pstm = con.prepareStatement(strsql);
            Consumer c=new Consumer();
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                if(rs.getString("clave").equals(p)){
                    System.out.println(rs.getInt("numSuministro"));
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
    
    //registrar nuevo consumo desde la cola 
    public boolean registrar(String sum,String fecha,String consumo) {
        // TODO Auto-generated method stub
		boolean logeado = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into consumo (suministro,fecha,consumo) values (?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
            System.out.println("Estas recibiendo esto: " +sum+","+fecha+","+consumo);
                    
            int s=Integer.parseInt(sum);
            float c=Float.parseFloat(consumo);
            pstm.setInt(1, s);
            pstm.setString(2, fecha);
            pstm.setFloat(3, c);
            pstm.executeUpdate();
            con.close();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            logeado=false;
        }
		return logeado;
    }
    //crear nuevo usuario 
    public boolean registrarUsuario(String sum,String u,String clave,String tipo) {
        // TODO Auto-generated method stub
		boolean signup = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            
            String strsql = "Insert into cliente (numSuministro,usuario,clave,tipo) values (?,?,?,?)";
            PreparedStatement pstm = con.prepareStatement(strsql);
                               
            int s=Integer.parseInt(sum);
            pstm.setInt(1, s);
            pstm.setString(2, u);
            pstm.setString(3, clave);
            pstm.setString(4, tipo);
            pstm.executeUpdate();
            con.close();
            signup=true;
            
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
            signup=false;
        }
		return signup;
    }
    //actualizar los datos del usuario
    public boolean actualizarUsuario(String sum,String u,String clave) {
        // TODO Auto-generated method stub
		boolean update = false;
		
		Connection con;
                con=getConnection();
        		
        try {
            int s=Integer.parseInt(sum);
            
            String strsql = "Update cliente set usuario='"+u+"',clave='"+clave+"' where numSuministro="+s;
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
    
    //devuelve la lista de consumos para un usuario especifico
    public List<Consumer> listar(int u) {
        // TODO Auto-generated method stub
			
		Connection con;
                con=getConnection();
                List<Consumer> l=new ArrayList<>();
        
        try {
            
            String strsql = "SELECT * FROM consumo where suministro="+u;
            PreparedStatement pstm = con.prepareStatement(strsql);
            
            
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                System.out.println(rs.getString("fecha"));
                Consumer c=new Consumer();
                c.setConsumo(rs.getFloat("consumo"));
                c.setFecha(rs.getString("fecha"));
                c.setSuministro(rs.getInt("suministro"));
                l.add(c);
            }
            rs.close();
        }catch(SQLException e){
            System.out.println(e);
        }
            return l;
    }
    
}
