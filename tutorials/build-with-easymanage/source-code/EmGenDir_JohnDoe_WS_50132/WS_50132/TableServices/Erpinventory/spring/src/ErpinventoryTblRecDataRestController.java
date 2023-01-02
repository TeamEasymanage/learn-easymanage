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
 
import emrest.spring.ErpinventoryTblRec; 
import emrest.spring.ErpinventoryTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpinventoryTblRecDataRestController { 
 
	@Autowired 
	ErpinventoryTblRecRepository ErpinventoryTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_inventory/ViewAll")  
public ResponseEntity<List<ErpinventoryTblRec>> ErpinventoryTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryTblRec> ErpinventoryTblRecList = new ArrayList<ErpinventoryTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpinventoryTblRec1Repository.findAll().forEach(ErpinventoryTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpinventoryTblRec1Repository.findAll(myPageParam).forEach(ErpinventoryTblRecList::add); 
		} 
		//ErpinventoryTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryTblRecList::add); 
 
	if (ErpinventoryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_inventory/SelectWhere")  
public ResponseEntity<List<ErpinventoryTblRec>> ErpinventoryTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
		throws Exception 
	{ 
	List<ErpinventoryTblRec> ErpinventoryTblRecList = new ArrayList<ErpinventoryTblRec>(); 
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
 
		ErpinventoryTblRecPredicatesBuilder builder = new ErpinventoryTblRecPredicatesBuilder(searchBy); 
		BooleanExpression queryExpr = builder.build(); 
 
		ErpinventoryTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpinventoryTblRecList::add); 
 
		//ErpinventoryTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryTblRecList::add); 
 
		// if (ErpinventoryTblRecList.isEmpty()) { 
		// } 
 
	if (ErpinventoryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryTblRecList, HttpStatus.OK); 
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
 
@GetMapping("erp_inventory/DataMesh")  
public ResponseEntity<List<ErpinventoryTblRec>> ErpinventoryTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpinventoryTblRec> ErpinventoryTblRecList = new ArrayList<ErpinventoryTblRec>(); 
 
		ErpinventoryTblRec1Repository.findAll().forEach(ErpinventoryTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpinventoryTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_inventory/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpinventoryTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpinventoryTblRec>>() {}); 
 
				List<ErpinventoryTblRec> getMeshRestListErpinventoryTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpinventoryTblRec.size()); 
 
				getMeshRestListErpinventoryTblRec.forEach(ErpinventoryTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpinventoryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_inventory/FindByColumnName")  
public ResponseEntity<List<ErpinventoryTblRec>> ErpinventoryTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryTblRec> ErpinventoryTblRecList = new ArrayList<ErpinventoryTblRec>(); 
 
		ErpinventoryTblRec1Repository.findByColumnName(columnName).forEach(ErpinventoryTblRecList::add); 
		//ErpinventoryTblRec1Repository.findAll().forEach(ErpinventoryTblRecList::add); 
 
	if (ErpinventoryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_inventory/Query")  
public ResponseEntity<List<ErpinventoryTblRec>> ErpinventoryTblRecQuery(@RequestParam long invId)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryTblRec> ErpinventoryTblRecList = new ArrayList<ErpinventoryTblRec>(); 
 
		//ErpinventoryTblRec1Repository.findAll().forEach(ErpinventoryTblRecList::add); 
		ErpinventoryTblRec1Repository.findByInvId(invId).forEach(ErpinventoryTblRecList::add); 
 
	if (ErpinventoryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_inventory/Create")  
@Transactional 
public ResponseEntity<ErpinventoryTblRec> ErpinventoryTblRecCreate(@RequestBody ErpinventoryTblRec ErpinventoryTblRec1)  
	throws Exception 
	{   
	try { 
	ErpinventoryTblRec _ErpinventoryTblRec = ErpinventoryTblRec1Repository 
			.save(ErpinventoryTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpinventoryTblRec1); 
 
	return new ResponseEntity<>(_ErpinventoryTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_inventory/Update")  
@Transactional 
public ResponseEntity<ErpinventoryTblRec> ErpinventoryTblRecUpdate(@RequestParam long invId, @RequestBody ErpinventoryTblRec ErpinventoryTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpinventoryTblRec> ErpinventoryTblRecRec1 = ErpinventoryTblRec1Repository.findByInvId(invId); 
 
		if (ErpinventoryTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpinventoryTblRec ErpinventoryTblRecRec1First = ErpinventoryTblRecRec1.get(0); 
		ErpinventoryTblRec _ErpinventoryTblRec = ErpinventoryTblRec1Repository  
						.save(ErpinventoryTblRec1);  
		return new ResponseEntity<>(_ErpinventoryTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_inventory/Delete")  
@Transactional 
public ResponseEntity<Long> ErpinventoryTblRecDelete(@RequestParam long invId)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpinventoryTblRec1Repository 
			.deleteByInvId(invId); 
			//.deleteAll(); 
	return new ResponseEntity<>(delCount, HttpStatus.OK); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
} 
 
