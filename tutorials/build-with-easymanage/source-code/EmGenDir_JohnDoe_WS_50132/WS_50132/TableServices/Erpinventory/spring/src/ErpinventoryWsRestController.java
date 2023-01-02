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
 
import ErpinventoryWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emrest/JohnDoe/ErpinventoryWs") 
public class ErpinventoryWsRestController {  
	private String message = new String("ErpinventoryWs (Spring): "); 
 
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
 
 
 
 
 
 
	//EM Name + Mode + Qry Opt : ErpinventoryformDisplayAll 
 
@GetMapping("ErpinventoryformDisplayAll")  
	public @ResponseBody ErpinventoryForm ErpinventoryformDisplayAll()  
	throws Exception 
	{  
		ErpinventoryForm wsForm1 = new ErpinventoryForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpinventoryForm","Erpinventory"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpinventoryWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpinventoryForm) wsVar.getErpinventoryForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpinventory tbl1 = wsForm1.getErpinventory(); 
		ErpinventoryRecords tblrecs1 = tbl1.getErpinventoryRecords(); 
		int tblrecs1_Count = tblrecs1.getErpinventoryRec().size(); 
		System.out.println("Count Erpinventory Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpinventoryRecords.ErpinventoryRec tblrec1 = tblrecs1.getErpinventoryRec().get(0); 
		ErpinventoryFlds tblflds1 = tblrec1.getErpinventoryFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpinventoryForm wsForm1 = new ErpinventoryForm(); 
		Erpinventory tbl1 = new Erpinventory(); 
		ErpinventoryRecords tblrecs1 = new ErpinventoryRecords(); 
		ErpinventoryRecords.ErpinventoryRec tblrec1 = new ErpinventoryRecords.ErpinventoryRec(); 
		ErpinventoryFlds tblflds1 = new ErpinventoryFlds(); 
 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpinventoryFlds(tblflds1); 
		tblrecs1.getErpinventoryRec().add(tblrec1); 
		tbl1.setErpinventoryRecords(tblrecs1); 
		wsForm1.setErpinventory(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpinventoryWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpinventoryWs wsVar = new ErpinventoryWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpinventoryWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpinventoryWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpinventoryWs xmlns:ws1=\"http://emws50.ErpinventoryWs/jaxb/ErpinventoryWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpinventoryWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
