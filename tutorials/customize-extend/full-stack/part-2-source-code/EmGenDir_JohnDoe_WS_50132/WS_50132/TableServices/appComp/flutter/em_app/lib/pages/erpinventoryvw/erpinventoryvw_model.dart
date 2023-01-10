import 'dart:convert'; 
 
import 'package:em_app/em_global.dart';  
 
List<ErpInventoryVw> erpInventoryVwFromJson(String str) => 
    List<ErpInventoryVw>.from(json.decode(str).map((x) => ErpInventoryVw.fromJson(x))); 
 
String erpInventoryVwToJson(List<ErpInventoryVw> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); 
 
class ErpInventoryVw { 
  ErpInventoryVw({ 
		required this.invId, 
		this.productId, 
		this.productName, 
		this.invDate, 
		this.invQty, 
		this.invMinQty, 
		this.invCost, 
		this.invLocation, 
  }); 
 
		int invId; 
		int? productId; 
		String? productName; 
		String? invDate; 
		int? invQty; 
		int? invMinQty; 
		double? invCost; 
		String? invLocation; 
 
  factory ErpInventoryVw.fromJson(Map<String, dynamic> json) => ErpInventoryVw( 
		invId: json["invId"], 
		productId: json["productId"], 
		productName: json["productName"], 
		invDate: json["invDate"], 
		invQty: json["invQty"], 
		invMinQty: json["invMinQty"], 
		invCost: json["invCost"], 
		invLocation: json["invLocation"], 
      ); 
 
  Map<String, dynamic> toJson() => { 
		"invId": invId, 
		"productId": productId, 
		"productName": productName, 
		"invDate": invDate, 
		"invQty": invQty, 
		"invMinQty": invMinQty, 
		"invCost": invCost, 
		"invLocation": invLocation, 
      }; 
 
  Map<String, dynamic> toMapLabelVal() => { 
		"Inv Id": invId, 
		"Product Id": productId, 
		"Product Name": productName, 
		"Inv Date": invDate, 
		"Inv Qty": invQty, 
		"Inv Min Qty": invMinQty, 
		"Inv Cost": invCost, 
		"Inv Location": invLocation, 
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
 
  Map<String, dynamic> toMapLabelValHide01() => { 
		"Inv Id": invId, 
//		"Product Id": productId, 
		"Product Name": productName, 
		"Inv Date": invDate, 
		"Inv Qty": invQty, 
		"Inv Min Qty": invMinQty, 
		"Inv Cost": invCost, 
		"Inv Location": invLocation, 
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
 
 
String getKeyValFmt (String? key, dynamic val) { 
String ret = ""; 
        switch(key) { 
        // Num Cur Fmt Columns, if any  
 
        case "Inv Id": { ret = getEmFmtNumOpt(val); } break;	 
        case "Product Id": { ret = getEmFmtNumOpt(val); } break;	 
        case "Inv Qty": { ret = getEmFmtNumOpt(val); } break;	 
        case "Inv Min Qty": { ret = getEmFmtNumOpt(val); } break;	 
        //case "Inv Cost": { ret = getEmFmtCurOpt(val); } break;	 
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
class ErpInventoryVwWoKey { 
  ErpInventoryVwWoKey({ 
	//		required this.invId, 
		this.productId, 
		this.productName, 
		this.invDate, 
		this.invQty, 
		this.invMinQty, 
		this.invCost, 
		this.invLocation, 
  }); 
 
	//		int invId; 
		int? productId; 
		String? productName; 
		String? invDate; 
		int? invQty; 
		int? invMinQty; 
		double? invCost; 
		String? invLocation; 
 
  Map<String, dynamic> toJson() => { 
	//		"invId": invId, 
		"productId": productId, 
		"productName": productName, 
		"invDate": invDate, 
		"invQty": invQty, 
		"invMinQty": invMinQty, 
		"invCost": invCost, 
		"invLocation": invLocation, 
      }; 
 
} 
*/ 
 
