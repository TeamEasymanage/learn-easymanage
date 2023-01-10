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
 
import emrest.spring.ErpinventorysumvwTblRec; 
import emrest.spring.ErpinventorysumvwTblRecRepository; 
 
@Controller 
public class ErpinventorysumvwTblRecGraphqlController { 
 
	@Autowired 
	ErpinventorysumvwTblRecRepository ErpinventorysumvwTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecViewAll()  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
		ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
		//ErpinventorysumvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
// -------------------- ViewAllPaged ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecViewAllPaged(@Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
 		Pageable myPageParam = PageRequest.of(page, size); 
		//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 
		ErpinventorysumvwTblRec1Repository.findAll(myPageParam).forEach(ErpinventorysumvwTblRecList::add); 
		//ErpinventorysumvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecSelectWhere(@Argument String searchBy, @Argument String sortBy, @Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
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
 
 				ErpinventorysumvwTblRecPredicatesBuilder builder = new ErpinventorysumvwTblRecPredicatesBuilder(searchBy); 
 				BooleanExpression queryExpr = builder.build(); 
 
 				ErpinventorysumvwTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpinventorysumvwTblRecList::add); 
 
		//ErpinventorysumvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
 // Data Mesh Sample Code: Combine / Fetch the data from other GraphQL sources 
 
/* 
 	 Code-Help [CH] : Enable DataMesh Sample by steps below - 
 	 				  1-Uncomment Imports Required For Data Mesh  
 	 				  2-Uncomment Function Below  
 	 				  3-Uncomment *DataMesh graphql schema Query in [ErpinventorysumvwTblRecSchema.graphqls] file   
*/ 
 
/* 
// -------------------- DataMesh ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecDataMesh()  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
		ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpinventorysumvwTblRecList.size()); 
 
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
					" 	ErpinventorysumvwTblRecViewAll  { "+"\n"+ 
					"		 year , \n\t  month , \n\t  totalQty , \n\t   "+"\n"+  
					"	} "+"\n"+ 
					"} "+"\n"; 
				Mono<List<ErpinventorysumvwTblRec>> responseGql = 
				graphQlClient.document(gql_doc) 
				.retrieve("ErpinventorysumvwTblRecViewAll") 
				//.toEntity(ErpinventorysumvwTblRec.class); 
				.toEntity(new ParameterizedTypeReference<List<ErpinventorysumvwTblRec>>() {}); 
 
				List<ErpinventorysumvwTblRec> getMeshGqlListErpinventorysumvwTblRec = responseGql.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshGqlListErpinventorysumvwTblRec.size()); 
 
				getMeshGqlListErpinventorysumvwTblRec.forEach(ErpinventorysumvwTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
*/ 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecFindByColumnName(@Argument("columnName") String columnName)  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
		ErpinventorysumvwTblRec1Repository.findByColumnName(columnName).forEach(ErpinventorysumvwTblRecList::add); 
		//ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecQuery(@Argument("year") long year)  
	throws Exception 
	{   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
		//ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
		ErpinventorysumvwTblRec1Repository.findByYear(year).forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpinventorysumvwTblRecList; 
} 
 
 
// -------------------- (sub) notify--Query ------------------------- 
 
@SubscriptionMapping  
//@PreAuthorize("hasRole('USER')")  
public Flux<List<ErpinventorysumvwTblRec>> notifyErpinventorysumvwTblRecQuery(@Argument("year") long year)  
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
	   
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
	try { 
 
		//ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
		ErpinventorysumvwTblRec1Repository.findByYear(year).forEach(ErpinventorysumvwTblRecList::add); 
 
	// if (ErpinventorysumvwTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		//throw new Exception(e.getMessage()); 
		try { throw new Exception(e.getMessage()); } catch (Exception ex) { ex.printStackTrace(); } 
	} 
	return ErpinventorysumvwTblRecList; 
	   
	}).limit(noOfTimes)); 
} 
 
 
// -------------------- Create ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")  
@Transactional 
public ErpinventorysumvwTblRec ErpinventorysumvwTblRecCreate(@Argument("ErpinventorysumvwTblRec1") ErpinventorysumvwTblRec ErpinventorysumvwTblRec1)  
	throws Exception 
	{   
	try { 
	ErpinventorysumvwTblRec _ErpinventorysumvwTblRec = ErpinventorysumvwTblRec1Repository 
			.save(ErpinventorysumvwTblRec1); 
 
			// Code-Help [CH] : If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpinventorysumvwTblRec1); 
 
	return _ErpinventorysumvwTblRec; 
 
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
public ErpinventorysumvwTblRec ErpinventorysumvwTblRecUpdate(@Argument("year") long year, @Argument("ErpinventorysumvwTblRec1") ErpinventorysumvwTblRec ErpinventorysumvwTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecRec1 = ErpinventorysumvwTblRec1Repository.findByYear(year); 
 
		if (ErpinventorysumvwTblRecRec1.isEmpty()) {  
			return null;  
		}  
 
		ErpinventorysumvwTblRec ErpinventorysumvwTblRecRec1First = ErpinventorysumvwTblRecRec1.get(0); 
		ErpinventorysumvwTblRec _ErpinventorysumvwTblRec = ErpinventorysumvwTblRec1Repository  
						.save(ErpinventorysumvwTblRec1);  
		return _ErpinventorysumvwTblRec;  
 
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
public Long ErpinventorysumvwTblRecDelete(@Argument("year") long year)  
	throws Exception 
	{   
	Long delCount = 0L; 
	try { 
 
		delCount = ErpinventorysumvwTblRec1Repository 
			.deleteByYear(year); 
			//.deleteAll(); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return delCount; 
} 
 
} 
 
