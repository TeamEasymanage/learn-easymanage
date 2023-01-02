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
 
import emrest.spring.ErpproductTblRec; 
import emrest.spring.ErpproductTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpproductTblRecDataRestController { 
 
	@Autowired 
	ErpproductTblRecRepository ErpproductTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_product/ViewAll")  
public ResponseEntity<List<ErpproductTblRec>> ErpproductTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpproductTblRec1Repository.findAll(myPageParam).forEach(ErpproductTblRecList::add); 
		} 
		//ErpproductTblRec1Repository.findByColumnName(columnVal).forEach(ErpproductTblRecList::add); 
 
	if (ErpproductTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpproductTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_product/SelectWhere")  
public ResponseEntity<List<ErpproductTblRec>> ErpproductTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
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
 
	if (ErpproductTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpproductTblRecList, HttpStatus.OK); 
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
 
@GetMapping("erp_product/DataMesh")  
public ResponseEntity<List<ErpproductTblRec>> ErpproductTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
 
		ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpproductTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_product/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpproductTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpproductTblRec>>() {}); 
 
				List<ErpproductTblRec> getMeshRestListErpproductTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpproductTblRec.size()); 
 
				getMeshRestListErpproductTblRec.forEach(ErpproductTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpproductTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpproductTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_product/FindByColumnName")  
public ResponseEntity<List<ErpproductTblRec>> ErpproductTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
 
		ErpproductTblRec1Repository.findByColumnName(columnName).forEach(ErpproductTblRecList::add); 
		//ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
 
	if (ErpproductTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpproductTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_product/Query")  
public ResponseEntity<List<ErpproductTblRec>> ErpproductTblRecQuery(@RequestParam long productId)  
	throws Exception 
	{   
	try { 
	List<ErpproductTblRec> ErpproductTblRecList = new ArrayList<ErpproductTblRec>(); 
 
		//ErpproductTblRec1Repository.findAll().forEach(ErpproductTblRecList::add); 
		ErpproductTblRec1Repository.findByProductId(productId).forEach(ErpproductTblRecList::add); 
 
	if (ErpproductTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpproductTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_product/Create")  
@Transactional 
public ResponseEntity<ErpproductTblRec> ErpproductTblRecCreate(@RequestBody ErpproductTblRec ErpproductTblRec1)  
	throws Exception 
	{   
	try { 
	ErpproductTblRec _ErpproductTblRec = ErpproductTblRec1Repository 
			.save(ErpproductTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpproductTblRec1); 
 
	return new ResponseEntity<>(_ErpproductTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_product/Update")  
@Transactional 
public ResponseEntity<ErpproductTblRec> ErpproductTblRecUpdate(@RequestParam long productId, @RequestBody ErpproductTblRec ErpproductTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpproductTblRec> ErpproductTblRecRec1 = ErpproductTblRec1Repository.findByProductId(productId); 
 
		if (ErpproductTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpproductTblRec ErpproductTblRecRec1First = ErpproductTblRecRec1.get(0); 
		ErpproductTblRec _ErpproductTblRec = ErpproductTblRec1Repository  
						.save(ErpproductTblRec1);  
		return new ResponseEntity<>(_ErpproductTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_product/Delete")  
@Transactional 
public ResponseEntity<Long> ErpproductTblRecDelete(@RequestParam long productId)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpproductTblRec1Repository 
			.deleteByProductId(productId); 
			//.deleteAll(); 
	return new ResponseEntity<>(delCount, HttpStatus.OK); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
} 
 
