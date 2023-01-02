package ErpproductWsClient;  
  
import java.lang.*; 
import java.util.*; 
import javax.xml.datatype.*; 
import javax.xml.ws.WebServiceRef; 
 
import ErpproductWs.service.*; 
 
public class ErpproductWsClientWs { 
	@WebServiceRef (wsdlLocation="http://localhost:8080/ErpproductWsService/ErpproductWsService?wsdl")  
	static ErpproductWsService service; 
 
	public static void main(String[] args) { 
		try { 
			ErpproductWsClientWs client = new ErpproductWsClientWs(); 
			client.doTest(args); 
		     } catch(java.lang.Exception e) { 
				e.printStackTrace(); 
		    } 
	} 
     
	public void doTest(String[] args) { 
		try { 
		System.out.println("Retrieving the port from the following service: ErpproductWs ");  
		ErpproductWsSvc port = service.getErpproductWsPort(); 
		System.out.println("Invoking the methods on the port."); 
		 
		//Process args 
		//if (args.length > 0) { 
		//    var1 = args[0]; 
		//} else { 
		//    var1 = ""; 
		//} 
 
		ObjectFactory ob1 = new ObjectFactory(); 
 
 
		System.out.println("Calling ErpproductformDisplayAll(): [i.e. ErpproductformDisplayAll] "); 
		ErpproductForm wsForm1 = port.ErpproductformDisplayAll(); 
		Erpproduct tbl1 = wsForm1.getErpproduct(); 
		ErpproductRecords tblrecs1 = tbl1.getErpproductRecords(); 
		List<ErpproductRecords.ErpproductRec> tblreclist1 = tblrecs1.getErpproductRec(); 
		ListIterator iter1 = tblreclist1.listIterator(); 
		System.out.println("ErpproductForm : Erpproduct : Records : "); 
		String StoreRecNo = ""; 
		while( iter1.hasNext()) { 
			ErpproductRecords.ErpproductRec tblrec1 = (ErpproductRecords.ErpproductRec) iter1.next(); 
			ErpproductFlds tblflds1 = (ErpproductFlds) tblrec1.getErpproductFlds(); 
 
 
		/******* TO Use Following, Uncomment this *** 
 
		//Productid : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getProductid();  
		//tblflds1.setProductid(); //1234 
		System.out.println("	Productid : " + tblflds1.getProductid() ); 
		//Productname : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getProductname();  
		//tblflds1.setProductname(); //ABCD_string 
		System.out.println("	Productname : " + tblflds1.getProductname() ); 
		//Productcategory : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getProductcategory();  
		//tblflds1.setProductcategory(); //ABCD_string 
		System.out.println("	Productcategory : " + tblflds1.getProductcategory() ); 
		//Primarysupplier : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getPrimarysupplier();  
		//tblflds1.setPrimarysupplier(); //ABCD_string 
		System.out.println("	Primarysupplier : " + tblflds1.getPrimarysupplier() ); 
		//Productdesc : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getProductdesc();  
		//tblflds1.setProductdesc(); //ABCD_string 
		System.out.println("	Productdesc : " + tblflds1.getProductdesc() ); 
		//Productpicture : Java Data Type [byte[]], XML Schema Type [base64Binary]  
		//tblflds1.getProductpicture();  
		//tblflds1.setProductpicture(); //base64Binary_DATA 
		System.out.println("	Productpicture : " + tblflds1.getProductpicture() ); 
 
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
