package ErpinventorysumvwWs.service;  
  
import java.lang.*; 
import java.util.*; 
import java.io.*; 
import javax.jws.WebMethod; 
import javax.jws.WebService; 
import javax.xml.bind.*; 
import javax.xml.bind.annotation.XmlType; 
import javax.xml.datatype.*; 
 
import ErpinventorysumvwWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@WebService(name="ErpinventorysumvwWsSvc",serviceName="ErpinventorysumvwWsService",portName="ErpinventorysumvwWsPort",targetNamespace="http://emws50.ErpinventorysumvwWs/jaxws") 
public class ErpinventorysumvwWsWebService { 
	private String message = new String("ErpinventorysumvwWs (jaxws): "); 
 
 
	//EM Name + Mode + Qry Opt : ErpinventorysumvwformDisplayAll 
 
	@WebMethod() 
	public  ErpinventorysumvwForm ErpinventorysumvwformDisplayAll()  
	throws Exception 
	{  
		ErpinventorysumvwForm wsForm1 = new ErpinventorysumvwForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpinventorysumvwForm","Erpinventorysumvw"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpinventorysumvwWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpinventorysumvwForm) wsVar.getErpinventorysumvwForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpinventorysumvw tbl1 = wsForm1.getErpinventorysumvw(); 
		ErpinventorysumvwRecords tblrecs1 = tbl1.getErpinventorysumvwRecords(); 
		int tblrecs1_Count = tblrecs1.getErpinventorysumvwRec().size(); 
		System.out.println("Count Erpinventorysumvw Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpinventorysumvwRecords.ErpinventorysumvwRec tblrec1 = tblrecs1.getErpinventorysumvwRec().get(0); 
		ErpinventorysumvwFlds tblflds1 = tblrec1.getErpinventorysumvwFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpinventorysumvwForm wsForm1 = new ErpinventorysumvwForm(); 
		Erpinventorysumvw tbl1 = new Erpinventorysumvw(); 
		ErpinventorysumvwRecords tblrecs1 = new ErpinventorysumvwRecords(); 
		ErpinventorysumvwRecords.ErpinventorysumvwRec tblrec1 = new ErpinventorysumvwRecords.ErpinventorysumvwRec(); 
		ErpinventorysumvwFlds tblflds1 = new ErpinventorysumvwFlds(); 
 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpinventorysumvwFlds(tblflds1); 
		tblrecs1.getErpinventorysumvwRec().add(tblrec1); 
		tbl1.setErpinventorysumvwRecords(tblrecs1); 
		wsForm1.setErpinventorysumvw(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpinventorysumvwWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpinventorysumvwWs wsVar = new ErpinventorysumvwWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpinventorysumvwWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpinventorysumvwWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpinventorysumvwWs xmlns:ws1=\"http://emws50.ErpinventorysumvwWs/jaxb/ErpinventorysumvwWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpinventorysumvwWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
