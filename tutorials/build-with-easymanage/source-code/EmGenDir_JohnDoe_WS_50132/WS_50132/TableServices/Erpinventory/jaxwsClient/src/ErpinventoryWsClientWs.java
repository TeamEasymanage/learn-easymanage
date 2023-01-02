package ErpinventoryWsClient;  
  
import java.lang.*; 
import java.util.*; 
import javax.xml.datatype.*; 
import javax.xml.ws.WebServiceRef; 
 
import ErpinventoryWs.service.*; 
 
public class ErpinventoryWsClientWs { 
	@WebServiceRef (wsdlLocation="http://localhost:8080/ErpinventoryWsService/ErpinventoryWsService?wsdl")  
	static ErpinventoryWsService service; 
 
	public static void main(String[] args) { 
		try { 
			ErpinventoryWsClientWs client = new ErpinventoryWsClientWs(); 
			client.doTest(args); 
		     } catch(java.lang.Exception e) { 
				e.printStackTrace(); 
		    } 
	} 
     
	public void doTest(String[] args) { 
		try { 
		System.out.println("Retrieving the port from the following service: ErpinventoryWs ");  
		ErpinventoryWsSvc port = service.getErpinventoryWsPort(); 
		System.out.println("Invoking the methods on the port."); 
		 
		//Process args 
		//if (args.length > 0) { 
		//    var1 = args[0]; 
		//} else { 
		//    var1 = ""; 
		//} 
 
		ObjectFactory ob1 = new ObjectFactory(); 
 
 
		System.out.println("Calling ErpinventoryformDisplayAll(): [i.e. ErpinventoryformDisplayAll] "); 
		ErpinventoryForm wsForm1 = port.ErpinventoryformDisplayAll(); 
		Erpinventory tbl1 = wsForm1.getErpinventory(); 
		ErpinventoryRecords tblrecs1 = tbl1.getErpinventoryRecords(); 
		List<ErpinventoryRecords.ErpinventoryRec> tblreclist1 = tblrecs1.getErpinventoryRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpinventoryForm : Erpinventory : Records : "); 
		String StoreRecNo = ""; 
		while( iter1.hasNext()) { 
			ErpinventoryRecords.ErpinventoryRec tblrec1 = (ErpinventoryRecords.ErpinventoryRec) iter1.next(); 
			ErpinventoryFlds tblflds1 = (ErpinventoryFlds) tblrec1.getErpinventoryFlds(); 
 
 
		/******* TO Use Following, Uncomment this *** 
 
		//Invid : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getInvid();  
		//tblflds1.setInvid(); //1234 
		System.out.println("	Invid : " + tblflds1.getInvid() ); 
		//Productid : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getProductid();  
		//tblflds1.setProductid(); //1234 
		System.out.println("	Productid : " + tblflds1.getProductid() ); 
		//Invdate : Java Data Type [Calendar], XML Schema Type [date]  
		//tblflds1.getInvdate();  
		//tblflds1.setInvdate(); //2006-06-01-05:30 
		System.out.println("	Invdate : " + tblflds1.getInvdate() ); 
		//Invqty : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getInvqty();  
		//tblflds1.setInvqty(); //1234 
		System.out.println("	Invqty : " + tblflds1.getInvqty() ); 
		//Invminqty : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getInvminqty();  
		//tblflds1.setInvminqty(); //1234 
		System.out.println("	Invminqty : " + tblflds1.getInvminqty() ); 
		//Invcost : Java Data Type [float], XML Schema Type [float]  
		//tblflds1.getInvcost();  
		//tblflds1.setInvcost(); //1234.56 
		System.out.println("	Invcost : " + tblflds1.getInvcost() ); 
		//Invlocation : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getInvlocation();  
		//tblflds1.setInvlocation(); //ABCD_string 
		System.out.println("	Invlocation : " + tblflds1.getInvlocation() ); 
 
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
