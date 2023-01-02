package ErpinventoryvwWs.service;  
  
import java.lang.*; 
import java.util.*; 
import java.io.*; 
import javax.jws.WebMethod; 
import javax.jws.WebService; 
import javax.xml.bind.*; 
import javax.xml.bind.annotation.XmlType; 
import javax.xml.datatype.*; 
 
import ErpinventoryvwWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@WebService(name="ErpinventoryvwWsSvc",serviceName="ErpinventoryvwWsService",portName="ErpinventoryvwWsPort",targetNamespace="http://emws50.ErpinventoryvwWs/jaxws") 
public class ErpinventoryvwWsWebService { 
	private String message = new String("ErpinventoryvwWs (jaxws): "); 
 
 
	//EM Name + Mode + Qry Opt : ErpinventoryvwformDisplayAll 
 
	@WebMethod() 
	public  ErpinventoryvwForm ErpinventoryvwformDisplayAll()  
	throws Exception 
	{  
		ErpinventoryvwForm wsForm1 = new ErpinventoryvwForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpinventoryvwForm","Erpinventoryvw"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpinventoryvwWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpinventoryvwForm) wsVar.getErpinventoryvwForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpinventoryvw tbl1 = wsForm1.getErpinventoryvw(); 
		ErpinventoryvwRecords tblrecs1 = tbl1.getErpinventoryvwRecords(); 
		int tblrecs1_Count = tblrecs1.getErpinventoryvwRec().size(); 
		System.out.println("Count Erpinventoryvw Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpinventoryvwRecords.ErpinventoryvwRec tblrec1 = tblrecs1.getErpinventoryvwRec().get(0); 
		ErpinventoryvwFlds tblflds1 = tblrec1.getErpinventoryvwFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpinventoryvwForm wsForm1 = new ErpinventoryvwForm(); 
		Erpinventoryvw tbl1 = new Erpinventoryvw(); 
		ErpinventoryvwRecords tblrecs1 = new ErpinventoryvwRecords(); 
		ErpinventoryvwRecords.ErpinventoryvwRec tblrec1 = new ErpinventoryvwRecords.ErpinventoryvwRec(); 
		ErpinventoryvwFlds tblflds1 = new ErpinventoryvwFlds(); 
 
		//Invid : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getInvid();  
		//tblflds1.setInvid(); //1234 
		System.out.println("	Invid : " + tblflds1.getInvid() ); 
		//Productid : Java Data Type [long], XML Schema Type [integer]  
		//tblflds1.getProductid();  
		//tblflds1.setProductid(); //1234 
		System.out.println("	Productid : " + tblflds1.getProductid() ); 
		//Productname : Java Data Type [String], XML Schema Type [string]  
		//tblflds1.getProductname();  
		//tblflds1.setProductname(); //ABCD_string 
		System.out.println("	Productname : " + tblflds1.getProductname() ); 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpinventoryvwFlds(tblflds1); 
		tblrecs1.getErpinventoryvwRec().add(tblrec1); 
		tbl1.setErpinventoryvwRecords(tblrecs1); 
		wsForm1.setErpinventoryvw(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpinventoryvwWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpinventoryvwWs wsVar = new ErpinventoryvwWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpinventoryvwWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpinventoryvwWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpinventoryvwWs xmlns:ws1=\"http://emws50.ErpinventoryvwWs/jaxb/ErpinventoryvwWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpinventoryvwWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
