/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arqui.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ws.arqui.Consumer;

/**
 *
 * @author Rogger
 */
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
    
    public int getSum(String u) {
        // TODO Auto-generated method stub
		int sum = 0;
		
		Connection con;
                con=getConnection();
        
        try {
            
            String strsql = "SELECT * FROM cliente where usuario='"+u+"'";
            PreparedStatement pstm = con.prepareStatement(strsql);
            Consumer c=new Consumer();
            ResultSet rs = pstm.executeQuery();
            while(rs.next()){
                
                    System.out.println(rs.getInt("numSuministro"));
                    sum=rs.getInt("numSuministro");

            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
            sum=0;
        }
		return sum;
    }
    
    public List<Consumer> listarTodos() {
        // TODO Auto-generated method stub
			
		Connection con;
                con=getConnection();
                List<Consumer> l=new ArrayList<>();
        
        try {
            
            String strsql = "SELECT * FROM consumo";
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
