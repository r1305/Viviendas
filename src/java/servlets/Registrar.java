/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dto.Conexion;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Rogger
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class Registrar extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = request.getParameter("url");
        String dir = request.getParameter("dir");
        String desc = request.getParameter("desc").trim();
        float prestamo = Float.parseFloat(request.getParameter("precio"));

        Conexion c = new Conexion();
        boolean ok = c.registro(dir, desc, prestamo, url);
        if (ok) {
            response.sendRedirect("operario.jsp");
        }
    }

    private String getFileName(final Part part) {
        String ruta = "";
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                ruta = content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return ruta;
    }

    public String writeFile(Part filePart) throws IOException {
        //System.out.println(filePart.getName());
        String file = getFileName(filePart);
        String fileName = file.substring(file.lastIndexOf("\\") + 1);
        //writer.println("File name "+fileName);
        //System.out.println("file name "+fileName);
        OutputStream out = null;
        InputStream filecontent = null;
        final String path = "D:\\";
        //writer.println("path "+path);
        //System.out.println("path "+path);
        String ruta = "";
        try {
            out = new FileOutputStream(new File(path + File.separator
                    + fileName));

            //writer.println("out "+out);
            //System.out.println("out "+out);
            filecontent = filePart.getInputStream();
            //System.out.println(filecontent);

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            ruta = path + fileName;

        } catch (Exception fne) {
            System.out.println(fne.toString());
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }
        return ruta;
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
