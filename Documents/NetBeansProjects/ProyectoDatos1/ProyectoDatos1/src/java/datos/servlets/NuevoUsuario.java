/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos.servlets;

import datos.Dao.Dao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rogger
 */
public class NuevoUsuario extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String u=request.getParameter("user");
        String p=request.getParameter("psw");
        String nombre=request.getParameter("nombre");
        String fecha=request.getParameter("fecha");
        String ap=request.getParameter("ap");
        String am=request.getParameter("am");
        String dni=request.getParameter("dni");
        String dir=request.getParameter("dir");
        String d=request.getParameter("dist");
        String tlf=request.getParameter("tlf");
        String e=request.getParameter("email");
        
        Dao dao=new Dao();
        boolean ok=dao.registrarEmpleado(nombre, u, p, dni, ap, am, d, dir, tlf, e);
        if(ok){
            response.sendRedirect("index.jsp");
            
        }else{
            response.sendRedirect("NuevoEmpleado.jsp");
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
