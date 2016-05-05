/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upc.entity;

/**
 *
 * @author Henry Joe Wong Urquiza
 */
public class Categoria {

    private Integer codigo;
    private String nombre;

    public Categoria() {
    }

    public Categoria(Integer codigo, String nombre) {
        this.codigo = codigo;
        this.nombre = nombre;
    }

    /**
     * @return the codigo
     */
    public Integer getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
