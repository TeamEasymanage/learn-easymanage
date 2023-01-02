package ErpcustomerWs.jaxm;  
  
import java.lang.*; 
import java.util.*; 
import javax.servlet.*; 
import javax.servlet.http.*; 
 
import javax.xml.messaging.*; 
import javax.xml.soap.*; 
 
import javax.naming.*; 
import javax.xml.transform.*; 
import javax.xml.namespace.*; 
import javax.xml.bind.*; 
import javax.xml.parsers.*; 
import org.w3c.dom.*; 
 
import ErpcustomerWs.jaxb.*; 
 
public class ErpcustomerWsJaxmServlet extends JAXMServlet implements ReqRespListener { 
 
	static MessageFactory fac = null; 
	//singleton message factory 
	static { 
		try { 
			fac = MessageFactory.newInstance(); 
		} catch (Exception ex) { 
			System.out.println("Exception occured while instantiating MessageFactory."); 
			ex.printStackTrace(); 
		} 
	}; 
     
    public void init(ServletConfig servletConfig) throws ServletException { 
        super.init(servletConfig); 
   } 
    
    /**  
    * This method is called when a message is sent by the sender. 
    * The SOAMessage is received and the message and attachement parts can be retrieved. 
    */ 
    public SOAPMessage onMessage(SOAPMessage message) { 
        System.out.println("onMessage() called in ErpcustomerWsJaxm SOAP Service"); 
        String statusMsg = ""; 
        try { 
            message.writeTo(System.out); 
            System.out.println(); 
            SOAPPart sp = message.getSOAPPart();	 
            SOAPEnvelope env = sp.getEnvelope();	 
            SOAPBody sb = env.getBody(); 
 
       Document doc = sb.extractContentAsDocument(); 
 
             // create a JAXBContext capable of handling classes generated into 
            // the ErpcustomerWs.jaxb package 
            JAXBContext jc = JAXBContext.newInstance( "ErpcustomerWs.jaxb" ); 
             
            // create an Unmarshaller 
            Unmarshaller u = jc.createUnmarshaller(); 
             
            // unmarshal a po instance document into a tree of Java content 
            // objects composed of classes from package. 
            JAXBElement<?> poElement = (JAXBElement<?>)u.unmarshal( doc ); 
		System.out.println("Jaxm-Jaxb Info: "+ poElement.getName() + poElement.getDeclaredType() );  
 
		System.out.println("Find the SOAP Contents and operations requested. ");  
 
 
        Marshaller m = jc.createMarshaller(); 
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); 
  
       DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
       dbf.setNamespaceAware(true); 
       DocumentBuilder db = dbf.newDocumentBuilder(); 
       Document doc1 = db.newDocument(); 
 
       m.marshal( poElement, doc1 ); 
 
            // Add the DOM document to the message body 
            SOAPBodyElement docElement = sb.addDocument(doc1); 
 
            message.saveChanges(); 
 
            return message; 
 
		/********* 
                   statusMsg = "SOAP message was successfully processed."; 
 
             System.out.println("Creating response SOAP message"); 
             System.out.println("status : "+statusMsg); 
             // create a response message 
             SOAPMessage msg = fac.createMessage(); 
              
             SOAPEnvelope envelope = msg.getSOAPPart().getEnvelope(); 
             
             envelope.getBody() 
                     .addChildElement(envelope.createName("Status")) 
                     .addTextNode(statusMsg); 
             msg.saveChanges(); 
             System.out.println("SOAP message =>"+msg); 
            return msg; 
		***************/ 
 
        } catch(Exception e) { 
            System.out.println("Error in processing or replying to a message"); 
            return null; 
        } 
    } 
 
 
} 
