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
@WebService(serviceName = "Validar")
public class Validar {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "validar")
    public String validar(@WebParam(name = "suministro") String suministro) {
        String val;
        DAO d=new DAO();
        int sum=Integer.parseInt(suministro);
        val=d.validar(sum);
        return val;
    }
}
