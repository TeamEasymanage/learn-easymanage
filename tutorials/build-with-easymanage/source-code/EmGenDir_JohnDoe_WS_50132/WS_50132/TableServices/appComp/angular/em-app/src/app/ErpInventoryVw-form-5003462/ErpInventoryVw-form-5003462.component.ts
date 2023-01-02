 
import { Component } from '@angular/core'; 
import { FormBuilder, Validators } from '@angular/forms'; 
import { EmService } from '../em-service/em-service'; 
 
@Component({ 
  selector: 'app-ErpInventoryVw-form-5003462', 
  templateUrl: './ErpInventoryVw-form-5003462.html', 
  styleUrls: ['./ErpInventoryVw-form-5003462.css'] 
}) 
export class ErpInventoryVwForm_5003462_C { 
  ErpInventoryVwForm_5003462_CForm = this.fb.group({ 
		invId : [null, Validators.required], /* long */ 
		productId : [null ], /* long */ 
		productName : [null ], /* String */ 
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
			JSON.stringify(this.ErpInventoryVwForm_5003462_CForm.value), 
			"/erp_inventory_vw/Create") 
		.subscribe(response => { 
				//console.log(response) 
		        console.log("api post call ok"); 
		  		alert('Added!');  
		}); 
 
  } 
} 
 
