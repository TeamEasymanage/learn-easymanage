package ErpinventorysumvwWsClient;  
  
import java.lang.*; 
import java.util.*; 
import javax.xml.datatype.*; 
import javax.xml.ws.WebServiceRef; 
 
import ErpinventorysumvwWs.service.*; 
 
public class ErpinventorysumvwWsClientWs { 
	@WebServiceRef (wsdlLocation="http://localhost:8080/ErpinventorysumvwWsService/ErpinventorysumvwWsService?wsdl")  
	static ErpinventorysumvwWsService service; 
 
	public static void main(String[] args) { 
		try { 
			ErpinventorysumvwWsClientWs client = new ErpinventorysumvwWsClientWs(); 
			client.doTest(args); 
		     } catch(java.lang.Exception e) { 
				e.printStackTrace(); 
		    } 
	} 
     
	public void doTest(String[] args) { 
		try { 
		System.out.println("Retrieving the port from the following service: ErpinventorysumvwWs ");  
		ErpinventorysumvwWsSvc port = service.getErpinventorysumvwWsPort(); 
		System.out.println("Invoking the methods on the port."); 
		 
		//Process args 
		//if (args.length > 0) { 
		//    var1 = args[0]; 
		//} else { 
		//    var1 = ""; 
		//} 
 
		ObjectFactory ob1 = new ObjectFactory(); 
 
 
		System.out.println("Calling ErpinventorysumvwformDisplayAll(): [i.e. ErpinventorysumvwformDisplayAll] "); 
		ErpinventorysumvwForm wsForm1 = port.ErpinventorysumvwformDisplayAll(); 
		Erpinventorysumvw tbl1 = wsForm1.getErpinventorysumvw(); 
		ErpinventorysumvwRecords tblrecs1 = tbl1.getErpinventorysumvwRecords(); 
		List<ErpinventorysumvwRecords.ErpinventorysumvwRec> tblreclist1 = tblrecs1.getErpinventorysumvwRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpinventorysumvwForm : Erpinventorysumvw : Records : "); 
		String StoreRecNo = ""; 
		while( iter1.hasNext()) { 
			ErpinventorysumvwRecords.ErpinventorysumvwRec tblrec1 = (ErpinventorysumvwRecords.ErpinventorysumvwRec) iter1.next(); 
			ErpinventorysumvwFlds tblflds1 = (ErpinventorysumvwFlds) tblrec1.getErpinventorysumvwFlds(); 
 
 
		/******* TO Use Following, Uncomment this *** 
 
		//Year : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getYear();  
		//tblflds1.setYear(); //1234 
		System.out.println("	Year : " + tblflds1.getYear() ); 
		//Month : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getMonth();  
		//tblflds1.setMonth(); //1234 
		System.out.println("	Month : " + tblflds1.getMonth() ); 
		//Totalqty : Java Data Type [float], XML Schema Type [float]  
		//tblflds1.getTotalqty();  
		//tblflds1.setTotalqty(); //1234.56 
		System.out.println("	Totalqty : " + tblflds1.getTotalqty() ); 
 
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
