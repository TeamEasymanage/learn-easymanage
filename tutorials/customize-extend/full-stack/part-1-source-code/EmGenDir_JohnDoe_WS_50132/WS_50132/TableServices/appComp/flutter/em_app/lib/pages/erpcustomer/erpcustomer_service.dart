// ignore_for_file: avoid_print 
 
import 'dart:async'; 
import 'dart:convert'; 
 
import 'package:graphql/client.dart'; 
import 'package:http/http.dart' as http; 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_model.dart'; 
 
class ErpCustomerService { 
  //ViewAll api call 
  static Future ErpCustomerViewAll( 
	  int pageNo 
  	 ) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      Map<String, String> parameters = { 
        'pageNo' : pageNo.toString() 
      };  
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_customer/ViewAll"  
      		, parameters 
          ), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpCustomerViewAll Get call Success ..."); 
        List<ErpCustomer> getList = erpCustomerFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpCustomerViewAll Get call No Data ..."); 
        List<ErpCustomer> getList = []; 
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
 
    String queryName = "ErpcustomerTblRecViewAll"; 
    String queryParam = ""; 
 
    if (pageNo >= 0 ) { 
      queryName = queryName+"Paged"; 
      queryParam = "(page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
 
	/* ------ SelectWhere Query ----------- (Uncomment to Use)  
    if (pageNo >= 0 ) { 
      queryName = "ErpcustomerTblRecSelectWhere"; 
      queryParam = "(searchBy: \"  customerId = 10 \" , page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")"; 
    } 
	 */ 
 
    if (isGrqlUseNoPkgForViewAllQry == false) { 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			customerId  	  
			name  	  
			phone  	  
			mobilePhone  	  
			pict  	  
			email  	  
			website  	  
			address  	  
			dateofinquiry  	  
			requestedqty  	  
			reqquoteamt  	  
			meetingpreftime  	  
			created  	  
			updated  	  
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
        print("API ErpCustomerViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpCustomer> getList =       
      List<ErpCustomer>.from(result.data![queryName].map((x) => 
            ErpCustomer.fromJson(json.decode(json.encode(x).toString())))); 
 
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
    r'''{"query":"{\t\n\t''' +queryName+' '+queryParam+ r''' { \n\t  customerId , \n\t  name , \n\t  phone , \n\t  mobilePhone , \n\t  pict , \n\t  email , \n\t  website , \n\t  address , \n\t  dateofinquiry , \n\t  requestedqty , \n\t  reqquoteamt , \n\t  meetingpreftime , \n\t  created , \n\t  updated , \n\t  \n\t} \n}"}'''; 
 
      Uri uri = getEmUri(apiUrlGrql, apiGrqlPathPrefix);  
 
       final response = await http.post(uri,  
          body: query, headers: getEmApiHeadersCU());  
 
        String procBody = response.body; 
 
        //print(procBody.toString()); 
 
        if (procBody.startsWith('{"errors":')) { 
          print("API ErpCustomerViewAll No G-Pkg Call - Got Errors"); 
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
        print("API ErpCustomerViewAll No G-Pkg call Success ...");  
        List<ErpCustomer> getList =       
        List<ErpCustomer>.from(json.decode(procBody)['data'][queryName].map((x) => 
            ErpCustomer.fromJson(json.decode(json.encode(x).toString())))); 
        return getList;  
        } else {  
        print("API ErpCustomerViewAll Get call No Data ...");  
        List<ErpCustomer> getList = [];  
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
 
  static Future ErpCustomerSelectWhere( 
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
          getEmUri(apiUrl, apiPathPrefix + "/erp_customer/SelectWhere", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        print("API ErpCustomerSelectWhere Get call Success ..."); 
        List<ErpCustomer> getList = erpCustomerFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpCustomerSelectWhere Get call No Data ..."); 
        List<ErpCustomer> getList = []; 
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
 
    String queryName = "ErpcustomerTblRecSelectWhere"; 
    String queryParam = "(searchBy: \""+searchFilter.toString()+"\", sortBy: \""+sortBy.toString()+"\", page: "+pageNo.toString()+", size: "+apiPageSize.toString()+")";  
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			customerId  	  
			name  	  
			phone  	  
			mobilePhone  	  
			pict  	  
			email  	  
			website  	  
			address  	  
			dateofinquiry  	  
			requestedqty  	  
			reqquoteamt  	  
			meetingpreftime  	  
			created  	  
			updated  	  
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
        print("API ErpCustomerViewAll G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerViewAll G-Pkg Get call Success ...");  
      } 
 
      List<ErpCustomer> getList =       
      List<ErpCustomer>.from(result.data![queryName].map((x) => 
            ErpCustomer.fromJson(json.decode(json.encode(x).toString())))); 
 
      //print("Step-2"); 
 
      return getList;  
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
 
/* 
  static Future ErpCustomerFindByColumnName(String columnName) async { 
    try { 
      //print(columnName); 
      Map<String, String> parameters = {'columnName': columnName}; 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_customer/FindByColumnName", parameters), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        print("API ErpCustomerFindByColumnName Get call Success ..."); 
        List<ErpCustomer> getList = erpCustomerFromJson(response.body); 
        return getList; 
      } else if (response.statusCode == 204) { 
        print("API ErpCustomerFindByColumnName Get call No Data ..."); 
        List<ErpCustomer> getList = []; 
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
  static Future ErpCustomerViewAllIds() async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      final response = await http 
          .get(getEmUri(apiUrl, apiPathPrefix + "/erp_customer/ViewAll"), headers: getEmApiHeaders()); 
      if (response.statusCode == 200) { 
        List<ErpCustomer> getList = erpCustomerFromJson(response.body); 
        List<String> customerIdList = 
            getList.map((e) => e.customerId.toString()).toList(); 
        return customerIdList; 
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
 
    String queryName = "ErpcustomerTblRecViewAll"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
      customerId   
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
        print("API ErpCustomerViewAllIds G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerViewAllIds G-Pkg Get call Success ...");  
      } 
 
      List<ErpCustomer> getList =       
      List<ErpCustomer>.from(result.data![queryName].map((x) => 
            ErpCustomer.fromJson(json.decode(json.encode(x).toString())))); 
 
        List<String> customerIdList = 
            getList.map((e) => e.customerId.toString()).toList(); 
        return customerIdList; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  //Get a single ErpCustomer by QUERY method 
  static Future ErpCustomerQuery(String customerId) async { 
 
      if (isApiUseGrql == false) { 
 
    try { 
      print(customerId); 
      Map<String, String> parameters = {'customerId': customerId.toString()}; 
      final response = await http.get( 
          getEmUri(apiUrl, apiPathPrefix + "/erp_customer/Query", parameters), headers: getEmApiHeaders()); 
 
      if (response.statusCode == 200) { 
        List<ErpCustomer> foundErpCustomer = erpCustomerFromJson(response.body); 
        ErpCustomer newErpCustomer = foundErpCustomer.elementAt(0); 
        return newErpCustomer; 
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
 
    String queryName = "ErpcustomerTblRecQuery"; 
    String queryParam = "(customerId: "+jsonEncode(customerId)+" )"; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''query {	 
        ''' +queryName+' '+queryParam+ r''' {  
			customerId  	  
			name  	  
			phone  	  
			mobilePhone  	  
			pict  	  
			email  	  
			website  	  
			address  	  
			dateofinquiry  	  
			requestedqty  	  
			reqquoteamt  	  
			meetingpreftime  	  
			created  	  
			updated  	  
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
        print("API ErpCustomerQuery G-Pkg Get call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerQuery G-Pkg Get call Success ...");  
      } 
 
      List<ErpCustomer> getList =       
      List<ErpCustomer>.from(result.data![queryName].map((x) => 
            ErpCustomer.fromJson(json.decode(json.encode(x).toString())))); 
 
        ErpCustomer newErpCustomer = getList.elementAt(0); 
        return newErpCustomer; 
 
      //print("Step-2"); 
 
    } catch (err) {  
      print(err);   
      return connErrStr + " ( " + err.toString() + " ) ";  
    }  
 
    } //rest or gql 
 
  } 
 
  static Future ErpCustomerCreate(Map newErpCustomer) async { 
 
      if (isApiUseGrql == false) { 
 
    Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_customer/Create"); 
    //Map<String, String> headers = {'Content-Type': 'application/json'}; 
    try { 
      final response = await http.post(uri, 
          body: jsonEncode(newErpCustomer), headers: getEmApiHeadersCU()); 
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
 
    String queryName = "ErpcustomerTblRecCreate"; 
    String queryParam = jsonEncode(newErpCustomer); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (ErpcustomerTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			customerId  	  
			name  	  
			phone  	  
			mobilePhone  	  
			pict  	  
			email  	  
			website  	  
			address  	  
			dateofinquiry  	  
			requestedqty  	  
			reqquoteamt  	  
			meetingpreftime  	  
			created  	  
			updated  	  
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
        print("API ErpCustomerCreate G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerCreate G-Pkg call Success ...");  
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
  static Future ErpCustomerEdit( 	
	      String customerId, ErpCustomer erpCustomer) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(customerId); 	
		  Map<String, String> parameters = {'customerId': customerId.toString()}; 
    	Uri uri = getEmUri(apiUrl, apiPathPrefix + "/erp_customer/Update", parameters); 
    	//Map<String, String> headers = {'Content-Type': 'application/json'}; 
      	final response = await http.put(uri, 
          body: jsonEncode(erpCustomer), headers: getEmApiHeadersCU()); 
	 	
	      final status = response.statusCode; 	
	      if (status == 200) { 	
	        /* 	
	        List<ErpCustomer> foundErpCustomer = 	
	            erpCustomerFromJson(response.body); 	
	        ErpCustomer newErpCustomer = 	
	            foundErpCustomer.elementAt(0); 	
	        return newErpCustomer; 	
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
 
    String queryName = "ErpcustomerTblRecUpdate"; 
    String queryParam = jsonEncode(erpCustomer); 
 
    queryParam =  '\n' + transformJsonForMutate(queryParam) +'\n'; 
 
    //print("-------------------------"); 
    //print(queryParam); 
    //print("-------------------------"); 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (customerId: '+jsonEncode(customerId)+' , ErpcustomerTblRec1 : '+  
			queryParam 
			+ r''' ) {  
			customerId  	  
			name  	  
			phone  	  
			mobilePhone  	  
			pict  	  
			email  	  
			website  	  
			address  	  
			dateofinquiry  	  
			requestedqty  	  
			reqquoteamt  	  
			meetingpreftime  	  
			created  	  
			updated  	  
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
        print("API ErpCustomerEdit G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerEdit G-Pkg call Success ...");  
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
	  static Future ErpCustomerDelete(String customerId) async { 	
 
      if (isApiUseGrql == false) { 
 
		try { 	
	      //print(customerId); 	
		  Map<String, String> parameters = {'customerId': customerId.toString()}; 
	      final response = await http.delete(getEmUri( 	
	          apiUrl, apiPathPrefix + "/erp_customer/Delete", parameters), headers: getEmApiHeaders()); 	
	 	
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
 
    String queryName = "ErpcustomerTblRecDelete"; 
    String queryParam = ""; 
 
      // ---------- Grql with package graphql 
    try {  
 
      // Use raw query via r'''  
      String query = r'''mutation {	 
        ''' +queryName+'   (customerId: '+jsonEncode(customerId)+' '  
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
        print("API ErpCustomerDelete G-Pkg call Errors ...");  
        print(result.exception.toString()); 
        return result.exception.toString(); 
      } else { 
        print("API ErpCustomerDelete G-Pkg call Success ...");  
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
 
