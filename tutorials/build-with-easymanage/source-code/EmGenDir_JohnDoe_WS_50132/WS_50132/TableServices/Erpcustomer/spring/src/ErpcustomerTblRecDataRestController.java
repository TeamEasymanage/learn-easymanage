package emrest.spring; 
 
import java.util.*; 
 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.http.HttpStatus; 
import org.springframework.http.ResponseEntity; 
import org.springframework.web.bind.annotation.CrossOrigin; 
import org.springframework.web.bind.annotation.DeleteMapping; 
import org.springframework.web.bind.annotation.GetMapping; 
import org.springframework.web.bind.annotation.PathVariable; 
import org.springframework.web.bind.annotation.PostMapping; 
import org.springframework.web.bind.annotation.PutMapping; 
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestParam; 
import org.springframework.web.bind.annotation.RestController; 
import org.springframework.transaction.annotation.Transactional; 
import org.springframework.format.annotation.DateTimeFormat; 
 
//Data Mesh API 
/*  
import org.springframework.web.reactive.function.client.WebClient; 
import org.springframework.http.HttpHeaders; 
import org.springframework.http.MediaType; 
import reactor.core.publisher.Mono; 
import org.springframework.core.ParameterizedTypeReference; 
*/  
 
//Pagination and Sorting 
import org.springframework.data.domain.Page; 
import org.springframework.data.domain.PageRequest; 
import org.springframework.data.domain.Pageable; 
import org.springframework.data.domain.Sort; 
 
import com.querydsl.core.types.dsl.BooleanExpression; 
 
import emrest.spring.ErpcustomerTblRec; 
import emrest.spring.ErpcustomerTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpcustomerTblRecDataRestController { 
 
	@Autowired 
	ErpcustomerTblRecRepository ErpcustomerTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_customer/ViewAll")  
public ResponseEntity<List<ErpcustomerTblRec>> ErpcustomerTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpcustomerTblRec1Repository.findAll(myPageParam).forEach(ErpcustomerTblRecList::add); 
		} 
		//ErpcustomerTblRec1Repository.findByColumnName(columnVal).forEach(ErpcustomerTblRecList::add); 
 
	if (ErpcustomerTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpcustomerTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_customer/SelectWhere")  
public ResponseEntity<List<ErpcustomerTblRec>> ErpcustomerTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
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
 
	if (ErpcustomerTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpcustomerTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
 // Data Mesh Sample Code: Combine / Fetch the data from other REST sources 
 
/* 
 	 Code-Help [CH] : Enable DataMesh Sample by steps below - 
 	 				  1-Uncomment Imports Required For Data Mesh  
 	 				  2-Uncomment Function Below  
*/ 
 
/* 
// -------------------- DataMesh ------------------------- 
 
@GetMapping("erp_customer/DataMesh")  
public ResponseEntity<List<ErpcustomerTblRec>> ErpcustomerTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
 
		ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpcustomerTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_customer/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpcustomerTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpcustomerTblRec>>() {}); 
 
				List<ErpcustomerTblRec> getMeshRestListErpcustomerTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpcustomerTblRec.size()); 
 
				getMeshRestListErpcustomerTblRec.forEach(ErpcustomerTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpcustomerTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpcustomerTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_customer/FindByColumnName")  
public ResponseEntity<List<ErpcustomerTblRec>> ErpcustomerTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
 
		ErpcustomerTblRec1Repository.findByColumnName(columnName).forEach(ErpcustomerTblRecList::add); 
		//ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
 
	if (ErpcustomerTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpcustomerTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_customer/Query")  
public ResponseEntity<List<ErpcustomerTblRec>> ErpcustomerTblRecQuery(@RequestParam String customerId)  
	throws Exception 
	{   
	try { 
	List<ErpcustomerTblRec> ErpcustomerTblRecList = new ArrayList<ErpcustomerTblRec>(); 
 
		//ErpcustomerTblRec1Repository.findAll().forEach(ErpcustomerTblRecList::add); 
		ErpcustomerTblRec1Repository.findByCustomerId(customerId).forEach(ErpcustomerTblRecList::add); 
 
	if (ErpcustomerTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpcustomerTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_customer/Create")  
@Transactional 
public ResponseEntity<ErpcustomerTblRec> ErpcustomerTblRecCreate(@RequestBody ErpcustomerTblRec ErpcustomerTblRec1)  
	throws Exception 
	{   
	try { 
	ErpcustomerTblRec _ErpcustomerTblRec = ErpcustomerTblRec1Repository 
			.save(ErpcustomerTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpcustomerTblRec1); 
 
	return new ResponseEntity<>(_ErpcustomerTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_customer/Update")  
@Transactional 
public ResponseEntity<ErpcustomerTblRec> ErpcustomerTblRecUpdate(@RequestParam String customerId, @RequestBody ErpcustomerTblRec ErpcustomerTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpcustomerTblRec> ErpcustomerTblRecRec1 = ErpcustomerTblRec1Repository.findByCustomerId(customerId); 
 
		if (ErpcustomerTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpcustomerTblRec ErpcustomerTblRecRec1First = ErpcustomerTblRecRec1.get(0); 
		ErpcustomerTblRec _ErpcustomerTblRec = ErpcustomerTblRec1Repository  
						.save(ErpcustomerTblRec1);  
		return new ResponseEntity<>(_ErpcustomerTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_customer/Delete")  
@Transactional 
public ResponseEntity<Long> ErpcustomerTblRecDelete(@RequestParam String customerId)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpcustomerTblRec1Repository 
			.deleteByCustomerId(customerId); 
			//.deleteAll(); 
	return new ResponseEntity<>(delCount, HttpStatus.OK); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
} 
 
