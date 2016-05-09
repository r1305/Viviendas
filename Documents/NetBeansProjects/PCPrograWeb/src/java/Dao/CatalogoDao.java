/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;
import Entity.Catalogo;
import Entity.Usuario;
import java.util.ArrayList;
import java.util.List;


public class CatalogoDao extends Conexion{
    public void insertar(Catalogo catalogo) throws Exception{
        try{
            cn = ObtenerConexion();
            String sql = "INSERT INTO CATALOGO (marca,modelo,tipo,oferta,es4G,descripcion) VALUES (?,?,?,?,?,?)";
            pr = cn.prepareStatement(sql);
            pr.setString(1, catalogo.getMarca());
            pr.setString(2, catalogo.getModelo());
            pr.setString(3, catalogo.getTipo());
            pr.setString(4, catalogo.getOferta());
            pr.setString(5, catalogo.getEs4G());
            pr.setString(6, catalogo.getDescripcion());
            pr.executeUpdate();
        } finally{
            pr.close();
            cn.close();
        }
    }
    
    public void actualizar(Catalogo catalogo) throws Exception{
        try{
            cn = ObtenerConexion();
            String sql = "UPDATE CATALOGO SET marca=?,modelo=?,tipo=?,oferta=?,es4G=?,descripcion=? WHERE idcatalogo=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, catalogo.getMarca());
            pr.setString(2, catalogo.getModelo());
            pr.setString(3, catalogo.getTipo());
            pr.setString(4, catalogo.getOferta());
            pr.setString(5, catalogo.getEs4G());
            pr.setString(6, catalogo.getDescripcion());
            pr.setString(7, catalogo.getCodigo());
            pr.executeUpdate();
        }finally{
            cn.close();
            pr.close();
        }
    }
    
    public void eliminar(Catalogo catalogo) throws Exception{
        try{
            cn = ObtenerConexion();
            String sql = "DELETE FROM CATALOGO WHERE idCatalogo=?";
            pr = cn.prepareStatement(sql);
            pr.setString(1, catalogo.getCodigo());
            pr.executeUpdate();
        } finally{
            cn.close();
            pr.close();
        }
    }
    public Catalogo obtener(String idCatalogo ) throws Exception{
        Catalogo catalogo=null;
        try{
            cn = ObtenerConexion();
            String sql = "SELECT * FROM CATALOGOS ORDER BY idCatalogo";
            pr = cn.prepareStatement(sql);
            pr.executeQuery();
            while(rs.next()){
                catalogo = new Catalogo();
                catalogo.setCodigo(rs.getString("idCatalogo"));
                catalogo.setMarca(rs.getString("Marca"));
                catalogo.setModelo(rs.getString("Modelo"));
                catalogo.setTipo(rs.getString("Tipo"));
                catalogo.setOferta(rs.getString("Oferta"));
                catalogo.setEs4G(rs.getString("es4G"));
                catalogo.setDescripcion(rs.getString("Descripcion"));
            }
        }finally{
            rs.close();
            pr.close();
            cn.close();
        }
        return catalogo;
    }
}
