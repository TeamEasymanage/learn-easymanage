import { AfterViewInit, Component, ViewChild } from '@angular/core'; 
import { MatPaginator } from '@angular/material/paginator'; 
import { MatSort } from '@angular/material/sort'; 
import { MatTable } from '@angular/material/table'; 
import { HttpClient} from '@angular/common/http'; 
 
import { EmService } from '../em-service/em-service'; 
import { ErpInventorySumVwDataSource, ErpInventorySumVwItem } from './ErpInventorySumVw-data-table-5003460-datasource'; 
 
@Component({ 
  selector: 'app-ErpInventorySumVw-data-table-5003460', 
  templateUrl: './ErpInventorySumVw-data-table-5003460.html', 
  styleUrls: ['./ErpInventorySumVw-data-table-5003460.css'] 
}) 
export class ErpInventorySumVwDataTable_5003460_C implements AfterViewInit { 
  @ViewChild(MatPaginator) paginator!: MatPaginator; 
  @ViewChild(MatSort) sort!: MatSort; 
  @ViewChild(MatTable) table!: MatTable<ErpInventorySumVwItem>; 
  dataSource: ErpInventorySumVwDataSource; 
  emService : EmService; 
 
  /** Columns displayed in the table. Columns IDs can be added, removed, or reordered. */ 
  displayedColumns = [ 
  'year' /* long */ 
 , 'month' /* long */ 
 , 'totalQty' /* float */ 
  ]; 
 
  // Create dataSource with empty data, before calling api  
  data1: Array<any> = [];  
   
  constructor(private http : HttpClient) { 
	this.dataSource = new ErpInventorySumVwDataSource(this.data1); 
 
	this.emService = new EmService(this.http); 
	this.loadErpInventorySumVws(); 
 
  } 
 
  ngAfterViewInit(): void { 
	//this.table.renderRows(); 
  } 
 
	  loadErpInventorySumVws() { 
		//console.log("making api call ") 
		this.emService.GETRecord("/erp_inventory_sum_vw/ViewAll?pageNo=-1") 
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
  
