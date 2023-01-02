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
 
import ErpproductWs.jaxb.*; 
 
import em.*; 
import emb.*; 
import emapi.*; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emrest/JohnDoe/ErpproductWs") 
public class ErpproductWsRestController {  
	private String message = new String("ErpproductWs (Spring): "); 
 
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
 
 
 
 
 
 
	//EM Name + Mode + Qry Opt : ErpproductformDisplayAll 
 
@GetMapping("ErpproductformDisplayAll")  
	public @ResponseBody ErpproductForm ErpproductformDisplayAll()  
	throws Exception 
	{  
		ErpproductForm wsForm1 = new ErpproductForm(); 
 
		/********* Available for WP Scr only, not table 
		WsEmWpExec wpr = new WsEmWpExec("JohnDoe",0,0,0,0,0,"ErpproductForm","Erpproduct"); 
		wpr.procWpReq(); 
		String add_xml_str = addRootXml(wpr.wpex_xml_str); 
		//System.out.println("EM Return Xml: \n"+ add_xml_str); 
		ErpproductWs wsVar = createJavaObjFromXmlStr(add_xml_str); 
		wsForm1 = (ErpproductForm) wsVar.getErpproductForm();  
		*** Available for WP Scr only, not table  *****/
		return wsForm1; 
 
		/******* TO DEFINE YOUR OWN Method, Use Following *** 
		// TO GET Records from wsForm above *** 
		Erpproduct tbl1 = wsForm1.getErpproduct(); 
		ErpproductRecords tblrecs1 = tbl1.getErpproductRecords(); 
		int tblrecs1_Count = tblrecs1.getErpproductRec().size(); 
		System.out.println("Count Erpproduct Records = "+tblrecs1_Count); 
		
		// --------------------------------------------------------------- 
		if (tblrecs1_Count > 0 ) { 
		ErpproductRecords.ErpproductRec tblrec1 = tblrecs1.getErpproductRec().get(0); 
		ErpproductFlds tblflds1 = tblrec1.getErpproductFlds(); 
 		//Now Get ANY Fields/Columns as tblflds1.getFieldName(); 
  
		// TO Construct and SET Record in new wsForm *** 
		ErpproductForm wsForm1 = new ErpproductForm(); 
		Erpproduct tbl1 = new Erpproduct(); 
		ErpproductRecords tblrecs1 = new ErpproductRecords(); 
		ErpproductRecords.ErpproductRec tblrec1 = new ErpproductRecords.ErpproductRec(); 
		ErpproductFlds tblflds1 = new ErpproductFlds(); 
 
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
 
		} // if (tblrecs1_Count > 0 ) 
		// --------------------------------------------------------------- 
 
 
		tblrec1.setErpproductFlds(tblflds1); 
		tblrecs1.getErpproductRec().add(tblrec1); 
		tbl1.setErpproductRecords(tblrecs1); 
		wsForm1.setErpproduct(tbl1); 
		return wsForm1; 
		******* TO DEFINE YOUR OWN Method, Use Above ***/ 
 
	} 
 
 
 
      private ErpproductWs createJavaObjFromXmlStr(String p_xml_str) { 
	  ErpproductWs wsVar = new ErpproductWs();  
        try {  
            JAXBContext jc = JAXBContext.newInstance( "ErpproductWs.jaxb" );  
            Unmarshaller u = jc.createUnmarshaller();  
            JAXBElement<?> wsElement = (JAXBElement<?>)u.unmarshal( new  
					StringReader( p_xml_str ) );  
 		//System.out.println("JAXBElement Name / Declared Type : "+ wsElement.getName() +" / "+ wsElement.getDeclaredType() );   
		wsVar = (ErpproductWs) wsElement.getValue();  
  
        } catch( JAXBException je ) {  
            je.printStackTrace();  
        }  
	  return wsVar; 
     }  
 
      private String addRootXml(String p_str) {      
		String add_xml_str =  
		"<?xml version=\"1.0\" ?> "+"\n"+   
		"<ws1:ErpproductWs xmlns:ws1=\"http://emws50.ErpproductWs/jaxb/ErpproductWs\" >   "+"\n"+ 
		p_str + 
		"</ws1:ErpproductWs>   "+"\n"; 
 		return add_xml_str; 
      } 
 
 
 
} 
