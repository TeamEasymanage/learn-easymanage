package ErpsalesinquiryWsClient;  
  
import java.lang.*; 
import java.util.*; 
import javax.xml.datatype.*; 
import javax.xml.ws.WebServiceRef; 
 
import ErpsalesinquiryWs.service.*; 
 
public class ErpsalesinquiryWsClientWs { 
	@WebServiceRef (wsdlLocation="http://localhost:8080/ErpsalesinquiryWsService/ErpsalesinquiryWsService?wsdl")  
	static ErpsalesinquiryWsService service; 
 
	public static void main(String[] args) { 
		try { 
			ErpsalesinquiryWsClientWs client = new ErpsalesinquiryWsClientWs(); 
			client.doTest(args); 
		     } catch(java.lang.Exception e) { 
				e.printStackTrace(); 
		    } 
	} 
     
	public void doTest(String[] args) { 
		try { 
		System.out.println("Retrieving the port from the following service: ErpsalesinquiryWs ");  
		ErpsalesinquiryWsSvc port = service.getErpsalesinquiryWsPort(); 
		System.out.println("Invoking the methods on the port."); 
		 
		//Process args 
		//if (args.length > 0) { 
		//    var1 = args[0]; 
		//} else { 
		//    var1 = ""; 
		//} 
 
		ObjectFactory ob1 = new ObjectFactory(); 
 
 
		System.out.println("Calling ErpsalesinquiryformDisplayAll(): [i.e. ErpsalesinquiryformDisplayAll] "); 
		ErpsalesinquiryForm wsForm1 = port.ErpsalesinquiryformDisplayAll(); 
		Erpsalesinquiry tbl1 = wsForm1.getErpsalesinquiry(); 
		ErpsalesinquiryRecords tblrecs1 = tbl1.getErpsalesinquiryRecords(); 
		List<ErpsalesinquiryRecords.ErpsalesinquiryRec> tblreclist1 = tblrecs1.getErpsalesinquiryRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpsalesinquiryForm : Erpsalesinquiry : Records : "); 
		String StoreRecNo = ""; 
		while( iter1.hasNext()) { 
			ErpsalesinquiryRecords.ErpsalesinquiryRec tblrec1 = (ErpsalesinquiryRecords.ErpsalesinquiryRec) iter1.next(); 
			ErpsalesinquiryFlds tblflds1 = (ErpsalesinquiryFlds) tblrec1.getErpsalesinquiryFlds(); 
 
 
		/******* TO Use Following, Uncomment this *** 
 
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
