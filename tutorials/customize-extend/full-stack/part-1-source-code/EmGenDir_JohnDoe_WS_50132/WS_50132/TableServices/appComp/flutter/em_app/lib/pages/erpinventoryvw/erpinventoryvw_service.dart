// ignore_for_file: avoid_print 
 
import 'dart:async'; 
import 'dart:convert'; 
 
import 'package:graphql/client.dart'; 
import 'package:http/http.dart' as http; 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_model.dart'; 
 
class ErpInventoryVwService { 
  //ViewAll api call 
  static Future ErpInventoryVwViewAll( 
	  int pageNo 
  	 ) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      Map<String, String> parameters = { 
        'pageNo' : pageNo.toString() 
      };  
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/ViewAll"  
      		, parameters 
          ), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpInventoryVwViewAll Get call Success ..."); 
        List<ErpInventoryVw> getList = erpInventoryVwFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpInventoryVwViewAll Get call No Data ..."); 
        List<ErpInventoryVw> getList = []; 
        return getList; 
      } else { 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecViewAll"; 
    String queryParam = ""; 
 
    if (pageNo >= 0 ) { 
      queryName = queryName+"Paged"; 
      queryParam = "(page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
 
	/* ------ SelectWhere Query ----------- (Uncomment to Use)  
    if (pageNo >= 0 ) { 
      queryName = "ErpinventoryvwTblRecSelectWhere"; 
      queryParam = "(searchBy: \"  invId = 10 \" , page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
	 */ 
 
    if (isGrqlUseNoPkgForViewAllQry == false) { 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			invId  	  
			productId  	  
			productName  	  
			invDate  	  
			invQty  	  
			invMinQty  	  
			invCost  	  
			invLocation  	  
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final QueryOptions options = QueryOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.query(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpInventoryVw> getList =       
      List<ErpInventoryVw>.from(result.data![queryName].map((x) => 
            ErpInventoryVw.fromJson(json.decode(json.encode(x).toString())))); 
 
      //print("Step-2"); 
 
      return getList;  
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
 
    } else { 
 
      // ---------- Grql without package graphql 
    try {  
 
    String query = 
    r'''{"query":"{\t\n\t''' +queryName+' '+queryParam+ r''' { \n\t  invId , \n\t  productId , \n\t  productName , \n\t  invDate , \n\t  invQty , \n\t  invMinQty , \n\t  invCost , \n\t  invLocation , \n\t  \n\t} \n}"}'''; 
 
      Uri uri = getEmUri(apiUrlGrql, apiGrqlPathPrefix);  
 
       final response = await http.post(uri,  
          body: query, headers: getEmApiHeadersCU());  
 
        String procBody = response.body; 
 
        //print(procBody.toString()); 
 
        if (procBody.startsWith('{"errors":')) { 
          print("API ErpInventoryVwViewAll No G-Pkg Call - Got Errors"); 
          return "Error: " + procBody; 
        } 
 
        /* 
        String toRemove = '{"data":{"'+queryName+'":'; 
        //dynamic procBody = json['data'][queryName]; 
        if (procBody != null && procBody.length > toRemove.length) { 
          procBody = procBody.replaceFirst(toRemove,""); 
          procBody = procBody.substring(0, procBody.length - 2); 
        } 
 
        final dataMap = json.decode(procBody); 
        final objMap = dataMap['data'][queryName]; 
        print("--------------------------------------------------------------"); 
        print(dataMap); 
        print("--------------------------------------------------------------"); 
        print(objMap); 
 
        //print("--------------------------------------------------------------"); 
        //print(procBody.toString()); 
        //print(jsonDecode(response.body)['data'][queryName]); 
 
        */ 
 
      if (response.statusCode == 200) {  
        if (response.body.startsWith('{"data":')) { 
        print("API ErpInventoryVwViewAll No G-Pkg call Success ...");  
        List<ErpInventoryVw> getList =       
        List<ErpInventoryVw>.from(json.decode(procBody)['data'][queryName].map((x) => 
            ErpInventoryVw.fromJson(json.decode(json.encode(x).toString())))); 
        return getList;  
        } else {  
        print("API ErpInventoryVwViewAll Get call No Data ...");  
        List<ErpInventoryVw> getList = [];  
        return getList;  
        } 
      } else {  
        return "Error: " +  
            response.statusCode.toString() + " ( " +  
            response.reasonPhrase.toString() +  
            " ) occured!";  
      }  
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
    } //no use pkg 
 
    } //rest or gql 
 
  } 
 
  static Future ErpInventoryVwSelectWhere( 
	  int pageNo 
    , String searchFilter  
    , String sortBy  
  	 ) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      Map<String, String> parameters = { 
        'searchBy': searchFilter,  
        'sortBy': sortBy, 
        'page': pageNo.toString(), 
        'size': apiPageSize.toString() 
        };  
 
      final response = await http.get( 
          getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/SelectWhere", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        print("API ErpInventoryVwSelectWhere Get call Success ..."); 
        List<ErpInventoryVw> getList = erpInventoryVwFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpInventoryVwSelectWhere Get call No Data ..."); 
        List<ErpInventoryVw> getList = []; 
        return getList; 
      } else { 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecSelectWhere"; 
    String queryParam = "(searchBy: \""+searchFilter.toString()+"\", sortBy: \""+sortBy.toString()+"\", page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")";  
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			invId  	  
			productId  	  
			productName  	  
			invDate  	  
			invQty  	  
			invMinQty  	  
			invCost  	  
			invLocation  	  
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final QueryOptions options = QueryOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.query(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpInventoryVw> getList =       
      List<ErpInventoryVw>.from(result.data![queryName].map((x) => 
            ErpInventoryVw.fromJson(json.decode(json.encode(x).toString())))); 
 
      //print("Step-2"); 
 
      return getList;  
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
 
/* 
  static Future ErpInventoryVwFindByColumnName(String columnName) async { 
    try { 
      //print(columnName); 
      Map<String, String> parameters = {'columnName': columnName}; 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/FindByColumnName", parameters), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpInventoryVwFindByColumnName Get call Success ..."); 
        List<ErpInventoryVw> getList = erpInventoryVwFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpInventoryVwFindByColumnName Get call No Data ..."); 
        List<ErpInventoryVw> getList = []; 
        return getList; 
      } else { 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
  } 
*/ 
 
  //Returns a list of ids from the api using GET method. 
  static Future ErpInventoryVwViewAllIds() async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/ViewAll"), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        List<ErpInventoryVw> getList = erpInventoryVwFromJson(response.body); 
        List<String> invIdList = 
            getList.map((e) => e.invId.toString()).toList(); 
        return invIdList; 
      } else { 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecViewAll"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
      invId   
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final QueryOptions options = QueryOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.query(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwViewAllIds G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwViewAllIds G-Pkg Get call Success ...");  
      } 
 
      List<ErpInventoryVw> getList =       
      List<ErpInventoryVw>.from(result.data![queryName].map((x) => 
            ErpInventoryVw.fromJson(json.decode(json.encode(x).toString())))); 
 
        List<String> invIdList = 
            getList.map((e) => e.invId.toString()).toList(); 
        return invIdList; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  //Get a single ErpInventoryVw by QUERY method 
  static Future ErpInventoryVwQuery(int invId) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      print(invId); 
      Map<String, String> parameters = {'invId': invId.toString()}; 
      final response = await http.get( 
          getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/Query", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        List<ErpInventoryVw> foundErpInventoryVw = erpInventoryVwFromJson(response.body); 
        ErpInventoryVw newErpInventoryVw = foundErpInventoryVw.elementAt(0); 
        return newErpInventoryVw; 
      } else { 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecQuery"; 
    String queryParam = "(invId: "+jsonEncode(invId)+" )"; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			invId  	  
			productId  	  
			productName  	  
			invDate  	  
			invQty  	  
			invMinQty  	  
			invCost  	  
			invLocation  	  
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final QueryOptions options = QueryOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.query(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwQuery G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwQuery G-Pkg Get call Success ...");  
      } 
 
      List<ErpInventoryVw> getList =       
      List<ErpInventoryVw>.from(result.data![queryName].map((x) => 
            ErpInventoryVw.fromJson(json.decode(json.encode(x).toString())))); 
 
        ErpInventoryVw newErpInventoryVw = getList.elementAt(0); 
        return newErpInventoryVw; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  static Future ErpInventoryVwCreate(Map newErpInventoryVw) async { 
 
      if (isApiUseGrql == false) { 
 
    Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/Create"); 
    //Map<String, String> headers = {'Content-Type': 'application/json'}; 
    try { 
      final response = await http.post(uri, 
          body: jsonEncode(newErpInventoryVw), headers: getEmApiHeadersCU()); 
      final status = response.statusCode; 
      if (status == 200 || status == 201) { 
        print("Inside Create try  Block"); 
        return "Record Added Successfully"; 
      } else { 
        print("Error while posting data $status "); 
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
      } 
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecCreate"; 
    String queryParam = jsonEncode(newErpInventoryVw); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (ErpinventoryvwTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			invId  	  
			productId  	  
			productName  	  
			invDate  	  
			invQty  	  
			invMinQty  	  
			invCost  	  
			invLocation  	  
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final MutationOptions options = MutationOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.mutate(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwCreate G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwCreate G-Pkg call Success ...");  
        return "Record Added Successfully"; 
      } 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
  //Call Edit Record API 	
  static Future ErpInventoryVwEdit( 	
	      int invId, ErpInventoryVw erpInventoryVw) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(invId); 	
		  Map<String, String> parameters = {'invId': invId.toString()}; 
    	Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_inventory_vw/Update", parameters); 
    	//Map<String, String> headers = {'Content-Type': 'application/json'}; 
      	final response = await http.put(uri, 
          body: jsonEncode(erpInventoryVw), headers: getEmApiHeadersCU()); 
	 	
	      final status = response.statusCode; 	
	      if (status == 200) { 	
	        /* 	
	        List<ErpInventoryVw> foundErpInventoryVw = 	
	            erpInventoryVwFromJson(response.body); 	
	        ErpInventoryVw newErpInventoryVw = 	
	            foundErpInventoryVw.elementAt(0); 	
	        return newErpInventoryVw; 	
	        */ 	
	        return "Record Updated Successfully"; 	
	      } else { 	
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
	      } 	
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecUpdate"; 
    String queryParam = jsonEncode(erpInventoryVw); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (invId: '+jsonEncode(invId)+' , ErpinventoryvwTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			invId  	  
			productId  	  
			productName  	  
			invDate  	  
			invQty  	  
			invMinQty  	  
			invCost  	  
			invLocation  	  
      } 
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final MutationOptions options = MutationOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.mutate(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwEdit G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwEdit G-Pkg call Success ...");  
	        return "Record Updated Successfully"; 	
      } 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
	 } 	
	 	
	  //Call Delete Record API 	
	  static Future ErpInventoryVwDelete(int invId) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(invId); 	
		  Map<String, String> parameters = {'invId': invId.toString()}; 
	      final response = await http.delete(getEmUri( 	
	          apiUrl, apiPathPrefix + "/erp_inventory_vw/Delete", parameters), headers: getEmApiHeaders()); 	
	 	
	      final status = response.statusCode; 	
	      if (status == 200) { 	
	        //int delCount = response.body.delCount; 	
	        return "Record Deleted Successfully"; 	
	      } else { 	
        return "Error: " + 
            response.statusCode.toString() + " ( " + 
            response.reasonPhrase.toString() + 
            " ) occured!"; 
	      } 	
    } catch (err) { 
      print(err);  
      return connErrStr + " ( " + err.toString() + " ) "; 
    } 
	   	 
      } else { 
 
  // ---------------- Grql ----------------- 
 
    String queryName = "ErpinventoryvwTblRecDelete"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (invId: '+jsonEncode(invId)+' '  
			+ r''' )   
      } 
      '''; 
 
      //print(query); 
 
      GraphQLClient client = EmGraphQLClient().getClient(); 
 
      final MutationOptions options = MutationOptions( 
        document: gql(query), 
      ); 
 
      //print("Step-1"); 
 
      final QueryResult result = await client.mutate(options); 
 
      //print(result); 
      //print("------------------------------------------------------------"); 
 
      if (result.hasException) { 
        print("API ErpInventoryVwDelete G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpInventoryVwDelete G-Pkg call Success ...");  
	        return "Record Deleted Successfully"; 	
      } 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
	 } 	
} 
 
