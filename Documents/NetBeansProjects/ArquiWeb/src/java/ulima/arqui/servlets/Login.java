/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulima.arqui.servlets;

import arqui.dao.DAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;
import ws.arqui.Consumer;
import ws.arqui.Listar_Service;
import ws.arqui.Login_Service;


/**
 *
 * @author Rogger
 */
public class Login extends HttpServlet {
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WS/Listar.wsdl")
    private Listar_Service service_1;
    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WS/Login.wsdl")
    private Login_Service service;

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession(true);
        String user=request.getParameter("user");
        String psw=request.getParameter("psw");
        
        String login=login(user, psw);
        DAO d=new DAO();
        int sum=d.getSum(user);
        
        if(login.equals("cliente")){
            
            List<Consumer> c=listar(sum);
            ses.setAttribute("lista", c);                  
            response.sendRedirect("Consumos.jsp");
            
        }else if(login.equals("admin")){
            response.sendRedirect("Admin.jsp");
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

    

    private java.util.List<ws.arqui.Consumer> listar(int suministro) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        ws.arqui.Listar port = service_1.getListarPort();
        return port.listar(suministro);
    }

    private String login(java.lang.String user, java.lang.String psw) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        ws.arqui.Login port = service.getLoginPort();
        return port.login(user, psw);
    }

    

}
