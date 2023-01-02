import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpSalesInquiryDataSource, ErpSalesInquiryItem } from './ErpSalesInquiry-data-table-5003458-datasource'; 
 
@Component({ 
  selector: 'app-ErpSalesInquiry-data-table-5003458', 
  templateUrl: './ErpSalesInquiry-data-table-5003458.html', 
  styleUrls: ['./ErpSalesInquiry-data-table-5003458.css'] 
}) 
export class ErpSalesInquiryDataTable_5003458_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpSalesInquiryItem>; 
  dataSource: ErpSalesInquiryDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'dateofinquiry' /* Calendar */ 
 , 'requestedqty' /* long */ 
 , 'reqquoteamt' /* float */ 
 , 'meetingpreftime' /* Calendar */ 
 , 'created' /* Calendar */ 
 , 'updated' /* Calendar */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpSalesInquiryDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpSalesInquirys(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpSalesInquirys() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_sales_inquiry/ViewAll?pageNo=-1") 
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
  
