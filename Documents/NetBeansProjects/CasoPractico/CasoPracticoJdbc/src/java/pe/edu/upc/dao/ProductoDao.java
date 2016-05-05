/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upc.dao;

import pe.edu.upc.entity.Producto;
import pe.edu.upc.entity.Categoria;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Henry Joe Wong Urquiza
 */
public class ProductoDao extends Conexion{
   
    public void insertar(Producto producto) throws Exception{
        try{
            cn = obtenerConexion();
            String sql = "INSERT INTO PRODUCTO (nombre,cantidad,precio,idCategoria) VALUES (?,?,?,?)";
            pr = cn.prepareStatement(sql);
            pr.setString(1, producto.getNombre());
            pr.setInt(2, producto.getCantidad());
            pr.setDouble(3, producto.getPrecio());
            pr.setInt(4, producto.getCategoria().getCodigo());
            pr.executeUpdate();
        }finally{
            pr.close();
            cn.close();
        }
    }
    
    public void actualizar(Producto producto) throws Exception{
        try{
            cn = obtenerConexion();
            String sql = "UPDATE PRODUCTO SET nombre=?,cantidad=?,precio=?,idCategoria=? WHERE idProducto=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, producto.getNombre());
            pr.setInt(2, producto.getCantidad());
            pr.setDouble(3, producto.getPrecio());
            pr.setInt(4, producto.getCategoria().getCodigo());
            pr.setInt(5, producto.getCodigo());
            pr.executeUpdate();
        }finally{
            pr.close();
            cn.close();
        }
    }
    
    public void eliminar(int idProducto)throws Exception{
        try{
            cn = obtenerConexion();
            String sql = "DELETE FROM Producto WHERE idProducto=?";
            pr = cn.prepareStatement(sql);
            pr.setInt(1, idProducto);
            pr.executeUpdate();
        }finally{
            pr.close();
            cn.close();
        }
    }
    
    public Producto obtener(int idProducto) throws Exception{
        Producto producto = null;
        try{
            cn = obtenerConexion();
            String sql = "select p.*, c.nombre as categoria from producto p inner join categoria c on p.idCategoria = c.idCategoria WHERE p.idProducto=? ORDER BY nombre";
            pr = cn.prepareStatement(sql);
            pr.setInt(1, idProducto);
            rs = pr.executeQuery();
            while(rs.next()){
                producto = new Producto();
                producto.setCodigo(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCategoria(new Categoria());
                producto.getCategoria().setCodigo(rs.getInt("idCategoria"));
                producto.getCategoria().setNombre(rs.getString("categoria"));
            }
        }finally{
            rs.close();
            pr.close();
            cn.close();
        }
        return producto;
    }
    
    public List<Producto> listar() throws Exception{
        List<Producto> productos = new ArrayList<>();
        Producto producto;
        try{
            cn = obtenerConexion();
            String sql = "select p.*, c.nombre as categoria from producto p inner join categoria c on p.idCategoria = c.idCategoria ORDER BY nombre";
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();
            while(rs.next()){
                producto = new Producto();
                producto.setCodigo(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCategoria(new Categoria());
                producto.getCategoria().setCodigo(rs.getInt("idCategoria"));
                producto.getCategoria().setNombre(rs.getString("categoria"));
                productos.add(producto);
            }
        }finally{
            rs.close();
            pr.close();
            cn.close();
        }
        return productos;
    }
}
