package emrest.spring; 
 
import java.util.*; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.graphql.data.method.annotation.Argument; 
import org.springframework.graphql.data.method.annotation.MutationMapping; 
import org.springframework.graphql.data.method.annotation.QueryMapping; 
import org.springframework.graphql.data.method.annotation.SubscriptionMapping; 
import org.springframework.graphql.data.method.annotation.SchemaMapping; 
import org.springframework.stereotype.Controller; 
import org.springframework.transaction.annotation.Transactional; 
 
 
//Data Mesh API 
/*  
import org.springframework.web.reactive.function.client.WebClient; 
import org.springframework.http.HttpHeaders; 
import org.springframework.http.MediaType; 
import reactor.core.publisher.Mono; 
import org.springframework.core.ParameterizedTypeReference; 
import org.springframework.graphql.client.HttpGraphQlClient; 
*/  
 
//Pagination and Sorting 
import org.springframework.data.domain.Page; 
import org.springframework.data.domain.PageRequest; 
import org.springframework.data.domain.Pageable; 
import org.springframework.data.domain.Sort; 
 
import com.querydsl.core.types.dsl.BooleanExpression; 
 
//For SubscriptionMapping 
import java.util.stream.Stream; 
import reactor.core.publisher.Flux; 
 
//Uncomment for using spring security 
//import org.springframework.security.access.prepost.PreAuthorize; 
//import org.springframework.security.access.annotation.Secured; 
//import javax.annotation.security.RolesAllowed; 
 
import emrest.spring.EmCalendarScalar; 
import emrest.spring.EmSortBuilder; 
 
import emrest.spring.ErpcustomerTblRec; 
import emrest.spring.ErpcustomerTblRecRepository; 
 
@Controller 
public class ErpcustomerTblRecGraphqlController { 
 
	@Autowired 
	ErpcustomerTblRecRepository ErpcustomerTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecViewAll()  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
		ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
		//ErpcustomerTblRec1Repository.findByColumnName(columnVal).forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
// -------------------- ViewAllPaged ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecViewAllPaged(@Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
 		Pageable myPageParam = PageRequest.of(page, size); 
		//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 
		ErpcustomerTblRec1Repository.findAll(myPageParam).forEach(ErpcustomerTblRecList::add); 
		//ErpcustomerTblRec1Repository.findByColumnName(columnVal).forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecSelectWhere(@Argument String searchBy, @Argument String sortBy, @Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
 				System.out.println("search param = "+searchBy); 
 				System.out.println("sort by = "+sortBy); 
 
 				Pageable myPageParam; 
 
 				if (page >= 0) { 
 					myPageParam = PageRequest.of(page, size); 
					Sort mySort; 
					 if (sortBy != null) { 
						 if (sortBy.trim().length() > 0) { 
							 EmSortBuilder sortBuild = new EmSortBuilder(sortBy); 
							 if (sortBuild.gotSort) { 
								 mySort = sortBuild.mySort; 
								 myPageParam = PageRequest.of(page, size, mySort); 
							 } 
						 } 
					 } 
 					//myPageParam = PageRequest.of(page, size, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 					//Pls note: If using Sort, All the data is sorted first (matching Filter) and then page+size picked up 
 				} else { // -1 fetchAll 
 					myPageParam = Pageable.unpaged(); //Sort not possible then, use hack below if needed 
 					//myPageParam = PageRequest.of(0, 999999999, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 				} 
 
 				ErpcustomerTblRecPredicatesBuilder builder = new ErpcustomerTblRecPredicatesBuilder(searchBy); 
 				BooleanExpression queryExpr = builder.build(); 
 
 				ErpcustomerTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpcustomerTblRecList::add); 
 
		//ErpcustomerTblRec1Repository.findByColumnName(columnVal).forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
 // Data Mesh Sample Code: Combine / Fetch the data from other GraphQL sources 
 
/* 
 	 Code-Help [CH] : Enable DataMesh Sample by steps below - 
 	 				  1-Uncomment Imports Required For Data Mesh  
 	 				  2-Uncomment Function Below  
 	 				  3-Uncomment *DataMesh graphql schema Query in [ErpcustomerTblRecSchema.graphqls] file   
*/ 
 
/* 
// -------------------- DataMesh ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecDataMesh()  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
		ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpcustomerTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from GraphQL API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_gql_url = "http://127.0.0.1:9080/graphql"; 
				WebClient webClientGql = WebClient.builder().baseUrl(get_data_gql_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				HttpGraphQlClient graphQlClient = HttpGraphQlClient.builder(webClientGql) 
				//.headers(headers -> headers.setBasicAuth("UserId", "...")) 
				.build(); 
 
				String gql_doc = 
					" query { "+"\n"+ 
					" 	ErpcustomerTblRecViewAll  { "+"\n"+ 
					"		 customerId , \n\t  name , \n\t  phone , \n\t  mobilePhone , \n\t  pict , \n\t  email , \n\t  website , \n\t  address , \n\t  dateofinquiry , \n\t  requestedqty , \n\t  reqquoteamt , \n\t  meetingpreftime , \n\t  created , \n\t  updated , \n\t   "+"\n"+  
					"	} "+"\n"+ 
					"} "+"\n"; 
				Mono<List<ErpcustomerTblRec>> responseGql = 
				graphQlClient.document(gql_doc) 
				.retrieve("ErpcustomerTblRecViewAll") 
				//.toEntity(ErpcustomerTblRec.class); 
				.toEntity(new ParameterizedTypeReference<List<ErpcustomerTblRec>>() {}); 
 
				List<ErpcustomerTblRec> getMeshGqlListErpcustomerTblRec = responseGql.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshGqlListErpcustomerTblRec.size()); 
 
				getMeshGqlListErpcustomerTblRec.forEach(ErpcustomerTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
*/ 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecFindByColumnName(@Argument("columnName") String columnName)  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
		ErpcustomerTblRec1Repository.findByColumnName(columnName).forEach(ErpcustomerTblRecList::add); 
		//ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpcustomerTblRec> ErpcustomerTblRecQuery(@Argument("customerId") String customerId)  
	throws Exception 
	{   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
		//ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
		ErpcustomerTblRec1Repository.findByCustomerId(customerId).forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpcustomerTblRecList; 
} 
 
 
// -------------------- (sub) notify--Query ------------------------- 
 
@SubscriptionMapping  
//@PreAuthorize("hasRole('USER')")  
public Flux<List<ErpcustomerTblRec>> notifyErpcustomerTblRecQuery(@Argument("customerId") String customerId)  
	throws Exception 
	{   
	   
	int secInterval = 5; //Interval between data send  
	int noOfTimes = 5;   //No of times data send to client and then stop. Change to desired no of times.   
	   
	return Flux.fromStream( 
			Stream.generate(() -> { 
 
				try { 
					Thread.sleep(secInterval*1000); 
				} catch (InterruptedException e) { 
					throw new RuntimeException(e); 
				} 
	   
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
	try { 
 
		//ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
		ErpcustomerTblRec1Repository.findByCustomerId(customerId).forEach(ErpcustomerTblRecList::add); 
 
	// if (ErpcustomerTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		//throw new Exception(e.getMessage()); 
		try { throw new Exception(e.getMessage()); } catch (Exception ex) { ex.printStackTrace(); } 
	} 
	return ErpcustomerTblRecList; 
	   
	}).limit(noOfTimes)); 
} 
 
 
// -------------------- Create ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")  
@Transactional 
public ErpcustomerTblRec ErpcustomerTblRecCreate(@Argument("ErpcustomerTblRec1") ErpcustomerTblRec ErpcustomerTblRec1)  
	throws Exception 
	{   
	try { 
	ErpcustomerTblRec _ErpcustomerTblRec = ErpcustomerTblRec1Repository 
			.save(ErpcustomerTblRec1); 
 
			// Code-Help [CH] : If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpcustomerTblRec1); 
 
	return _ErpcustomerTblRec; 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
		//return null; 
	} 
} 
 
 
 			/* Code-Help [CH] : If this object is View, And to Save Data to its Base tables use construct like below in Create/Edit 
 			This example shows saving for 2 base tables of Dgproductinventoryview. 
 			Do import model and repository classes for base tables. 
 			*/ 
 			/* 
			//DgproductinventoryviewTblRec _DgproductinventoryviewTblRec = DgproductinventoryviewTblRec1Repository 
			//		.save(DgproductinventoryviewTblRec1); 
 
			DgproductTblRec DgproductTblRec1 = new DgproductTblRec(); 
			DgproductTblRec1.setProductId(DgproductinventoryviewTblRec1.getProductId()); 
			DgproductTblRec1.setProductDesc(DgproductinventoryviewTblRec1.getProductDesc()); 
			//set all fields ... 
			DgproductTblRec _DgproductTblRec = DgproductTblRec1Repository 
					.save(DgproductTblRec1); 
 
			DginventoryTblRec DginventoryTblRec1 = new DginventoryTblRec(); 
			DginventoryTblRec1.setInventoryId(DgproductinventoryviewTblRec1.getInventoryId()); 
			DginventoryTblRec1.setInvLocation(DgproductinventoryviewTblRec1.getInvLocation()); 
			//set all fields ... 
			DginventoryTblRec _DginventoryTblRec = DginventoryTblRec1Repository 
					.save(DginventoryTblRec1); 
 			*/ 
 
  
// -------------------- Update ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")  
@Transactional 
public ErpcustomerTblRec ErpcustomerTblRecUpdate(@Argument("customerId") String customerId, @Argument("ErpcustomerTblRec1") ErpcustomerTblRec ErpcustomerTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpcustomerTblRec> ErpcustomerTblRecRec1 = ErpcustomerTblRec1Repository.findByCustomerId(customerId); 
 
		if (ErpcustomerTblRecRec1.isEmpty()) {  
			return null;  
		}  
 
		ErpcustomerTblRec ErpcustomerTblRecRec1First = ErpcustomerTblRecRec1.get(0); 
		ErpcustomerTblRec _ErpcustomerTblRec = ErpcustomerTblRec1Repository  
						.save(ErpcustomerTblRec1);  
		return _ErpcustomerTblRec;  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	//return null;  
} 
 
// -------------------- Delete ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('ADMIN')")  
@Transactional 
public Long ErpcustomerTblRecDelete(@Argument("customerId") String customerId)  
	throws Exception 
	{   
	Long delCount = 0L; 
	try { 
 
		delCount = ErpcustomerTblRec1Repository 
			.deleteByCustomerId(customerId); 
			//.deleteAll(); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return delCount; 
} 
 
} 
 
