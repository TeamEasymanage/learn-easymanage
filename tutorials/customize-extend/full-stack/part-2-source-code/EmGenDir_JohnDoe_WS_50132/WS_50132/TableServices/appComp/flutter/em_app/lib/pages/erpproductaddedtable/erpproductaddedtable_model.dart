import 'dart:convert'; 
 
import 'package:em_app/em_global.dart';  
 
List<ErpProductAddedTable> erpProductAddedTableFromJson(String str) => 
    List<ErpProductAddedTable>.from(json.decode(str).map((x) => ErpProductAddedTable.fromJson(x))); 
 
String erpProductAddedTableToJson(List<ErpProductAddedTable> data) => 
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); 
 
class ErpProductAddedTable { 
  ErpProductAddedTable({ 
		required this.productId, 
		this.productName, 
		this.productCategory, 
		this.primarySupplier, 
		this.productDesc, 
		this.productPicture, 
		this.productAddedColumn, 
  }); 
 
		int productId; 
		String? productName; 
		String? productCategory; 
		String? primarySupplier; 
		String? productDesc; 
		String? productPicture; 
		String? productAddedColumn; 
 
  factory ErpProductAddedTable.fromJson(Map<String, dynamic> json) => ErpProductAddedTable( 
		productId: json["productId"], 
		productName: json["productName"], 
		productCategory: json["productCategory"], 
		primarySupplier: json["primarySupplier"], 
		productDesc: json["productDesc"], 
		productPicture: json["productPicture"], 
		productAddedColumn: json["productAddedColumn"], 
      ); 
 
  Map<String, dynamic> toJson() => { 
		"productId": productId, 
		"productName": productName, 
		"productCategory": productCategory, 
		"primarySupplier": primarySupplier, 
		"productDesc": productDesc, 
		"productPicture": productPicture, 
		"productAddedColumn": productAddedColumn, 
      }; 
 
  Map<String, dynamic> toMapLabelVal() => { 
		"Product Id": productId, 
		"Product Name": productName, 
		"Product Category": productCategory, 
		"Primary Supplier": primarySupplier, 
		"Product Desc": productDesc, 
		"Product Picture": productPicture, 
		"Product Added Column": productAddedColumn, 
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
		"Product Id": productId, 
		"Product Name": productName, 
		"Product Category": productCategory, 
		"Primary Supplier": primarySupplier, 
		"Product Desc": productDesc, 
		"Product Picture": productPicture, 
		"Product Added Column": productAddedColumn, 
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
 
        case "Product Id": { ret = getEmFmtNumOpt(val); } break;	 
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
class ErpProductAddedTableWoKey { 
  ErpProductAddedTableWoKey({ 
	//		required this.productId, 
		this.productName, 
		this.productCategory, 
		this.primarySupplier, 
		this.productDesc, 
		this.productPicture, 
		this.productAddedColumn, 
  }); 
 
	//		int productId; 
		String? productName; 
		String? productCategory; 
		String? primarySupplier; 
		String? productDesc; 
		String? productPicture; 
		String? productAddedColumn; 
 
  Map<String, dynamic> toJson() => { 
	//		"productId": productId, 
		"productName": productName, 
		"productCategory": productCategory, 
		"primarySupplier": primarySupplier, 
		"productDesc": productDesc, 
		"productPicture": productPicture, 
		"productAddedColumn": productAddedColumn, 
      }; 
 
} 
*/ 
 
