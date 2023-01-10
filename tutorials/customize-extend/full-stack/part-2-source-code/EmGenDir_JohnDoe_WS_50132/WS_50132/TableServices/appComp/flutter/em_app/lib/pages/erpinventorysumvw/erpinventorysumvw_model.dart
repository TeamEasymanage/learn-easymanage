import 'dart:convert'; 
 
import 'package:em_app/em_global.dart';  
 
List<ErpInventorySumVw> erpInventorySumVwFromJson(String str) => 
    List<ErpInventorySumVw>.from(json.decode(str).map((x) => ErpInventorySumVw.fromJson(x))); 
 
String erpInventorySumVwToJson(List<ErpInventorySumVw> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); 
 
class ErpInventorySumVw { 
  ErpInventorySumVw({ 
		required this.year, 
		this.month, 
		this.totalQty, 
  }); 
 
		int year; 
		int? month; 
		double? totalQty; 
 
  factory ErpInventorySumVw.fromJson(Map<String, dynamic> json) => ErpInventorySumVw( 
		year: json["year"], 
		month: json["month"], 
		totalQty: json["totalQty"], 
      ); 
 
  Map<String, dynamic> toJson() => { 
		"year": year, 
		"month": month, 
		"totalQty": totalQty, 
      }; 
 
  Map<String, dynamic> toMapLabelVal() => { 
		"Year": year, 
		"Month": month, 
		"Total Qty": totalQty, 
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
		"Year": year, 
		"Month": month, 
		"Total Qty": totalQty, 
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
 
        case "Year": { ret = getEmFmtNumOpt(val); } break;	 
        case "Month": { ret = getEmFmtNumOpt(val); } break;	 
        //case "Total Qty": { ret = getEmFmtCurOpt(val); } break;	 
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
class ErpInventorySumVwWoKey { 
  ErpInventorySumVwWoKey({ 
	//		required this.year, 
		this.month, 
		this.totalQty, 
  }); 
 
	//		int year; 
		int? month; 
		double? totalQty; 
 
  Map<String, dynamic> toJson() => { 
	//		"year": year, 
		"month": month, 
		"totalQty": totalQty, 
      }; 
 
} 
*/ 
 
