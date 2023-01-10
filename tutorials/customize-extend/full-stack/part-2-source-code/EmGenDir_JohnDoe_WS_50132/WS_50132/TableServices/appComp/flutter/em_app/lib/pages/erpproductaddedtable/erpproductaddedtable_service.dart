// ignore_for_file: avoid_print 
 
import 'dart:async'; 
import 'dart:convert'; 
 
import 'package:graphql/client.dart'; 
import 'package:http/http.dart' as http; 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpproductaddedtable/erpproductaddedtable_model.dart'; 
 
class ErpProductAddedTableService { 
  //ViewAll api call 
  static Future ErpProductAddedTableViewAll( 
	  int pageNo 
  	 ) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      Map<String, String> parameters = { 
        'pageNo' : pageNo.toString() 
      };  
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/ViewAll"  
      		, parameters 
          ), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpProductAddedTableViewAll Get call Success ..."); 
        List<ErpProductAddedTable> getList = erpProductAddedTableFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpProductAddedTableViewAll Get call No Data ..."); 
        List<ErpProductAddedTable> getList = []; 
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
 
    String queryName = "ErpproductaddedtableTblRecViewAll"; 
    String queryParam = ""; 
 
    if (pageNo >= 0 ) { 
      queryName = queryName+"Paged"; 
      queryParam = "(page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
 
	/* ------ SelectWhere Query ----------- (Uncomment to Use)  
    if (pageNo >= 0 ) { 
      queryName = "ErpproductaddedtableTblRecSelectWhere"; 
      queryParam = "(searchBy: \"  productId = 10 \" , page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
	 */ 
 
    if (isGrqlUseNoPkgForViewAllQry == false) { 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			productId  	  
			productName  	  
			productCategory  	  
			primarySupplier  	  
			productDesc  	  
			productPicture  	  
			productAddedColumn  	  
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
        print("API ErpProductAddedTableViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpProductAddedTable> getList =       
      List<ErpProductAddedTable>.from(result.data![queryName].map((x) => 
            ErpProductAddedTable.fromJson(json.decode(json.encode(x).toString())))); 
 
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
    r'''{"query":"{\t\n\t''' +queryName+' '+queryParam+ r''' { \n\t  productId , \n\t  productName , \n\t  productCategory , \n\t  primarySupplier , \n\t  productDesc , \n\t  productPicture , \n\t  productAddedColumn , \n\t  \n\t} \n}"}'''; 
 
      Uri uri = getEmUri(apiUrlGrql, apiGrqlPathPrefix);  
 
       final response = await http.post(uri,  
          body: query, headers: getEmApiHeadersCU());  
 
        String procBody = response.body; 
 
        //print(procBody.toString()); 
 
        if (procBody.startsWith('{"errors":')) { 
          print("API ErpProductAddedTableViewAll No G-Pkg Call - Got Errors"); 
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
        print("API ErpProductAddedTableViewAll No G-Pkg call Success ...");  
        List<ErpProductAddedTable> getList =       
        List<ErpProductAddedTable>.from(json.decode(procBody)['data'][queryName].map((x) => 
            ErpProductAddedTable.fromJson(json.decode(json.encode(x).toString())))); 
        return getList;  
        } else {  
        print("API ErpProductAddedTableViewAll Get call No Data ...");  
        List<ErpProductAddedTable> getList = [];  
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
 
  static Future ErpProductAddedTableSelectWhere( 
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
          getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/SelectWhere", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        print("API ErpProductAddedTableSelectWhere Get call Success ..."); 
        List<ErpProductAddedTable> getList = erpProductAddedTableFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpProductAddedTableSelectWhere Get call No Data ..."); 
        List<ErpProductAddedTable> getList = []; 
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
 
    String queryName = "ErpproductaddedtableTblRecSelectWhere"; 
    String queryParam = "(searchBy: \""+searchFilter.toString()+"\", sortBy: \""+sortBy.toString()+"\", page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")";  
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			productId  	  
			productName  	  
			productCategory  	  
			primarySupplier  	  
			productDesc  	  
			productPicture  	  
			productAddedColumn  	  
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
        print("API ErpProductAddedTableViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpProductAddedTable> getList =       
      List<ErpProductAddedTable>.from(result.data![queryName].map((x) => 
            ErpProductAddedTable.fromJson(json.decode(json.encode(x).toString())))); 
 
      //print("Step-2"); 
 
      return getList;  
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
 
/* 
  static Future ErpProductAddedTableFindByColumnName(String columnName) async { 
    try { 
      //print(columnName); 
      Map<String, String> parameters = {'columnName': columnName}; 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/FindByColumnName", parameters), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpProductAddedTableFindByColumnName Get call Success ..."); 
        List<ErpProductAddedTable> getList = erpProductAddedTableFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpProductAddedTableFindByColumnName Get call No Data ..."); 
        List<ErpProductAddedTable> getList = []; 
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
  static Future ErpProductAddedTableViewAllIds() async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/ViewAll"), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        List<ErpProductAddedTable> getList = erpProductAddedTableFromJson(response.body); 
        List<String> productIdList = 
            getList.map((e) => e.productId.toString()).toList(); 
        return productIdList; 
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
 
    String queryName = "ErpproductaddedtableTblRecViewAll"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
      productId   
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
        print("API ErpProductAddedTableViewAllIds G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableViewAllIds G-Pkg Get call Success ...");  
      } 
 
      List<ErpProductAddedTable> getList =       
      List<ErpProductAddedTable>.from(result.data![queryName].map((x) => 
            ErpProductAddedTable.fromJson(json.decode(json.encode(x).toString())))); 
 
        List<String> productIdList = 
            getList.map((e) => e.productId.toString()).toList(); 
        return productIdList; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  //Get a single ErpProductAddedTable by QUERY method 
  static Future ErpProductAddedTableQuery(int productId) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      print(productId); 
      Map<String, String> parameters = {'productId': productId.toString()}; 
      final response = await http.get( 
          getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/Query", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        List<ErpProductAddedTable> foundErpProductAddedTable = erpProductAddedTableFromJson(response.body); 
        ErpProductAddedTable newErpProductAddedTable = foundErpProductAddedTable.elementAt(0); 
        return newErpProductAddedTable; 
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
 
    String queryName = "ErpproductaddedtableTblRecQuery"; 
    String queryParam = "(productId: "+jsonEncode(productId)+" )"; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			productId  	  
			productName  	  
			productCategory  	  
			primarySupplier  	  
			productDesc  	  
			productPicture  	  
			productAddedColumn  	  
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
        print("API ErpProductAddedTableQuery G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableQuery G-Pkg Get call Success ...");  
      } 
 
      List<ErpProductAddedTable> getList =       
      List<ErpProductAddedTable>.from(result.data![queryName].map((x) => 
            ErpProductAddedTable.fromJson(json.decode(json.encode(x).toString())))); 
 
        ErpProductAddedTable newErpProductAddedTable = getList.elementAt(0); 
        return newErpProductAddedTable; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  static Future ErpProductAddedTableCreate(Map newErpProductAddedTable) async { 
 
      if (isApiUseGrql == false) { 
 
    Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/Create"); 
    //Map<String, String> headers = {'Content-Type': 'application/json'}; 
    try { 
      final response = await http.post(uri, 
          body: jsonEncode(newErpProductAddedTable), headers: getEmApiHeadersCU()); 
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
 
    String queryName = "ErpproductaddedtableTblRecCreate"; 
    String queryParam = jsonEncode(newErpProductAddedTable); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (ErpproductaddedtableTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			productId  	  
			productName  	  
			productCategory  	  
			primarySupplier  	  
			productDesc  	  
			productPicture  	  
			productAddedColumn  	  
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
        print("API ErpProductAddedTableCreate G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableCreate G-Pkg call Success ...");  
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
  static Future ErpProductAddedTableEdit( 	
	      int productId, ErpProductAddedTable erpProductAddedTable) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(productId); 	
		  Map<String, String> parameters = {'productId': productId.toString()}; 
    	Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_product_added_table/Update", parameters); 
    	//Map<String, String> headers = {'Content-Type': 'application/json'}; 
      	final response = await http.put(uri, 
          body: jsonEncode(erpProductAddedTable), headers: getEmApiHeadersCU()); 
	 	
	      final status = response.statusCode; 	
	      if (status == 200) { 	
	        /* 	
	        List<ErpProductAddedTable> foundErpProductAddedTable = 	
	            erpProductAddedTableFromJson(response.body); 	
	        ErpProductAddedTable newErpProductAddedTable = 	
	            foundErpProductAddedTable.elementAt(0); 	
	        return newErpProductAddedTable; 	
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
 
    String queryName = "ErpproductaddedtableTblRecUpdate"; 
    String queryParam = jsonEncode(erpProductAddedTable); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (productId: '+jsonEncode(productId)+' , ErpproductaddedtableTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			productId  	  
			productName  	  
			productCategory  	  
			primarySupplier  	  
			productDesc  	  
			productPicture  	  
			productAddedColumn  	  
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
        print("API ErpProductAddedTableEdit G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableEdit G-Pkg call Success ...");  
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
	  static Future ErpProductAddedTableDelete(int productId) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(productId); 	
		  Map<String, String> parameters = {'productId': productId.toString()}; 
	      final response = await http.delete(getEmUri( 	
	          apiUrl, apiPathPrefix + "/erp_product_added_table/Delete", parameters), headers: getEmApiHeaders()); 	
	 	
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
 
    String queryName = "ErpproductaddedtableTblRecDelete"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (productId: '+jsonEncode(productId)+' '  
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
        print("API ErpProductAddedTableDelete G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpProductAddedTableDelete G-Pkg call Success ...");  
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
 
