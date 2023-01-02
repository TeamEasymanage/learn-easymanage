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
 
import emrest.spring.ErpinventoryvwTblRec; 
import emrest.spring.ErpinventoryvwTblRecRepository; 
 
@Controller 
public class ErpinventoryvwTblRecGraphqlController { 
 
	@Autowired 
	ErpinventoryvwTblRecRepository ErpinventoryvwTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecViewAll()  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
		ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
		//ErpinventoryvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
// -------------------- ViewAllPaged ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecViewAllPaged(@Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
 		Pageable myPageParam = PageRequest.of(page, size); 
		//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 
		ErpinventoryvwTblRec1Repository.findAll(myPageParam).forEach(ErpinventoryvwTblRecList::add); 
		//ErpinventoryvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecSelectWhere(@Argument String searchBy, @Argument String sortBy, @Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
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
 
 				ErpinventoryvwTblRecPredicatesBuilder builder = new ErpinventoryvwTblRecPredicatesBuilder(searchBy); 
 				BooleanExpression queryExpr = builder.build(); 
 
 				ErpinventoryvwTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpinventoryvwTblRecList::add); 
 
		//ErpinventoryvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
 // Data Mesh Sample Code: Combine / Fetch the data from other GraphQL sources 
 
/* 
 	 Code-Help [CH] : Enable DataMesh Sample by steps below - 
 	 				  1-Uncomment Imports Required For Data Mesh  
 	 				  2-Uncomment Function Below  
 	 				  3-Uncomment *DataMesh graphql schema Query in [ErpinventoryvwTblRecSchema.graphqls] file   
*/ 
 
/* 
// -------------------- DataMesh ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecDataMesh()  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
		ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpinventoryvwTblRecList.size()); 
 
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
					" 	ErpinventoryvwTblRecViewAll  { "+"\n"+ 
					"		 invId , \n\t  productId , \n\t  productName , \n\t  invDate , \n\t  invQty , \n\t  invMinQty , \n\t  invCost , \n\t  invLocation , \n\t   "+"\n"+  
					"	} "+"\n"+ 
					"} "+"\n"; 
				Mono<List<ErpinventoryvwTblRec>> responseGql = 
				graphQlClient.document(gql_doc) 
				.retrieve("ErpinventoryvwTblRecViewAll") 
				//.toEntity(ErpinventoryvwTblRec.class); 
				.toEntity(new ParameterizedTypeReference<List<ErpinventoryvwTblRec>>() {}); 
 
				List<ErpinventoryvwTblRec> getMeshGqlListErpinventoryvwTblRec = responseGql.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshGqlListErpinventoryvwTblRec.size()); 
 
				getMeshGqlListErpinventoryvwTblRec.forEach(ErpinventoryvwTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
*/ 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecFindByColumnName(@Argument("columnName") String columnName)  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
		ErpinventoryvwTblRec1Repository.findByColumnName(columnName).forEach(ErpinventoryvwTblRecList::add); 
		//ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventoryvwTblRec> ErpinventoryvwTblRecQuery(@Argument("invId") long invId)  
	throws Exception 
	{   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
		//ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
		ErpinventoryvwTblRec1Repository.findByInvId(invId).forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventoryvwTblRecList; 
} 
 
 
// -------------------- (sub) notify--Query ------------------------- 
 
@SubscriptionMapping  
//@PreAuthorize("hasRole('USER')")  
public Flux<List<ErpinventoryvwTblRec>> notifyErpinventoryvwTblRecQuery(@Argument("invId") long invId)  
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
	   
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
	try { 
 
		//ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
		ErpinventoryvwTblRec1Repository.findByInvId(invId).forEach(ErpinventoryvwTblRecList::add); 
 
	// if (ErpinventoryvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		//throw new Exception(e.getMessage()); 
		try { throw new Exception(e.getMessage()); } catch (Exception ex) { ex.printStackTrace(); } 
	} 
	return ErpinventoryvwTblRecList; 
	   
	}).limit(noOfTimes)); 
} 
 
 
// -------------------- Create ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")  
@Transactional 
public ErpinventoryvwTblRec ErpinventoryvwTblRecCreate(@Argument("ErpinventoryvwTblRec1") ErpinventoryvwTblRec ErpinventoryvwTblRec1)  
	throws Exception 
	{   
	try { 
	ErpinventoryvwTblRec _ErpinventoryvwTblRec = ErpinventoryvwTblRec1Repository 
			.save(ErpinventoryvwTblRec1); 
 
			// Code-Help [CH] : If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpinventoryvwTblRec1); 
 
	return _ErpinventoryvwTblRec; 
 
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
public ErpinventoryvwTblRec ErpinventoryvwTblRecUpdate(@Argument("invId") long invId, @Argument("ErpinventoryvwTblRec1") ErpinventoryvwTblRec ErpinventoryvwTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpinventoryvwTblRec> ErpinventoryvwTblRecRec1 = ErpinventoryvwTblRec1Repository.findByInvId(invId); 
 
		if (ErpinventoryvwTblRecRec1.isEmpty()) {  
			return null;  
		}  
 
		ErpinventoryvwTblRec ErpinventoryvwTblRecRec1First = ErpinventoryvwTblRecRec1.get(0); 
		ErpinventoryvwTblRec _ErpinventoryvwTblRec = ErpinventoryvwTblRec1Repository  
						.save(ErpinventoryvwTblRec1);  
		return _ErpinventoryvwTblRec;  
 
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
public Long ErpinventoryvwTblRecDelete(@Argument("invId") long invId)  
	throws Exception 
	{   
	Long delCount = 0L; 
	try { 
 
		delCount = ErpinventoryvwTblRec1Repository 
			.deleteByInvId(invId); 
			//.deleteAll(); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return delCount; 
} 
 
} 
 
