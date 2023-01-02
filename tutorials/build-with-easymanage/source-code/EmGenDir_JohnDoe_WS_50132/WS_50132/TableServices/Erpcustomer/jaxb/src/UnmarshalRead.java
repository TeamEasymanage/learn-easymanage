package ErpcustomerWs.unread;  
  
import java.io.*; 
import java.util.*; 
 
import javax.xml.bind.*; 
import javax.xml.datatype.*; 
 
 
// import java content classes generated by binding compiler 
import ErpcustomerWs.jaxb.*; 
 
public class UnmarshalRead { 
     
    // This sample application demonstrates how to unmarshal an instance 
    // document into a Java content tree and access data contained within it. 
     
    public static void main( String[] args ) { 
     
        try { 
            // create a JAXBContext capable of handling classes generated into 
            // the ErpcustomerWs.jaxb package 
            JAXBContext jc = JAXBContext.newInstance( "ErpcustomerWs.jaxb" ); 
             
            // create an Unmarshaller 
            Unmarshaller u = jc.createUnmarshaller(); 
             
            // unmarshal a (ErpcustomerWs) instance document into a tree of Java content 
            // objects composed of classes from package. 
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new FileInputStream( "ErpcustomerWs.xml" ) ); 
 
		System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );  
 
		ErpcustomerWs wsVar = (ErpcustomerWs) wsElement.getValue(); 
 
 
		ErpcustomerForm wsForm1 = (ErpcustomerForm) wsVar.getErpcustomerForm(); 
		Erpcustomer tbl1 = wsForm1.getErpcustomer(); 
		ErpcustomerRecords tblrecs1 = tbl1.getErpcustomerRecords(); 
		List<ErpcustomerRecords.ErpcustomerRec> tblreclist1 = tblrecs1.getErpcustomerRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpcustomerForm : Erpcustomer : Records : "); 
		while( iter1.hasNext()) { 
			ErpcustomerRecords.ErpcustomerRec tblrec1 = (ErpcustomerRecords.ErpcustomerRec) iter1.next(); 
			ErpcustomerFlds tblflds1 = (ErpcustomerFlds) tblrec1.getErpcustomerFlds(); 
 
		//CustomerId : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getCustomerId();  
		//tblflds1.setCustomerId(); //ABCD_string 
		System.out.println("	CustomerId : " + tblflds1.getCustomerId() ); 
		//Name : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getName();  
		//tblflds1.setName(); //ABCD_string 
		System.out.println("	Name : " + tblflds1.getName() ); 
		//Phone : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getPhone();  
		//tblflds1.setPhone(); //ABCD_string 
		System.out.println("	Phone : " + tblflds1.getPhone() ); 
		//MobilePhone : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getMobilePhone();  
		//tblflds1.setMobilePhone(); //ABCD_string 
		System.out.println("	MobilePhone : " + tblflds1.getMobilePhone() ); 
		//Pict : Java Data Type [byte[]], XML Schema Type [base64Binary]  
		//tblflds1.getPict();  
		//tblflds1.setPict(); //base64Binary_DATA 
		System.out.println("	Pict : " + tblflds1.getPict() ); 
		//Email : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getEmail();  
		//tblflds1.setEmail(); //ABCD_string 
		System.out.println("	Email : " + tblflds1.getEmail() ); 
		//WebSite : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getWebSite();  
		//tblflds1.setWebSite(); //ABCD_string 
		System.out.println("	WebSite : " + tblflds1.getWebSite() ); 
		//Address : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getAddress();  
		//tblflds1.setAddress(); //ABCD_string 
		System.out.println("	Address : " + tblflds1.getAddress() ); 
		//DateOfInquiry : Java Data Type [Calendar], XML Schema Type [date]  
		//tblflds1.getDateOfInquiry();  
		//tblflds1.setDateOfInquiry(); //2006-06-01-05:30 
		System.out.println("	DateOfInquiry : " + tblflds1.getDateOfInquiry() ); 
		//RequestedQty : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getRequestedQty();  
		//tblflds1.setRequestedQty(); //1234 
		System.out.println("	RequestedQty : " + tblflds1.getRequestedQty() ); 
		//ReqQuoteAmt : Java Data Type [float], XML Schema Type [float]  
		//tblflds1.getReqQuoteAmt();  
		//tblflds1.setReqQuoteAmt(); //1234.56 
		System.out.println("	ReqQuoteAmt : " + tblflds1.getReqQuoteAmt() ); 
		//MeetingPrefTime : Java Data Type [Calendar], XML Schema Type [time]  
		//tblflds1.getMeetingPrefTime();  
		//tblflds1.setMeetingPrefTime(); //14:10:00-05:30 
		System.out.println("	MeetingPrefTime : " + tblflds1.getMeetingPrefTime() ); 
		//Created : Java Data Type [Calendar], XML Schema Type [dateTime]  
		//tblflds1.getCreated();  
		//tblflds1.setCreated(); //2006-06-01T14:10:00-05:30 
		System.out.println("	Created : " + tblflds1.getCreated() ); 
		//Updated : Java Data Type [Calendar], XML Schema Type [dateTime]  
		//tblflds1.getUpdated();  
		//tblflds1.setUpdated(); //2006-06-01T14:10:00-05:30 
		System.out.println("	Updated : " + tblflds1.getUpdated() ); 
		RecInfo ri1 = tblrec1.getRecInfo(); 
		System.out.println("  RecInfo : "+ri1.getSrlNo()+" , "+ri1.getRecNo()); 
 
		} //while 
 
		WpInfo wi1 = wsForm1.getWpInfo(); 
		System.out.println("  WpInfo : "+wi1.getWpStatus()+" , "+wi1.getWpRecords()); 
		System.out.println("END : ErpcustomerForm : Erpcustomer : Records : "); 
 
 
 
        Marshaller m1 = jc.createMarshaller();  
        m1.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true); 
        m1.marshal(wsElement, System.out); 
          
        } catch( JAXBException je ) { 
            je.printStackTrace(); 
        } catch( IOException ioe ) { 
            ioe.printStackTrace(); 
        } 
    } 
} 
