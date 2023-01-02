------------------------------------------------------------------ 
Em App Angular base setup project to use along with this generated angular app code: 
 
Download and setup from repository https://github.com/TeamEasymanage/em-app-angular 
Readme: https://github.com/TeamEasymanage/em-app-angular/blob/main/README.md 
 
Then Follow below steps to copy changes/files into that project 
 
------------------------------------------------------------------ 
ADD Following 2 parts to file em-app\src\app\app.module.ts : 
1) Imports 
 
import { ErpCustomerForm_5003452_C } from './ErpCustomer-form-5003452/ErpCustomer-form-5003452.component'; 
import { ErpCustomerDataTable_5003452_C } from './ErpCustomer-data-table-5003452/ErpCustomer-data-table-5003452.component'; 
import { ErpInventoryForm_5003454_C } from './ErpInventory-form-5003454/ErpInventory-form-5003454.component'; 
import { ErpInventoryDataTable_5003454_C } from './ErpInventory-data-table-5003454/ErpInventory-data-table-5003454.component'; 
import { ErpProductForm_5003456_C } from './ErpProduct-form-5003456/ErpProduct-form-5003456.component'; 
import { ErpProductDataTable_5003456_C } from './ErpProduct-data-table-5003456/ErpProduct-data-table-5003456.component'; 
import { ErpSalesInquiryForm_5003458_C } from './ErpSalesInquiry-form-5003458/ErpSalesInquiry-form-5003458.component'; 
import { ErpSalesInquiryDataTable_5003458_C } from './ErpSalesInquiry-data-table-5003458/ErpSalesInquiry-data-table-5003458.component'; 
import { ErpInventorySumVwForm_5003460_C } from './ErpInventorySumVw-form-5003460/ErpInventorySumVw-form-5003460.component'; 
import { ErpInventorySumVwDataTable_5003460_C } from './ErpInventorySumVw-data-table-5003460/ErpInventorySumVw-data-table-5003460.component'; 
import { ErpInventoryVwForm_5003462_C } from './ErpInventoryVw-form-5003462/ErpInventoryVw-form-5003462.component'; 
import { ErpInventoryVwDataTable_5003462_C } from './ErpInventoryVw-data-table-5003462/ErpInventoryVw-data-table-5003462.component'; 
 
2) @NgModule({   declarations: [ AppComponent, 
 
		ErpCustomerForm_5003452_C, 
		ErpCustomerDataTable_5003452_C, 
		ErpInventoryForm_5003454_C, 
		ErpInventoryDataTable_5003454_C, 
		ErpProductForm_5003456_C, 
		ErpProductDataTable_5003456_C, 
		ErpSalesInquiryForm_5003458_C, 
		ErpSalesInquiryDataTable_5003458_C, 
		ErpInventorySumVwForm_5003460_C, 
		ErpInventorySumVwDataTable_5003460_C, 
		ErpInventoryVwForm_5003462_C, 
		ErpInventoryVwDataTable_5003462_C, 
 
------------------------------------------------------------------ 
ADD Following 2 parts to file em-app\src\app\app-routing.module.ts : 
1) Imports 
 
import { ErpCustomerForm_5003452_C } from './ErpCustomer-form-5003452/ErpCustomer-form-5003452.component'; 
import { ErpCustomerDataTable_5003452_C } from './ErpCustomer-data-table-5003452/ErpCustomer-data-table-5003452.component'; 
import { ErpInventoryForm_5003454_C } from './ErpInventory-form-5003454/ErpInventory-form-5003454.component'; 
import { ErpInventoryDataTable_5003454_C } from './ErpInventory-data-table-5003454/ErpInventory-data-table-5003454.component'; 
import { ErpProductForm_5003456_C } from './ErpProduct-form-5003456/ErpProduct-form-5003456.component'; 
import { ErpProductDataTable_5003456_C } from './ErpProduct-data-table-5003456/ErpProduct-data-table-5003456.component'; 
import { ErpSalesInquiryForm_5003458_C } from './ErpSalesInquiry-form-5003458/ErpSalesInquiry-form-5003458.component'; 
import { ErpSalesInquiryDataTable_5003458_C } from './ErpSalesInquiry-data-table-5003458/ErpSalesInquiry-data-table-5003458.component'; 
import { ErpInventorySumVwForm_5003460_C } from './ErpInventorySumVw-form-5003460/ErpInventorySumVw-form-5003460.component'; 
import { ErpInventorySumVwDataTable_5003460_C } from './ErpInventorySumVw-data-table-5003460/ErpInventorySumVw-data-table-5003460.component'; 
import { ErpInventoryVwForm_5003462_C } from './ErpInventoryVw-form-5003462/ErpInventoryVw-form-5003462.component'; 
import { ErpInventoryVwDataTable_5003462_C } from './ErpInventoryVw-data-table-5003462/ErpInventoryVw-data-table-5003462.component'; 
 
2) const routes: Routes = [ 
 
	{ path: 'ErpCustomerForm_5003452_C', component: ErpCustomerForm_5003452_C },  
	{ path: 'ErpCustomerDataTable_5003452_C', component: ErpCustomerDataTable_5003452_C },  
	{ path: 'ErpInventoryForm_5003454_C', component: ErpInventoryForm_5003454_C },  
	{ path: 'ErpInventoryDataTable_5003454_C', component: ErpInventoryDataTable_5003454_C },  
	{ path: 'ErpProductForm_5003456_C', component: ErpProductForm_5003456_C },  
	{ path: 'ErpProductDataTable_5003456_C', component: ErpProductDataTable_5003456_C },  
	{ path: 'ErpSalesInquiryForm_5003458_C', component: ErpSalesInquiryForm_5003458_C },  
	{ path: 'ErpSalesInquiryDataTable_5003458_C', component: ErpSalesInquiryDataTable_5003458_C },  
	{ path: 'ErpInventorySumVwForm_5003460_C', component: ErpInventorySumVwForm_5003460_C },  
	{ path: 'ErpInventorySumVwDataTable_5003460_C', component: ErpInventorySumVwDataTable_5003460_C },  
	{ path: 'ErpInventoryVwForm_5003462_C', component: ErpInventoryVwForm_5003462_C },  
	{ path: 'ErpInventoryVwDataTable_5003462_C', component: ErpInventoryVwDataTable_5003462_C },  
 
------------------------------------------------------------------ 
ADD Following 1 parts to file em-app\src\app\em-nav\em-nav.component.html : 
1) SideNav Menu Links 
 
		<a mat-list-item href="/ErpCustomerForm_5003452_C">ErpCustomerForm_5003452</a> 
		<a mat-list-item href="/ErpCustomerDataTable_5003452_C">ErpCustomerDataTable_5003452</a> 
		<a mat-list-item href="/ErpInventoryForm_5003454_C">ErpInventoryForm_5003454</a> 
		<a mat-list-item href="/ErpInventoryDataTable_5003454_C">ErpInventoryDataTable_5003454</a> 
		<a mat-list-item href="/ErpProductForm_5003456_C">ErpProductForm_5003456</a> 
		<a mat-list-item href="/ErpProductDataTable_5003456_C">ErpProductDataTable_5003456</a> 
		<a mat-list-item href="/ErpSalesInquiryForm_5003458_C">ErpSalesInquiryForm_5003458</a> 
		<a mat-list-item href="/ErpSalesInquiryDataTable_5003458_C">ErpSalesInquiryDataTable_5003458</a> 
		<a mat-list-item href="/ErpInventorySumVwForm_5003460_C">ErpInventorySumVwForm_5003460</a> 
		<a mat-list-item href="/ErpInventorySumVwDataTable_5003460_C">ErpInventorySumVwDataTable_5003460</a> 
		<a mat-list-item href="/ErpInventoryVwForm_5003462_C">ErpInventoryVwForm_5003462</a> 
		<a mat-list-item href="/ErpInventoryVwDataTable_5003462_C">ErpInventoryVwDataTable_5003462</a> 
 
------------------------------------------------------------------ 
COPY All the generated component dirs from here (current dir) to dir: em-app\src\app\ : 
 
