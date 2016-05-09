package ws.arqui;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.apache.activemq.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebService(serviceName = "Server")
public class Server {
    
    private static ActiveMQConnectionFactory connectionFactory; 
    private static Connection connection; 
    private static Session session; 
    private static Destination destination; 
    private static boolean transacted = false;

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ponerencola")
    public String ponerencola(@WebParam(name = "suministro") String suministro,
            @WebParam(name = "fecha") String fecha,
            @WebParam(name = "consumo") String consumo) {
        //TODO write your implementation code here:
        String mensaje=suministro+","+fecha+","+consumo;
        String enCola="";
        
        
        try {

            connectionFactory = new ActiveMQConnectionFactory(
            ActiveMQConnection.DEFAULT_USER,
            ActiveMQConnection.DEFAULT_PASSWORD,
            ActiveMQConnection.DEFAULT_BROKER_URL);
            connection = connectionFactory.createConnection(); 
            connection.start(); session =connection.createSession(transacted,Session.AUTO_ACKNOWLEDGE);
            destination = session.createQueue("LuzDelNorte");
            MessageProducer producer = session.createProducer(destination); 
            producer.setDeliveryMode(DeliveryMode.NON_PERSISTENT);
            TextMessage message =session.createTextMessage(mensaje);
            System.out.println(message.getText());
            //Enviamos un mensaje producer.send(message);
            producer.send(message);
            enCola="ok";
        }

        catch (JMSException e) {

            System.out.print(e);
            enCola="no";
        }
        
        return enCola;
    }
}
