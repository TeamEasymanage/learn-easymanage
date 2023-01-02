 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpInventory-form-5003454', 
  templateUrl: './ErpInventory-form-5003454.html', 
  styleUrls: ['./ErpInventory-form-5003454.css'] 
}) 
export class ErpInventoryForm_5003454_C { 
  ErpInventoryForm_5003454_CForm = this.fb.group({ 
		invId : [null, Validators.required], /* long */ 
		productId : [null ], /* long */ 
		invDate : [null ], /* Calendar */ 
		invQty : [null ], /* long */ 
		invMinQty : [null ], /* long */ 
		invCost : [null ], /* float */ 
		invLocation : [null ], /* String */ 
 
				/* [null, Validators.compose([ 
						Validators.required, 
						Validators.pattern('^[0-9]+$') 
						Validators.pattern('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$') 
							]) ]  */ 
 }); 
 
  constructor(private fb: FormBuilder, private emService : EmService) {} 
 
  onSubmit(): void { 
	this.emService.POSTRecord( 
			JSON.stringify(this.ErpInventoryForm_5003454_CForm.value), 
			"/erp_inventory/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
