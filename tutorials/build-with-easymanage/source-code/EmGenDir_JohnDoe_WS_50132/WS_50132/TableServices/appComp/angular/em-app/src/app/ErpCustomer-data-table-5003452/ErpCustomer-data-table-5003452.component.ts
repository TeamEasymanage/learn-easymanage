import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpCustomerDataSource, ErpCustomerItem } from './ErpCustomer-data-table-5003452-datasource'; 
 
@Component({ 
  selector: 'app-ErpCustomer-data-table-5003452', 
  templateUrl: './ErpCustomer-data-table-5003452.html', 
  styleUrls: ['./ErpCustomer-data-table-5003452.css'] 
}) 
export class ErpCustomerDataTable_5003452_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpCustomerItem>; 
  dataSource: ErpCustomerDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'customerId' /* String */ 
 , 'name' /* String */ 
 , 'phone' /* String */ 
 , 'mobilePhone' /* String */ 
 , 'pict' /* byte[] */ 
 , 'email' /* String */ 
 , 'website' /* String */ 
 , 'address' /* String */ 
 , 'dateofinquiry' /* Calendar */ 
 , 'requestedqty' /* long */ 
 , 'reqquoteamt' /* float */ 
 , 'meetingpreftime' /* Calendar */ 
 , 'created' /* Calendar */ 
 , 'updated' /* Calendar */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpCustomerDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpCustomers(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpCustomers() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_customer/ViewAll?pageNo=-1") 
		  .subscribe((response) =>  { 
			  this.dataSource.data = response.body; 
			  this.dataSource.sort = this.sort;  
			  this.dataSource.paginator = this.paginator;  
			  this.table.dataSource = this.dataSource;  
			  //console.log('Headers = ', response.headers); 
			  //console.log('JSON Response = ', JSON.stringify(response.body)); 
			  console.log("api get call ok"); 
			}) 
		//console.log("post api call") 
	  }  
 
} 
  
