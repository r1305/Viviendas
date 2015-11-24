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
@WebService(serviceName = "ActualizarCliente")
public class ActualizarCliente {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "actualizar")
    public boolean actualizar(@WebParam(name = "sum") String sum, @WebParam(name = "user") String user, @WebParam(name = "psw") String psw) {
        //TODO write your implementation code here:
        
        boolean ok=false;
        DAO d=new DAO();
        ok=d.actualizarUsuario(sum, user, psw);
        return ok;
    }
}
