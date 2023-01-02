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
 
import emrest.spring.ErpsalesinquiryTblRec; 
import emrest.spring.ErpsalesinquiryTblRecRepository; 
 
@CrossOrigin  
@RestController 
@RequestMapping("/emdbrest")  
public class ErpsalesinquiryTblRecDataRestController { 
 
	@Autowired 
	ErpsalesinquiryTblRecRepository ErpsalesinquiryTblRec1Repository; 
 
// -------------------- ViewAll ------------------------- 
 
@GetMapping("erp_sales_inquiry/ViewAll")  
public ResponseEntity<List<ErpsalesinquiryTblRec>> ErpsalesinquiryTblRecViewAll(@RequestParam(defaultValue = "0") int pageNo)  
	throws Exception 
	{   
	try { 
	List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecList = new ArrayList<ErpsalesinquiryTblRec>(); 
 
		//System.out.println("PageNo = "+pageNo); 
		if (pageNo == -1) { 
		ErpsalesinquiryTblRec1Repository.findAll().forEach(ErpsalesinquiryTblRecList::add); 
		} else { 
			//int pageNo = 0; 
			int pageSize = 10; 
			Pageable myPageParam =  PageRequest.of(pageNo, pageSize); 
			//Pageable myPageParam =  PageRequest.of(pageNo, pageSize, Sort.by("columnOne").descending().and(Sort.by("columnTwo"))); 
		ErpsalesinquiryTblRec1Repository.findAll(myPageParam).forEach(ErpsalesinquiryTblRecList::add); 
		} 
		//ErpsalesinquiryTblRec1Repository.findByColumnName(columnVal).forEach(ErpsalesinquiryTblRecList::add); 
 
	if (ErpsalesinquiryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpsalesinquiryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- SelectWhere ------------------------- 
 
@GetMapping("erp_sales_inquiry/SelectWhere")  
public ResponseEntity<List<ErpsalesinquiryTblRec>> ErpsalesinquiryTblRecSelectWhere(@RequestParam String searchBy, @RequestParam(defaultValue = "") String sortBy, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size) 
		throws Exception 
	{ 
	List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecList = new ArrayList<ErpsalesinquiryTblRec>(); 
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
 
		ErpsalesinquiryTblRecPredicatesBuilder builder = new ErpsalesinquiryTblRecPredicatesBuilder(searchBy); 
		BooleanExpression queryExpr = builder.build(); 
 
		ErpsalesinquiryTblRec1Repository.findAll(queryExpr, myPageParam).forEach(ErpsalesinquiryTblRecList::add); 
 
		//ErpsalesinquiryTblRec1Repository.findByColumnName(columnVal).forEach(ErpsalesinquiryTblRecList::add); 
 
		// if (ErpsalesinquiryTblRecList.isEmpty()) { 
		// } 
 
	if (ErpsalesinquiryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpsalesinquiryTblRecList, HttpStatus.OK); 
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
 
@GetMapping("erp_sales_inquiry/DataMesh")  
public ResponseEntity<List<ErpsalesinquiryTblRec>> ErpsalesinquiryTblRecDataMesh()  
	throws Exception 
	{   
	try { 
	List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecList = new ArrayList<ErpsalesinquiryTblRec>(); 
 
		ErpsalesinquiryTblRec1Repository.findAll().forEach(ErpsalesinquiryTblRecList::add); 
 
				System.out.println("Data Mesh Source #1 Record Count: "+ErpsalesinquiryTblRecList.size()); 
 
				// ---- Combine Data With ---------------------------------------------------- 
				// Get data from REST API call (sample shows getting data from same table ViewAll API call) 
				//---------------------------------------------------------------------------- 
				String get_data_rest_url = "http://127.0.0.1:9080/emdbrest/erp_sales_inquiry/ViewAll?pageNo=-1"; //-1 == Unpaginated 
				WebClient webClientRest = WebClient.builder().baseUrl(get_data_rest_url) 
		        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).build(); 
 
				Mono<List<ErpsalesinquiryTblRec>> responseRest = 
				webClientRest.get() 
		        .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).retrieve() 
				.bodyToMono(new ParameterizedTypeReference<List<ErpsalesinquiryTblRec>>() {}); 
 
				List<ErpsalesinquiryTblRec> getMeshRestListErpsalesinquiryTblRec = responseRest.block(); 
 
				System.out.println("Data Mesh Source #2 Record Count: "+getMeshRestListErpsalesinquiryTblRec.size()); 
 
				getMeshRestListErpsalesinquiryTblRec.forEach(ErpsalesinquiryTblRecList::add); 
				//---------------------------------------------------------------------------- 
 
	if (ErpsalesinquiryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpsalesinquiryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
*/ 
 
 
/* 
// -------------------- FindByColumnName ------------------------- 
 
@GetMapping("erp_sales_inquiry/FindByColumnName")  
public ResponseEntity<List<ErpsalesinquiryTblRec>> ErpsalesinquiryTblRecFindByColumnName(@RequestParam String columnName)  
	throws Exception 
	{   
	try { 
	List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecList = new ArrayList<ErpsalesinquiryTblRec>(); 
 
		ErpsalesinquiryTblRec1Repository.findByColumnName(columnName).forEach(ErpsalesinquiryTblRecList::add); 
		//ErpsalesinquiryTblRec1Repository.findAll().forEach(ErpsalesinquiryTblRecList::add); 
 
	if (ErpsalesinquiryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpsalesinquiryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
*/ 
 
// -------------------- Query ------------------------- 
 
@GetMapping("erp_sales_inquiry/Query")  
public ResponseEntity<List<ErpsalesinquiryTblRec>> ErpsalesinquiryTblRecQuery(@RequestParam("dateofinquiry") @DateTimeFormat(pattern="yyyy-MM-dd")  Calendar dateofinquiry)  
	throws Exception 
	{   
	try { 
	List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecList = new ArrayList<ErpsalesinquiryTblRec>(); 
 
		//ErpsalesinquiryTblRec1Repository.findAll().forEach(ErpsalesinquiryTblRecList::add); 
		ErpsalesinquiryTblRec1Repository.findByDateofinquiry(dateofinquiry).forEach(ErpsalesinquiryTblRecList::add); 
 
	if (ErpsalesinquiryTblRecList.isEmpty()) { 
		return new ResponseEntity<>(HttpStatus.NO_CONTENT); 
	} 
 
	return new ResponseEntity<>(ErpsalesinquiryTblRecList, HttpStatus.OK); 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
  
// -------------------- Create ------------------------- 
 
@PostMapping("erp_sales_inquiry/Create")  
@Transactional 
public ResponseEntity<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecCreate(@RequestBody ErpsalesinquiryTblRec ErpsalesinquiryTblRec1)  
	throws Exception 
	{   
	try { 
	ErpsalesinquiryTblRec _ErpsalesinquiryTblRec = ErpsalesinquiryTblRec1Repository 
			.save(ErpsalesinquiryTblRec1); 
 
			//If using @GeneratedValue for key, e.g. GenerationType.IDENTITY mysql auto_increment on table column, To get back Db Generated Id value, Use Below 
			//.savesaveAndFlush(ErpsalesinquiryTblRec1); 
 
	return new ResponseEntity<>(_ErpsalesinquiryTblRec, HttpStatus.CREATED); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Update ------------------------- 
 
@PutMapping("erp_sales_inquiry/Update")  
@Transactional 
public ResponseEntity<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecUpdate(@RequestParam("dateofinquiry") @DateTimeFormat(pattern="yyyy-MM-dd")  Calendar dateofinquiry, @RequestBody ErpsalesinquiryTblRec ErpsalesinquiryTblRec1)  
	throws Exception 
	{   
	try { 
 
		List<ErpsalesinquiryTblRec> ErpsalesinquiryTblRecRec1 = ErpsalesinquiryTblRec1Repository.findByDateofinquiry(dateofinquiry); 
 
		if (ErpsalesinquiryTblRecRec1.isEmpty()) {  
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);  
		}  
 
		ErpsalesinquiryTblRec ErpsalesinquiryTblRecRec1First = ErpsalesinquiryTblRecRec1.get(0); 
		ErpsalesinquiryTblRec _ErpsalesinquiryTblRec = ErpsalesinquiryTblRec1Repository  
						.save(ErpsalesinquiryTblRec1);  
		return new ResponseEntity<>(_ErpsalesinquiryTblRec, HttpStatus.OK);  
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
// -------------------- Delete ------------------------- 
 
@DeleteMapping("erp_sales_inquiry/Delete")  
@Transactional 
public ResponseEntity<Long> ErpsalesinquiryTblRecDelete(@RequestParam("dateofinquiry") @DateTimeFormat(pattern="yyyy-MM-dd")  Calendar dateofinquiry)  
	throws Exception 
	{   
	try { 
 
	Long delCount = ErpsalesinquiryTblRec1Repository 
			.deleteByDateofinquiry(dateofinquiry); 
			//.deleteAll(); 
	return new ResponseEntity<>(delCount, HttpStatus.OK); 
 
	} catch (Exception e) { 
		System.out.println("Error: Exception:  "+e.getMessage()); 
		//e.printStackTrace(System.out); 
		return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR); 
	} 
} 
 
} 
 
