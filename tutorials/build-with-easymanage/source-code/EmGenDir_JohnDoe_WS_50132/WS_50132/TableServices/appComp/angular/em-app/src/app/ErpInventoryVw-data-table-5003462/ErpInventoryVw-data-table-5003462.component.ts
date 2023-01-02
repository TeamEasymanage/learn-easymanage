import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpInventoryVwDataSource, ErpInventoryVwItem } from './ErpInventoryVw-data-table-5003462-datasource'; 
 
@Component({ 
  selector: 'app-ErpInventoryVw-data-table-5003462', 
  templateUrl: './ErpInventoryVw-data-table-5003462.html', 
  styleUrls: ['./ErpInventoryVw-data-table-5003462.css'] 
}) 
export class ErpInventoryVwDataTable_5003462_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpInventoryVwItem>; 
  dataSource: ErpInventoryVwDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'invId' /* long */ 
 , 'productId' /* long */ 
 , 'productName' /* String */ 
 , 'invDate' /* Calendar */ 
 , 'invQty' /* long */ 
 , 'invMinQty' /* long */ 
 , 'invCost' /* float */ 
 , 'invLocation' /* String */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpInventoryVwDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpInventoryVws(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpInventoryVws() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_inventory_vw/ViewAll?pageNo=-1") 
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
  
