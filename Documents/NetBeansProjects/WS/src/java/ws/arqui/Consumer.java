/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.arqui;

import java.util.ArrayList;
import java.util.List;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import javax.jms.TextMessage;

public class Consumer implements MessageListener {
    
    String fecha;
    int suministro;
    float consumo;

    public Consumer() {
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getSuministro() {
        return suministro;
    }

    public void setSuministro(int suministro) {
        this.suministro = suministro;
    }

    public float getConsumo() {
        return consumo;
    }

    public void setConsumo(float consumo) {
        this.consumo = consumo;
    }
    

public void onMessage(Message arg0) {
    
    
    try {

        if (arg0 instanceof TextMessage) {
        
            String m=((TextMessage)arg0).getText();
            System.out.println("Mensaje Recibido = "+m);
            String[] recibido=m.split(",");
            DAO d=new DAO();
            System.out.println(recibido[0]);
            System.out.println(recibido[1]);
            System.out.println(recibido[2]);
            
            boolean ok=d.registrar(recibido[0],recibido[1],recibido[2]);
            System.out.println(ok);
        

        }else if (arg0 instanceof ObjectMessage) {
            System.out.println("Mensaje Recibido en else: "+((ObjectMessage)arg0).getObject());

        }

    } catch (JMSException e) { 
        e.printStackTrace();

    }
}

}
