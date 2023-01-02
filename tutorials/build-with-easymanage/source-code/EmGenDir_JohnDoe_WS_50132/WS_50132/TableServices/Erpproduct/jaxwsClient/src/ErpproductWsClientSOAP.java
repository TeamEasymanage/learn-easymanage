package ErpproductWsClient;  
  
import java.io.*; 
import java.util.*; 
 
import javax.xml.soap.*; 
import javax.xml.bind.*; 
import java.net.URL; 
import javax.xml.parsers.*; 
import org.w3c.dom.*; 
import javax.xml.namespace.QName; 
import javax.xml.*; 
 
import ErpproductWs.jaxb.*; 
 
public class ErpproductWsClientSOAP { 
 
	public static void main(String[] args) { 
		try { 
			ErpproductWsClientSOAP sc = new ErpproductWsClientSOAP(); 
 
		// Create message factory SOAP 1.1 
		MessageFactory messageFactory = MessageFactory.newInstance(); 
			//For SOAP 1.2 
			//MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL);  
			//For either SOAP 1.1 or SOAP 1.2 messages:  
			//MessageFactory factory = MessageFactory.newInstance(SOAPConstants.DYNAMIC_SOAP_PROTOCOL);  
 
		// Create a message 
		SOAPMessage message = messageFactory.createMessage(); 
 
		// Get the SOAP header and body from the message 
		// and remove the header 
		SOAPHeader header = message.getSOAPHeader(); 
		SOAPBody body = message.getSOAPBody(); 
		//remove the header (delete) 
		header.detachNode();  
 
		//Compose SOAPBody with XML content:  
		//	1. Using XML file/jaxb 
 
		System.out.println("Configuring SOAP Body For diff. operations: "); 
 
 
 
 
		// Add the DOM document to the message body 
		SOAPBodyElement docElement = body.addDocument(sc.getDocument()); 
 
		message.saveChanges(); 
 
		System.out.println("Invoking the SOAP Connection."); 
 
		SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance(); 
		SOAPConnection connection = soapConnectionFactory.createConnection(); 
		URL endpoint = new URL ("http://localhost:8080/ErpproductWsJaxm/ErpproductWsJaxmService"); 
		SOAPMessage response = connection.call(message, endpoint); 
		connection.close(); 
 
		SOAPBody soapBody = response.getSOAPBody(); 
 
		System.out.println("===========Send SOAP , received SOAP ==============");  
		System.out.println("Received SOAP body document contents: ");  
 
		// Get contents using SAAJ APIs 
		Iterator iter1 = soapBody.getChildElements(); 
		sc.getContents(iter1, ""); 
 
		System.out.println("End. [ErpproductWsJaxm calls] "); 
 
		} catch (Exception ex) { 
			ex.printStackTrace(); 
		} 
 
	} 
 
private Document getDocument() { 
 
       Document doc = null; 
 
	try { 
 
            // create a JAXBContext capable of handling classes generated into 
            // the ErpproductWs.jaxb package 
            JAXBContext jc = JAXBContext.newInstance( "ErpproductWs.jaxb" ); 
             
            // create an Unmarshaller 
            Unmarshaller u = jc.createUnmarshaller(); 
             
            // unmarshal a po instance document into a tree of Java content 
            // objects composed of classes from package. 
            JAXBElement<?> poElement = (JAXBElement<?>)u.unmarshal( new FileInputStream( "./../jaxb/ErpproductWs.xml" ) ); 
		System.out.println("JaxmClient-Jaxb Info: "+ poElement.getName() + poElement.getDeclaredType() );  
 
	Marshaller m = jc.createMarshaller(); 
	m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); 
	m.marshal( poElement, System.out ); 
  
	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance(); 
	dbf.setNamespaceAware(true); 
	DocumentBuilder db = dbf.newDocumentBuilder(); 
	doc = db.newDocument(); 
 
	m.marshal( poElement, doc ); 
 
        } catch( JAXBException je ) { 
            je.printStackTrace(); 
        } catch( IOException ioe ) { 
            ioe.printStackTrace(); 
        } catch( Exception ex ) { 
            ex.printStackTrace(); 
        } 
 
	return doc; 
 
  } 
 
public void getContents(Iterator iterator, String indent) { 
 
  while (iterator.hasNext()) { 
    javax.xml.soap.Node node = (javax.xml.soap.Node) iterator.next(); 
    SOAPElement element = null; 
    javax.xml.soap.Text text = null; 
    if (node instanceof SOAPElement) { 
      element = (SOAPElement)node; 
      QName name = element.getElementQName(); 
      System.out.println(indent + "Name is " + name.toString()); 
      Iterator attrs = element.getAllAttributesAsQNames(); 
      while (attrs.hasNext()){ 
        QName attrName = (QName)attrs.next(); 
        System.out.println(indent + " Attribute name is " + attrName.toString()); 
        System.out.println(indent + " Attribute value is " + element.getAttributeValue(attrName)); 
      } 
      Iterator iter2 = element.getChildElements(); 
      getContents(iter2, indent + " "); 
    } else { 
      text = (javax.xml.soap.Text) node; 
      String content = text.getValue(); 
      System.out.println(indent + "Content is: " + content); 
      } 
    } 
  }  
 
 
 
} 
