/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package idic.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rogger
 */
public class Login extends HttpServlet {
    String t="";
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
    public boolean loginAdmin(String user, String pass) {
		// TODO Auto-generated method stub
		boolean log = false;
		String p;
                Connection con;
                con = getConnection();
        try {
            
            String strsql = "SELECT * FROM usuarios where user='"+user+"'";
            PreparedStatement pstm = con.prepareStatement(strsql);
           //pstm.setString(1, user);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                if(rs.getString("user").equals(user) && rs.getString("psw").equals(pass) ){
                	
                    log=true;

                }else{
                    log=false;
                }
            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
        }
		return log;
	}
    
    public String tipo(String user) {
		// TODO Auto-generated method stub
		
		
                Connection con;
                con = getConnection();
        try {
            
            String strsql = "SELECT * FROM usuarios where user='"+user+"'";
            PreparedStatement pstm = con.prepareStatement(strsql);
           //pstm.setString(1, user);
            ResultSet rs = pstm.executeQuery();
            
            while(rs.next()){
                if(rs.getString("user").equals(user)){
                	
                    t=rs.getString("tipo");

                }
            }
            rs.close();
        }
        catch(SQLException e){
            System.out.println(e);
        }
		return t;
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       HttpSession ses=request.getSession(true);
        String user=request.getParameter("user");
        String psw=request.getParameter("psw");
//        ses.setAttribute("u", user.toUpperCase());
//        RequestDispatcher rd=null;
        
	
	
        if(loginAdmin(user, psw)){
            if(tipo(user).equals("municipio")){
                response.sendRedirect("Municipios.jsp?user="+user);
            }else{
                response.sendRedirect("Electricidad.jsp?user="+user);
            }
        }else{
            response.sendRedirect("index.jsp");
        }
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
