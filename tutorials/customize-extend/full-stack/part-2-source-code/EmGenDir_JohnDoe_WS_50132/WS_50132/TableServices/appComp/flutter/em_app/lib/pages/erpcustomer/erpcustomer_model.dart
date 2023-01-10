import 'dart:convert'; 
 
import 'package:em_app/em_global.dart';  
 
List<ErpCustomer> erpCustomerFromJson(String str) => 
    List<ErpCustomer>.from(json.decode(str).map((x) => ErpCustomer.fromJson(x))); 
 
String erpCustomerToJson(List<ErpCustomer> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); 
 
class ErpCustomer { 
  ErpCustomer({ 
		required this.customerId, 
		this.name, 
		this.phone, 
		this.mobilePhone, 
		this.pict, 
		this.email, 
		this.website, 
		this.address, 
		this.dateofinquiry, 
		this.requestedqty, 
		this.reqquoteamt, 
		this.meetingpreftime, 
		this.created, 
		this.updated, 
  }); 
 
		String customerId; 
		String? name; 
		String? phone; 
		String? mobilePhone; 
		String? pict; 
		String? email; 
		String? website; 
		String? address; 
		String? dateofinquiry; 
		int? requestedqty; 
		double? reqquoteamt; 
		String? meetingpreftime; 
		String? created; 
		String? updated; 
 
  factory ErpCustomer.fromJson(Map<String, dynamic> json) => ErpCustomer( 
		customerId: json["customerId"], 
		name: json["name"], 
		phone: json["phone"], 
		mobilePhone: json["mobilePhone"], 
		pict: json["pict"], 
		email: json["email"], 
		website: json["website"], 
		address: json["address"], 
		dateofinquiry: json["dateofinquiry"], 
		requestedqty: json["requestedqty"], 
		reqquoteamt: json["reqquoteamt"], 
		meetingpreftime: json["meetingpreftime"], 
		created: json["created"], 
		updated: json["updated"], 
      ); 
 
  Map<String, dynamic> toJson() => { 
		"customerId": customerId, 
		"name": name, 
		"phone": phone, 
		"mobilePhone": mobilePhone, 
		"pict": pict, 
		"email": email, 
		"website": website, 
		"address": address, 
		"dateofinquiry": dateofinquiry, 
		"requestedqty": requestedqty, 
		"reqquoteamt": reqquoteamt, 
		"meetingpreftime": meetingpreftime, 
		"created": created, 
		"updated": updated, 
      }; 
 
  Map<String, dynamic> toMapLabelVal() => { 
		"Customer Id": customerId, 
		"Name": name, 
		"Phone": phone, 
		"Mobile Phone": mobilePhone, 
		"Pict": pict, 
		"Email": email, 
		"Website": website, 
		"Address": address, 
		"Dateofinquiry": dateofinquiry, 
		"Requestedqty": requestedqty, 
		"Reqquoteamt": reqquoteamt, 
		"Meetingpreftime": meetingpreftime, 
		"Created": created, 
		"Updated": updated, 
      }; 
 
  List<List<String>> toListLabVal() { 
    List<List<String>> dataSet = []; 
 
    toMapLabelVal().forEach((key, value) { 
      List<String> dataSet1 = []; 
      dataSet1.add(key); 
      dataSet1.add(getKeyValFmt(key,value)); 
      dataSet.add(dataSet1); 
    }); 
    return dataSet; 
  } 
 
 /* ------------------------------------------- 
  Code-Help [CH] : Hide Fields Helper 
 		To Hide Fields From Display ListView And Detail Record 
 		1-Uncomment and USE Below Functions 
 		2-Comment out the fields to hide in 1st function toMapLabelValHide01 below 
 		3-Use them in _data_table.dart and _lib.dart, Find/Replace respective toMapLabelVal() and toListLabVal() 
  ------------------------------------------- */ 
 
 /* 
  Map<String, dynamic> toMapLabelValHide01() => { 
		"Customer Id": customerId, 
		"Name": name, 
		"Phone": phone, 
		"Mobile Phone": mobilePhone, 
		"Pict": pict, 
		"Email": email, 
		"Website": website, 
		"Address": address, 
		"Dateofinquiry": dateofinquiry, 
		"Requestedqty": requestedqty, 
		"Reqquoteamt": reqquoteamt, 
		"Meetingpreftime": meetingpreftime, 
		"Created": created, 
		"Updated": updated, 
      }; 
 
  List<List<String>> toListLabValHide01() { 
    List<List<String>> dataSet = []; 
 
    toMapLabelValHide01().forEach((key, value) { 
      List<String> dataSet1 = []; 
      dataSet1.add(key); 
      dataSet1.add(getKeyValFmt(key,value)); 
      dataSet.add(dataSet1); 
    }); 
    return dataSet; 
  } 
 
 */ 
 
String getKeyValFmt (String? key, dynamic val) { 
String ret = ""; 
        switch(key) { 
        // Num Cur Fmt Columns, if any  
 
        case "Requestedqty": { ret = getEmFmtNumOpt(val); } break;	 
        //case "Reqquoteamt": { ret = getEmFmtCurOpt(val); } break;	 
        default: { 
        ret = val.toString(); 
        } 
        } 
        return ret; 
} 
 
} 
 
// -----------------------------------------------------------------  
//Model For Use in input form dart, when key should not be passed, it is @GeneratedValue on API side  
//Uncomment and Use below 
 
/* 
class ErpCustomerWoKey { 
  ErpCustomerWoKey({ 
	//		required this.customerId, 
		this.name, 
		this.phone, 
		this.mobilePhone, 
		this.pict, 
		this.email, 
		this.website, 
		this.address, 
		this.dateofinquiry, 
		this.requestedqty, 
		this.reqquoteamt, 
		this.meetingpreftime, 
		this.created, 
		this.updated, 
  }); 
 
	//		String customerId; 
		String? name; 
		String? phone; 
		String? mobilePhone; 
		String? pict; 
		String? email; 
		String? website; 
		String? address; 
		String? dateofinquiry; 
		int? requestedqty; 
		double? reqquoteamt; 
		String? meetingpreftime; 
		String? created; 
		String? updated; 
 
  Map<String, dynamic> toJson() => { 
	//		"customerId": customerId, 
		"name": name, 
		"phone": phone, 
		"mobilePhone": mobilePhone, 
		"pict": pict, 
		"email": email, 
		"website": website, 
		"address": address, 
		"dateofinquiry": dateofinquiry, 
		"requestedqty": requestedqty, 
		"reqquoteamt": reqquoteamt, 
		"meetingpreftime": meetingpreftime, 
		"created": created, 
		"updated": updated, 
      }; 
 
} 
*/ 
 
