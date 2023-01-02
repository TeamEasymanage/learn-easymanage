import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpInventoryDataSource, ErpInventoryItem } from './ErpInventory-data-table-5003454-datasource'; 
 
@Component({ 
  selector: 'app-ErpInventory-data-table-5003454', 
  templateUrl: './ErpInventory-data-table-5003454.html', 
  styleUrls: ['./ErpInventory-data-table-5003454.css'] 
}) 
export class ErpInventoryDataTable_5003454_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpInventoryItem>; 
  dataSource: ErpInventoryDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'invId' /* long */ 
 , 'productId' /* long */ 
 , 'invDate' /* Calendar */ 
 , 'invQty' /* long */ 
 , 'invMinQty' /* long */ 
 , 'invCost' /* float */ 
 , 'invLocation' /* String */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpInventoryDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpInventorys(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpInventorys() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_inventory/ViewAll?pageNo=-1") 
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
  
