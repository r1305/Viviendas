/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Brian
 */
public class Usuario {
    private String Usuario;
    private String Clave;
    
    
    public Usuario(String Usuario,String Clave) {
        this.Usuario = Usuario;
        this.Clave = Clave;
        
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }
}
