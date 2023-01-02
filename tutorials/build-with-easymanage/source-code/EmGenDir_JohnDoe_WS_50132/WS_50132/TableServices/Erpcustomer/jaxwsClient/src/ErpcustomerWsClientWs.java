package ErpcustomerWsClient;  
  
import java.lang.*; 
import java.util.*; 
import javax.xml.datatype.*; 
import javax.xml.ws.WebServiceRef; 
 
import ErpcustomerWs.service.*; 
 
public class ErpcustomerWsClientWs { 
	@WebServiceRef (wsdlLocation="http://localhost:8080/ErpcustomerWsService/ErpcustomerWsService?wsdl")  
	static ErpcustomerWsService service; 
 
	public static void main(String[] args) { 
		try { 
			ErpcustomerWsClientWs client = new ErpcustomerWsClientWs(); 
			client.doTest(args); 
		     } catch(java.lang.Exception e) { 
				e.printStackTrace(); 
		    } 
	} 
     
	public void doTest(String[] args) { 
		try { 
		System.out.println("Retrieving the port from the following service: ErpcustomerWs ");  
		ErpcustomerWsSvc port = service.getErpcustomerWsPort(); 
		System.out.println("Invoking the methods on the port."); 
		 
		//Process args 
		//if (args.length > 0) { 
		//    var1 = args[0]; 
		//} else { 
		//    var1 = ""; 
		//} 
 
		ObjectFactory ob1 = new ObjectFactory(); 
 
 
		System.out.println("Calling ErpcustomerformDisplayAll(): [i.e. ErpcustomerformDisplayAll] "); 
		ErpcustomerForm wsForm1 = port.ErpcustomerformDisplayAll(); 
		Erpcustomer tbl1 = wsForm1.getErpcustomer(); 
		ErpcustomerRecords tblrecs1 = tbl1.getErpcustomerRecords(); 
		List<ErpcustomerRecords.ErpcustomerRec> tblreclist1 = tblrecs1.getErpcustomerRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpcustomerForm : Erpcustomer : Records : "); 
		String StoreRecNo = ""; 
		while( iter1.hasNext()) { 
			ErpcustomerRecords.ErpcustomerRec tblrec1 = (ErpcustomerRecords.ErpcustomerRec) iter1.next(); 
			ErpcustomerFlds tblflds1 = (ErpcustomerFlds) tblrec1.getErpcustomerFlds(); 
 
 
		/******* TO Use Following, Uncomment this *** 
 
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
 
		******* TO Use Above, Uncomment this ***/ 
 
		RecInfo ri1 = tblrec1.getRecInfo(); 
		System.out.println("RecInfo : "+ri1.getSrlNo()+" , "+ri1.getRecNo()); 
 
 		//Note down 1st record no in StoreRecNo 
		if (ri1.getSrlNo() == 1 ) { StoreRecNo = ""+ri1.getRecNo(); } 
 
		} //while 
 
		WpInfo wi1 = wsForm1.getWpInfo(); 
		System.out.println("WpInfo : "+wi1.getWpStatus()+" , "+wi1.getWpRecords()); 
 
 
 
		} catch(java.lang.Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
