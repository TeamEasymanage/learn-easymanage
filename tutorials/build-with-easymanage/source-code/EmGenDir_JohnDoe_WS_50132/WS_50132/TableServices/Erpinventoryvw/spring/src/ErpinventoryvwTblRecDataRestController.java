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
 
import emrest.spring.ErpinventoryvwTblRec; 
import emrest.spring.ErpinventoryvwTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpinventoryvwTblRecDataRestController { 
 
	@Autowired 
	ErpinventoryvwTblRecRepository ErpinventoryvwTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_inventory_vw/ViewAll")  
public ResponseEntity<List<ErpinventoryvwTblRec>> ErpinventoryvwTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpinventoryvwTblRec1Repository.findAll(myPageParam).forEach(ErpinventoryvwTblRecList::add); 
		} 
		//ErpinventoryvwTblRec1Repository.findByColumnName(columnVal).forEach(ErpinventoryvwTblRecList::add); 
 
	if (ErpinventoryvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_inventory_vw/SelectWhere")  
public ResponseEntity<List<ErpinventoryvwTblRec>> ErpinventoryvwTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
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
 
	if (ErpinventoryvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryvwTblRecList, HttpStatus.OK); 
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
 
@GetMapping("erp_inventory_vw/DataMesh")  
public ResponseEntity<List<ErpinventoryvwTblRec>> ErpinventoryvwTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
 
		ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpinventoryvwTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_inventory_vw/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpinventoryvwTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpinventoryvwTblRec>>() {}); 
 
				List<ErpinventoryvwTblRec> getMeshRestListErpinventoryvwTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpinventoryvwTblRec.size()); 
 
				getMeshRestListErpinventoryvwTblRec.forEach(ErpinventoryvwTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpinventoryvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_inventory_vw/FindByColumnName")  
public ResponseEntity<List<ErpinventoryvwTblRec>> ErpinventoryvwTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
 
		ErpinventoryvwTblRec1Repository.findByColumnName(columnName).forEach(ErpinventoryvwTblRecList::add); 
		//ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
 
	if (ErpinventoryvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_inventory_vw/Query")  
public ResponseEntity<List<ErpinventoryvwTblRec>> ErpinventoryvwTblRecQuery(@RequestParam long invId)  
	throws Exception 
	{   
	try { 
	List<ErpinventoryvwTblRec> ErpinventoryvwTblRecList = new ArrayList<ErpinventoryvwTblRec>(); 
 
		//ErpinventoryvwTblRec1Repository.findAll().forEach(ErpinventoryvwTblRecList::add); 
		ErpinventoryvwTblRec1Repository.findByInvId(invId).forEach(ErpinventoryvwTblRecList::add); 
 
	if (ErpinventoryvwTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpinventoryvwTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_inventory_vw/Create")  
@Transactional 
public ResponseEntity<ErpinventoryvwTblRec> ErpinventoryvwTblRecCreate(@RequestBody ErpinventoryvwTblRec ErpinventoryvwTblRec1)  
	throws Exception 
	{   
	try { 
	ErpinventoryvwTblRec _ErpinventoryvwTblRec = ErpinventoryvwTblRec1Repository 
			.save(ErpinventoryvwTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpinventoryvwTblRec1); 
 
	return new ResponseEntity<>(_ErpinventoryvwTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_inventory_vw/Update")  
@Transactional 
public ResponseEntity<ErpinventoryvwTblRec> ErpinventoryvwTblRecUpdate(@RequestParam long invId, @RequestBody ErpinventoryvwTblRec ErpinventoryvwTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpinventoryvwTblRec> ErpinventoryvwTblRecRec1 = ErpinventoryvwTblRec1Repository.findByInvId(invId); 
 
		if (ErpinventoryvwTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpinventoryvwTblRec ErpinventoryvwTblRecRec1First = ErpinventoryvwTblRecRec1.get(0); 
		ErpinventoryvwTblRec _ErpinventoryvwTblRec = ErpinventoryvwTblRec1Repository  
						.save(ErpinventoryvwTblRec1);  
		return new ResponseEntity<>(_ErpinventoryvwTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_inventory_vw/Delete")  
@Transactional 
public ResponseEntity<Long> ErpinventoryvwTblRecDelete(@RequestParam long invId)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpinventoryvwTblRec1Repository 
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
 
