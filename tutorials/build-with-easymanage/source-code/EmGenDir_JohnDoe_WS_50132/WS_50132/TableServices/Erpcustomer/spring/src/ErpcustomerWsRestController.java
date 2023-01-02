package emrest.spring;  
  
import java.lang.*; 
import java.util.*; 
import java.text.*; 
import java.math.*; 
import java.io.*; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.*; 
import javax.xml.bind.*; 
import javax.xml.bind.annotation.XmlType; 
import javax.xml.datatype.*; 
import org.springframework.core.io.Resource; 
import org.springframework.core.io.ByteArrayResource; 
import org.springframework.core.io.UrlResource; 
import org.springframework.http.*; 
import org.springframework.web.multipart.MultipartFile; 
import org.springframework.beans.factory.annotation.Value; 
 
import ErpcustomerWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emrest/JohnDoe/ErpcustomerWs") 
public class ErpcustomerWsRestController {  
	private String message = new String("ErpcustomerWs (Spring): "); 
 
// ------------------------------------------------------------------------------ 
// ---------- Begin: Declarations and lib function for XML Date to java date to fldval string conversion 
// --- Note: Please set values for below as per EM User Profile : Date , Time Input Formats (but in java SimpleDateFormat format) ----  
@Value( "${emDateFmt:MM/d/yyyy}" ) 
private String emDateFmt; 
@Value( "${emTimeFmt:hh:mm:ss aa}" ) 
private String emTimeFmt; 
 
private String emConvXmlCalendarToStr(Calendar dateTime, String dttyp) { 
	String retDate = ""; 
	String dtfmt = emDateFmt; //default is DATE 
	if (dttyp.equals("DATETIME")) { 
		dtfmt = emDateFmt+" "+emTimeFmt; 
	} else if (dttyp.equals("TIME")) { 
		dtfmt = emTimeFmt; 
	} 
 
    try { 
	SimpleDateFormat toEmStrFmt = new SimpleDateFormat(dtfmt); 
	toEmStrFmt.setCalendar(dateTime); 
	retDate = toEmStrFmt.format(dateTime.getTime()); 
	} catch (Exception e) { 
      //e.printStackTrace(); 
   } 
	//System.out.println("Out Str = "+retDate); 
	return retDate; 
} 
//-------- Used by Spring Input Edit methods with json param 
private String[][]	emAddEditRecNoTo_fldvalarr(String RecNo, String[][] p_fldvalarr) { 
Vector<String[]> vec1 = new Vector<String[]>(); 
	vec1.add(new String[] { "EDITRECNO", RecNo } ); 
for (int i=0;i<p_fldvalarr.length;i++) { 
	vec1.add(p_fldvalarr[i]); 
} 
 
return vec1.toArray(new String[vec1.size()][2]); 
} 
private String toEmStr(String inputStr) { 
if (inputStr == null) { return ""; } 
return inputStr; 
} 
private String toEmStrInt(BigInteger inputVal) {  
if (inputVal == null) { return ""; }  
return inputVal.toString();  
}  
private String toEmStrFlt(Float inputVal) {  
if (inputVal == null) { return ""; }  
return Float.toString(inputVal); 
} 
 
// ---------- End: Declarations and lib function for XML Date to java date to fldval string conversion 
// ------------------------------------------------------------------------------ 
 
 
 
 
 
 
	//EM Name + Mode + Qry Opt : ErpcustomerformDisplayAll 
 
@GetMapping("ErpcustomerformDisplayAll")  
	public @ResponseBody ErpcustomerForm ErpcustomerformDisplayAll()  
	throws Exception 
	{  
		ErpcustomerForm wsForm1 = new ErpcustomerForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpcustomerForm","Erpcustomer"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpcustomerWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpcustomerForm) wsVar.getErpcustomerForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpcustomer tbl1 = wsForm1.getErpcustomer(); 
		ErpcustomerRecords tblrecs1 = tbl1.getErpcustomerRecords(); 
		int tblrecs1_Count = tblrecs1.getErpcustomerRec().size(); 
		System.out.println("Count Erpcustomer Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpcustomerRecords.ErpcustomerRec tblrec1 = tblrecs1.getErpcustomerRec().get(0); 
		ErpcustomerFlds tblflds1 = tblrec1.getErpcustomerFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpcustomerForm wsForm1 = new ErpcustomerForm(); 
		Erpcustomer tbl1 = new Erpcustomer(); 
		ErpcustomerRecords tblrecs1 = new ErpcustomerRecords(); 
		ErpcustomerRecords.ErpcustomerRec tblrec1 = new ErpcustomerRecords.ErpcustomerRec(); 
		ErpcustomerFlds tblflds1 = new ErpcustomerFlds(); 
 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpcustomerFlds(tblflds1); 
		tblrecs1.getErpcustomerRec().add(tblrec1); 
		tbl1.setErpcustomerRecords(tblrecs1); 
		wsForm1.setErpcustomer(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpcustomerWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpcustomerWs wsVar = new ErpcustomerWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpcustomerWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpcustomerWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpcustomerWs xmlns:ws1=\"http://emws50.ErpcustomerWs/jaxb/ErpcustomerWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpcustomerWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
