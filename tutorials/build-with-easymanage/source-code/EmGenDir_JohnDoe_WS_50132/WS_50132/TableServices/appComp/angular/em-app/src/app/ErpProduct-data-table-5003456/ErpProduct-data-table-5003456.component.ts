import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpProductDataSource, ErpProductItem } from './ErpProduct-data-table-5003456-datasource'; 
 
@Component({ 
  selector: 'app-ErpProduct-data-table-5003456', 
  templateUrl: './ErpProduct-data-table-5003456.html', 
  styleUrls: ['./ErpProduct-data-table-5003456.css'] 
}) 
export class ErpProductDataTable_5003456_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpProductItem>; 
  dataSource: ErpProductDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'productId' /* long */ 
 , 'productName' /* String */ 
 , 'productCategory' /* String */ 
 , 'primarySupplier' /* String */ 
 , 'productDesc' /* String */ 
 , 'productPicture' /* byte[] */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpProductDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpProducts(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpProducts() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_product/ViewAll?pageNo=-1") 
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
  
