/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.arqui;

import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.MessageConsumer;
import javax.jms.Session;
import javax.jws.WebService;
import javax.jws.WebMethod;
import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;

/**
 *
 * @author Rogger
 */
@WebService(serviceName = "Client")
public class Client {

    private static ActiveMQConnectionFactory connectionFactory; 
    private static Connection connection; 
    private static Session session; 
    private static Destination destination;
    @WebMethod(operationName = "read")
    public boolean read() {
        
        boolean leido=false;
        try {

            connectionFactory = new ActiveMQConnectionFactory(

            ActiveMQConnection.DEFAULT_USER,

            ActiveMQConnection.DEFAULT_PASSWORD,

            ActiveMQConnection.DEFAULT_BROKER_URL);

            connection = connectionFactory.createConnection(); connection.start();

            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

            destination = session.createQueue("LuzDelNorte");

            MessageConsumer consumer = session.createConsumer(destination);

            Consumer myConsumer = new Consumer();

            consumer.setMessageListener(myConsumer); 
            
            leido=true;
            Thread.sleep(3000); 
            session.close();

            connection.close();

        }

        catch(Exception e) {

            e.printStackTrace();
            leido=false;

        }
        return leido;
    }
}
