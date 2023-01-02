package ErpsalesinquiryWs.service;  
  
import java.lang.*; 
import java.util.*; 
import java.io.*; 
import javax.jws.WebMethod; 
import javax.jws.WebService; 
import javax.xml.bind.*; 
import javax.xml.bind.annotation.XmlType; 
import javax.xml.datatype.*; 
 
import ErpsalesinquiryWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@WebService(name="ErpsalesinquiryWsSvc",serviceName="ErpsalesinquiryWsService",portName="ErpsalesinquiryWsPort",targetNamespace="http://emws50.ErpsalesinquiryWs/jaxws") 
public class ErpsalesinquiryWsWebService { 
	private String message = new String("ErpsalesinquiryWs (jaxws): "); 
 
 
	//EM Name + Mode + Qry Opt : ErpsalesinquiryformDisplayAll 
 
	@WebMethod() 
	public  ErpsalesinquiryForm ErpsalesinquiryformDisplayAll()  
	throws Exception 
	{  
		ErpsalesinquiryForm wsForm1 = new ErpsalesinquiryForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpsalesinquiryForm","Erpsalesinquiry"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpsalesinquiryWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpsalesinquiryForm) wsVar.getErpsalesinquiryForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpsalesinquiry tbl1 = wsForm1.getErpsalesinquiry(); 
		ErpsalesinquiryRecords tblrecs1 = tbl1.getErpsalesinquiryRecords(); 
		int tblrecs1_Count = tblrecs1.getErpsalesinquiryRec().size(); 
		System.out.println("Count Erpsalesinquiry Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpsalesinquiryRecords.ErpsalesinquiryRec tblrec1 = tblrecs1.getErpsalesinquiryRec().get(0); 
		ErpsalesinquiryFlds tblflds1 = tblrec1.getErpsalesinquiryFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpsalesinquiryForm wsForm1 = new ErpsalesinquiryForm(); 
		Erpsalesinquiry tbl1 = new Erpsalesinquiry(); 
		ErpsalesinquiryRecords tblrecs1 = new ErpsalesinquiryRecords(); 
		ErpsalesinquiryRecords.ErpsalesinquiryRec tblrec1 = new ErpsalesinquiryRecords.ErpsalesinquiryRec(); 
		ErpsalesinquiryFlds tblflds1 = new ErpsalesinquiryFlds(); 
 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpsalesinquiryFlds(tblflds1); 
		tblrecs1.getErpsalesinquiryRec().add(tblrec1); 
		tbl1.setErpsalesinquiryRecords(tblrecs1); 
		wsForm1.setErpsalesinquiry(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpsalesinquiryWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpsalesinquiryWs wsVar = new ErpsalesinquiryWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpsalesinquiryWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpsalesinquiryWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpsalesinquiryWs xmlns:ws1=\"http://emws50.ErpsalesinquiryWs/jaxb/ErpsalesinquiryWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpsalesinquiryWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
