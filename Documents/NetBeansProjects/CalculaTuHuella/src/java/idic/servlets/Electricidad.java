/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package idic.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rogger
 */
@WebServlet(name = "Electricidad", urlPatterns = {"/EncuestaElectricidad"})
public class Electricidad extends HttpServlet {
    
    String url = "jdbc:mysql://localhost:3306/idic?user=root&password=root";
    private Connection getConnection(){
		
		Connection con= null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			try {
				con= DriverManager.getConnection(url);
			} catch (Exception e) {
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
    
    public void registroElect(String user,int per,float pago,String lum,int cantL,float tiempoL
                               ,String elect,int cantE,float tiempoE,String eq,int cantEq,float tiempoEq) {
        String sql = "insert into electricidad (usuario,personas,pago,luminarias,cantidad_lum,tiempo_lum,"
                + "electrodomesticos,cantidad_elect,tiempo_elect,equipos,cant_eq,tiempo_eq) "
                + "values (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        Connection con = getConnection();
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setInt(2, per);
            ps.setFloat(3, pago);
            ps.setString(4, lum);
            ps.setInt(5, cantL);
            ps.setFloat(6,tiempoL);
            ps.setString(7, elect);
            ps.setInt(8, cantE);
            ps.setFloat(9,tiempoE);
            ps.setString(10, eq);
            ps.setInt(11, cantEq);
            ps.setFloat(12,tiempoEq);
            ps.executeUpdate();
        }catch(SQLException e){
            System.out.println("ERROR EN EL SQL---INSERTAR" +e);
        }finally{
            try{
                ps.close();
                con.close();
            }catch(SQLException e){
                System.out.println("REVISA EL CIERRE DE CONEXION");
            }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user=request.getParameter("user");
        int per=Integer.parseInt(request.getParameter("personas"));
        float pago=Float.parseFloat(request.getParameter("pago"));
        String lum=request.getParameter("lum");
        int cantL=Integer.parseInt(request.getParameter("cantL"));
        System.out.println(Integer.parseInt(request.getParameter("cantL")));
        float tiempoL=Float.parseFloat(request.getParameter("tiempoL"));
        
        String elect=request.getParameter("elect");
        int cantE=Integer.parseInt(request.getParameter("cantidadE"));
        float tiempoE=Float.parseFloat(request.getParameter("tiempoE"));
        
        String eq=request.getParameter("eq");
        int cantEq=Integer.parseInt(request.getParameter("cantidadEq"));
        float tiempoEq=Float.parseFloat(request.getParameter("tiempoEq"));
        
        registroElect(user, per, pago, lum, cantL, tiempoL, elect, cantE, tiempoE, eq, cantEq, tiempoEq);
        
                
    }
        

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
