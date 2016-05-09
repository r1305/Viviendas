package pe.edu.upc.controller;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upc.dao.ProductoDao;
import pe.edu.upc.entity.Categoria;
import pe.edu.upc.entity.Producto;
import pe.edu.upc.entity.Usuario;

@WebServlet(name = "ControladorServlet", urlPatterns = {"/ControladorServlet"})
public class ControladorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("action");
        switch(accion){
            case "INICIAR_SESION":
                iniciarSesion(request, response);
                break;
            case "REGISTRAR_PRODUCTO":
                registrarProducto(request, response);
                break;
            case "ACTUALIZAR_PRODUCTO":
                actualizarProducto(request, response);
                break;
            case "ELIMINAR_PRODUCTO":
                eliminarProducto(request, response);
                break;
                
        }
    }

    private void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usuario = new Usuario();
        usuario.setUsuario(request.getParameter("txtUsuario"));
        usuario.setClave(request.getParameter("txtClave"));
        usuario.setFecha(new Date());
        request.getSession(true).setAttribute("usuarioInicio", usuario);
        if (request.getParameter("chkRecordar") != null) {
            Cookie cookie = new Cookie("usuario", request.getParameter("txtUsuario"));
            cookie.setMaxAge(60 * 60 * 60);
            response.addCookie(cookie);
            cookie = new Cookie("clave", request.getParameter("txtClave"));
            cookie.setMaxAge(60 * 60 * 60);
            response.addCookie(cookie);
        }
        response.sendRedirect("listar.jsp");
    }
    
     private void registrarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mensaje;
        try{
            Producto producto = new Producto();
            producto.setNombre(request.getParameter("txtNombre"));
            producto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            producto.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
            producto.setCategoria(new Categoria());
            producto.getCategoria().setCodigo(Integer.parseInt(request.getParameter("cboCategoria")));
            ProductoDao dao = new ProductoDao();
            dao.insertar(producto);
            mensaje = "Se registro correctamente el producto";
        }catch(Exception e){
            e.printStackTrace();
            mensaje = "Error al registrar: " + e.getMessage();
        }
        response.sendRedirect("listar.jsp?mensaje=" + mensaje);
         
     }
     private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String mensaje;
        try{
            Producto producto = new Producto();
            producto.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
            producto.setNombre(request.getParameter("txtNombre"));
            producto.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            producto.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
            producto.setCategoria(new Categoria());
            producto.getCategoria().setCodigo(Integer.parseInt(request.getParameter("cboCategoria")));
            ProductoDao dao = new ProductoDao();
            dao.actualizar(producto);
            mensaje = "Se actualizo correctamente el producto";
        }catch(Exception e){
            e.printStackTrace();
            mensaje = "Error al registrar: " + e.getMessage();
        }
        response.sendRedirect("listar.jsp?mensaje=" + mensaje);
     }
     
     private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String mensaje;
        try{
            ProductoDao dao = new ProductoDao();
            dao.eliminar(Integer.parseInt(request.getParameter("idProducto")));
            mensaje = "Se elimino correctamente el producto";
        }catch(Exception e){
            e.printStackTrace();
            mensaje = "Error al registrar: " + e.getMessage();
        }
        response.sendRedirect("listar.jsp?mensaje=" + mensaje);
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
