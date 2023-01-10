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
 
import emrest.spring.ErpproductTblRec; 
import emrest.spring.ErpproductTblRecRepository; 
 
@Controller 
public class ErpproductTblRecGraphqlController { 
 
	@Autowired 
	ErpproductTblRecRepository ErpproductTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecViewAll()  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
		ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
		//ErpproductTblRec1Repository.findByColumnName(columnVal).forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
// -------------------- ViewAllPaged ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecViewAllPaged(@Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
 		Pageable myPageParam = PageRequest.of(page, size); 
		//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
 
		ErpproductTblRec1Repository.findAll(myPageParam).forEach(ErpproductTblRecList::add); 
		//ErpproductTblRec1Repository.findByColumnName(columnVal).forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecSelectWhere(@Argument String searchBy, @Argument String sortBy, @Argument int page, @Argument int size)  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
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
 
 				ErpproductTblRecPredicatesBuilder builder = new ErpproductTblRecPredicatesBuilder(searchBy); 
 				BooleanExpression queryExpr = builder.build(); 
 
 				ErpproductTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpproductTblRecList::add); 
 
		//ErpproductTblRec1Repository.findByColumnName(columnVal).forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
 // Data Mesh Sample Code: Combine / Fetch the data from other GraphQL sources 
 
/* 
 	 Code-Help [CH] : Enable DataMesh Sample by steps below - 
 	 				  1-Uncomment Imports Required For Data Mesh  
 	 				  2-Uncomment Function Below  
 	 				  3-Uncomment *DataMesh graphql schema Query in [ErpproductTblRecSchema.graphqls] file   
*/ 
 
/* 
// -------------------- DataMesh ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecDataMesh()  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
		ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpproductTblRecList.size()); 
 
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
					" 	ErpproductTblRecViewAll  { "+"\n"+ 
					"		 productId , \n\t  productName , \n\t  productCategory , \n\t  primarySupplier , \n\t  productDesc , \n\t  productPicture , \n\t  productAddedColumn , \n\t   "+"\n"+  
					"	} "+"\n"+ 
					"} "+"\n"; 
				Mono<List<ErpproductTblRec>> responseGql = 
				graphQlClient.document(gql_doc) 
				.retrieve("ErpproductTblRecViewAll") 
				//.toEntity(ErpproductTblRec.class); 
				.toEntity(new ParameterizedTypeReference<List<ErpproductTblRec>>() {}); 
 
				List<ErpproductTblRec> getMeshGqlListErpproductTblRec = responseGql.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshGqlListErpproductTblRec.size()); 
 
				getMeshGqlListErpproductTblRec.forEach(ErpproductTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
*/ 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecFindByColumnName(@Argument("columnName") String columnName)  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
		ErpproductTblRec1Repository.findByColumnName(columnName).forEach(ErpproductTblRecList::add); 
		//ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@QueryMapping  
//@PreAuthorize("hasRole('USER')")  
public List<ErpproductTblRec> ErpproductTblRecQuery(@Argument("productId") long productId)  
	throws Exception 
	{   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
		//ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
		ErpproductTblRec1Repository.findByProductId(productId).forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return ErpproductTblRecList; 
} 
 
 
// -------------------- (sub) notify--Query ------------------------- 
 
@SubscriptionMapping  
//@PreAuthorize("hasRole('USER')")  
public Flux<List<ErpproductTblRec>> notifyErpproductTblRecQuery(@Argument("productId") long productId)  
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
	   
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
	try { 
 
		//ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
		ErpproductTblRec1Repository.findByProductId(productId).forEach(ErpproductTblRecList::add); 
 
	// if (ErpproductTblRecList.isEmpty()) { 
	// } 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		//throw new Exception(e.getMessage()); 
		try { throw new Exception(e.getMessage()); } catch (Exception ex) { ex.printStackTrace(); } 
	} 
	return ErpproductTblRecList; 
	   
	}).limit(noOfTimes)); 
} 
 
 
// -------------------- Create ------------------------- 
 
@MutationMapping  
//@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")  
@Transactional 
public ErpproductTblRec ErpproductTblRecCreate(@Argument("ErpproductTblRec1") ErpproductTblRec ErpproductTblRec1)  
	throws Exception 
	{   
	try { 
	ErpproductTblRec _ErpproductTblRec = ErpproductTblRec1Repository 
			.save(ErpproductTblRec1); 
 
			// Code-Help [CH] : If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpproductTblRec1); 
 
	return _ErpproductTblRec; 
 
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
public ErpproductTblRec ErpproductTblRecUpdate(@Argument("productId") long productId, @Argument("ErpproductTblRec1") ErpproductTblRec ErpproductTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpproductTblRec> ErpproductTblRecRec1 = ErpproductTblRec1Repository.findByProductId(productId); 
 
		if (ErpproductTblRecRec1.isEmpty()) {  
			return null;  
		}  
 
		ErpproductTblRec ErpproductTblRecRec1First = ErpproductTblRecRec1.get(0); 
		ErpproductTblRec _ErpproductTblRec = ErpproductTblRec1Repository  
						.save(ErpproductTblRec1);  
		return _ErpproductTblRec;  
 
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
public Long ErpproductTblRecDelete(@Argument("productId") long productId)  
	throws Exception 
	{   
	Long delCount = 0L; 
	try { 
 
		delCount = ErpproductTblRec1Repository 
			.deleteByProductId(productId); 
			//.deleteAll(); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		throw new Exception(e.getMessage()); 
	} 
	return delCount; 
} 
 
} 
 
