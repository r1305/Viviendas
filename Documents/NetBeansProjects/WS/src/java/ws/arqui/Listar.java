/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.arqui;

import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Rogger
 */
@WebService(serviceName = "Listar")
public class Listar {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "listar")
    public List<Consumer> listar(@WebParam(name = "suministro") int suministro) {
        //TODO write your implementation code here:
        
        
        DAO d=new DAO();
        List<Consumer> l=d.listar(suministro);
        
        return l;
    }
}
