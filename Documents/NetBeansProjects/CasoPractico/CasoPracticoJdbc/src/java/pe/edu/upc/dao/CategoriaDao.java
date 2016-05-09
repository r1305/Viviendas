/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upc.dao;

import pe.edu.upc.entity.Categoria;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Henry Joe Wong Urquiza
 * @email hwongu@hwongu.net
 */
public class CategoriaDao extends Conexion{
    
    public List<Categoria> listar() throws Exception{
        List<Categoria> categorias = new ArrayList<>();
        Categoria categoria;
        try{
            cn = obtenerConexion();
            String sql = "SELECT * FROM CATEGORIA ORDER BY nombre";
            pr = cn.prepareStatement(sql);
            rs = pr.executeQuery();
            while(rs.next()){
                categoria = new Categoria();
                categoria.setCodigo(rs.getInt("idCategoria"));
                categoria.setNombre(rs.getString("nombre"));
                categorias.add(categoria);
            }
        }finally{
            rs.close();
            pr.close();
            cn.close();
        }
        return categorias;
    }
}
