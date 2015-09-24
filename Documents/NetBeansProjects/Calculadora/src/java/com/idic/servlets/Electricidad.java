/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.idic.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rogger
 */
public class Electricidad extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        float consumo = Float.parseFloat(request.getParameter("consumo"));
        int personas = Integer.parseInt(request.getParameter("personas"));
        int ahorradores = Integer.parseInt(request.getParameter("ahorradores"));
        float placha = Float.parseFloat(request.getParameter("plancha"));
        float horno = Float.parseFloat(request.getParameter("horno"));
        float refri = Float.parseFloat(request.getParameter("refri"));
        float coc_el = Float.parseFloat(request.getParameter("c_el"));
        float equipo = Float.parseFloat(request.getParameter("equip"));
        float tv = Float.parseFloat(request.getParameter("plancha"));
        float laptop = Float.parseFloat(request.getParameter("lap"));
        float desktop = Float.parseFloat(request.getParameter("desk"));
        float lavadora = Float.parseFloat(request.getParameter("lava"));
        float aa = Float.parseFloat(request.getParameter("aa"));
        
        float per_cap=consumo/personas;
        
        
        HttpSession ses=request.getSession(true);
        ses.setAttribute("per_cap", per_cap);
        
              
              
        
        
        
        
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
