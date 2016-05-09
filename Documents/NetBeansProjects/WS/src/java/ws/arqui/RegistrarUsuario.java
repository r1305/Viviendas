/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.arqui;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Rogger
 */
@WebService(serviceName = "RegistrarUsuario")
public class RegistrarUsuario {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "registrarUsuario")
    public boolean registrarUsuario(
                @WebParam(name = "suministro") String suministro, 
                @WebParam(name = "usuario") String usuario,
                @WebParam(name = "clave") String clave) {
        //TODO write your implementation code here:
        boolean ok=false;
        
        DAO d=new DAO();
        ok=d.registrarUsuario(suministro, usuario, clave, "cliente");
        
        return ok;
    }
}
