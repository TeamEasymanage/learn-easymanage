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
 
import emrest.spring.ErpinventorysumvwTblRec; 
import emrest.spring.ErpinventorysumvwTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpinventorysumvwTblRecDataRestController { 
 
	@Autowired 
	ErpinventorysumvwTblRecRepository ErpinventorysumvwTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_inventory_sum_vw/ViewAll")  
public ResponseEntity<List<ErpinventorysumvwTblRec>> ErpinventorysumvwTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpinventorysumvwTblRec1Repository.findAll(myPageParam).forEach(ErpinventorysumvwTblRecList::add); 
		} 
		//ErpinventorysumvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventorysumvwTblRecList::add); 
 
	if (ErpinventorysumvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventorysumvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_inventory_sum_vw/SelectWhere")  
public ResponseEntity<List<ErpinventorysumvwTblRec>> ErpinventorysumvwTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
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
 
	if (ErpinventorysumvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventorysumvwTblRecList, HttpStatus.OK); 
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
 
@GetMapping("erp_inventory_sum_vw/DataMesh")  
public ResponseEntity<List<ErpinventorysumvwTblRec>> ErpinventorysumvwTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
 
		ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpinventorysumvwTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_inventory_sum_vw/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpinventorysumvwTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpinventorysumvwTblRec>>() {}); 
 
				List<ErpinventorysumvwTblRec> getMeshRestListErpinventorysumvwTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpinventorysumvwTblRec.size()); 
 
				getMeshRestListErpinventorysumvwTblRec.forEach(ErpinventorysumvwTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpinventorysumvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventorysumvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_inventory_sum_vw/FindByColumnName")  
public ResponseEntity<List<ErpinventorysumvwTblRec>> ErpinventorysumvwTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
 
		ErpinventorysumvwTblRec1Repository.findByColumnName(columnName).forEach(ErpinventorysumvwTblRecList::add); 
		//ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
 
	if (ErpinventorysumvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventorysumvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_inventory_sum_vw/Query")  
public ResponseEntity<List<ErpinventorysumvwTblRec>> ErpinventorysumvwTblRecQuery(@RequestParam long year)  
	throws Exception 
	{   
	try { 
	List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecList = new ArrayList<ErpinventorysumvwTblRec>(); 
 
		//ErpinventorysumvwTblRec1Repository.findAll().forEach(ErpinventorysumvwTblRecList::add); 
		ErpinventorysumvwTblRec1Repository.findByYear(year).forEach(ErpinventorysumvwTblRecList::add); 
 
	if (ErpinventorysumvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventorysumvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_inventory_sum_vw/Create")  
@Transactional 
public ResponseEntity<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecCreate(@RequestBody ErpinventorysumvwTblRec ErpinventorysumvwTblRec1)  
	throws Exception 
	{   
	try { 
	ErpinventorysumvwTblRec _ErpinventorysumvwTblRec = ErpinventorysumvwTblRec1Repository 
			.save(ErpinventorysumvwTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpinventorysumvwTblRec1); 
 
	return new ResponseEntity<>(_ErpinventorysumvwTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_inventory_sum_vw/Update")  
@Transactional 
public ResponseEntity<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecUpdate(@RequestParam long year, @RequestBody ErpinventorysumvwTblRec ErpinventorysumvwTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpinventorysumvwTblRec> ErpinventorysumvwTblRecRec1 = ErpinventorysumvwTblRec1Repository.findByYear(year); 
 
		if (ErpinventorysumvwTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpinventorysumvwTblRec ErpinventorysumvwTblRecRec1First = ErpinventorysumvwTblRecRec1.get(0); 
		ErpinventorysumvwTblRec _ErpinventorysumvwTblRec = ErpinventorysumvwTblRec1Repository  
						.save(ErpinventorysumvwTblRec1);  
		return new ResponseEntity<>(_ErpinventorysumvwTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_inventory_sum_vw/Delete")  
@Transactional 
public ResponseEntity<Long> ErpinventorysumvwTblRecDelete(@RequestParam long year)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpinventorysumvwTblRec1Repository 
			.deleteByYear(year); 
			//.deleteAll(); 
	return new ResponseEntity<>(delCount, HttpStatus.OK); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
} 
 
