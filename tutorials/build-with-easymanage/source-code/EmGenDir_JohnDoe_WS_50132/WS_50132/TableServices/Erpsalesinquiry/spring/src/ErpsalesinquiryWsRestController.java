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
 
import ErpsalesinquiryWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emrest/JohnDoe/ErpsalesinquiryWs") 
public class ErpsalesinquiryWsRestController {  
	private String message = new String("ErpsalesinquiryWs (Spring): "); 
 
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
 
 
 
 
 
 
	//EM Name + Mode + Qry Opt : ErpsalesinquiryformDisplayAll 
 
@GetMapping("ErpsalesinquiryformDisplayAll")  
	public @ResponseBody ErpsalesinquiryForm ErpsalesinquiryformDisplayAll()  
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
